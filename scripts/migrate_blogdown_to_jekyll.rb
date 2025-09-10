#!/usr/bin/env ruby
# Migrate Hugo/blogdown content to Jekyll posts
# Usage: ruby scripts/migrate_blogdown_to_jekyll.rb <source_content_dir> <dest_posts_dir>

require 'yaml'
require 'time'
require 'fileutils'

def read_front_matter(path)
  content = File.read(path)
  if content.start_with?("---\n")
    # Extract YAML front matter
    parts = content.split(/^---\s*$\n/, 3)
    # parts[0] is empty before first ---
    if parts.length >= 3
      fm_text = parts[1]
      body = parts[2]
      begin
        fm = YAML.safe_load(fm_text, permitted_classes: [Date, Time], aliases: true) || {}
      rescue => e
        warn "YAML parse error in #{path}: #{e}"
        fm = {}
      end
      return [fm, body]
    end
  end
  [nil, content]
end

def slugify(str)
  s = (str || '').dup
  s = s.downcase
  # remove non-word except spaces and hyphens
  s = s.gsub(/[^\p{Alnum}\s-]/u, '')
  s = s.strip.gsub(/\s+/, '-').gsub(/-+/, '-')
  s.empty? ? 'post' : s
end

def ensure_array(v)
  return [] if v.nil? || v == ''
  return v if v.is_a?(Array)
  [v]
end

def extract_dates(date_val, fname)
  # Returns [date_prefix (YYYY-MM-DD), iso]
  if date_val
    begin
      t = Time.parse(date_val.to_s)
      return [t.strftime('%Y-%m-%d'), t.iso8601]
    rescue
      # fall through
    end
  end
  if File.basename(fname) =~ /(\d{4}-\d{2}-\d{2})/
    d = $1
    return [d, Time.parse(d).iso8601]
  end
  t = Time.now
  [t.strftime('%Y-%m-%d'), t.iso8601]
end

def target_ext(src_ext)
  # Keep .html as .html, otherwise .md
  return '.html' if src_ext.downcase == '.html'
  '.md'
end

src = ARGV[0] || 'blogdown-src/content'
dest = ARGV[1] || '_posts'

unless Dir.exist?(src)
  abort "Source content directory not found: #{src}"
end

FileUtils.mkdir_p(dest)

paths = Dir.glob(File.join(src, '**', '*.{md,markdown,html}'))
paths.reject! { |p| File.basename(p).downcase == '_index.md' }

count = 0
paths.each do |path|
  fm, body = read_front_matter(path)
  next unless fm # skip files without front matter

  title = fm['title'] || File.basename(path, '.*')
  slug = fm['slug'] || slugify(title)
  date_prefix, iso = extract_dates(fm['date'], path)
  cats = ensure_array(fm['categories'])
  tags = ensure_array(fm['tags'])

  out_name = "#{date_prefix}-#{slug}#{target_ext(File.extname(path))}"
  out_path = File.join(dest, out_name)

  front = {
    'layout' => 'single',
    'title' => title,
    'date' => iso,
    'categories' => cats,
    'tags' => tags,
    'author_profile' => true
  }
  front['slug'] = fm['slug'] if fm['slug']

  File.open(out_path, 'w:utf-8') do |f|
    f.puts '---'
    f.puts front.to_yaml.sub(/^---\n/, '')
    f.puts '---'
    f.puts
    f.write body.to_s
  end
  count += 1
end

puts "Migrated #{count} posts from #{src} -> #{dest}"
