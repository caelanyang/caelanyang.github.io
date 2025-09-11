# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Start development server with live reload
bundle exec jekyll serve --livereload

# For network access (useful with VM or container)
bundle exec jekyll serve --livereload --host 0.0.0.0 --port 4000
```

Site will be available at http://127.0.0.1:4000

### Ruby Environment
```bash
# Use Ruby 3.4.5 or later (managed via rbenv)
rbenv install 3.4.5
rbenv local 3.4.5
eval "$(rbenv init -)"
```

### Build Commands
```bash
# Production build
JEKYLL_ENV=production bundle exec jekyll build --trace

# Development build
bundle exec jekyll build
```

## Architecture Overview

This is a Jekyll-based personal blog using the Minimal Mistakes theme via `remote_theme`. The site features dynamic theme switching, moments collection, and is deployed automatically to GitHub Pages.

### Key Architecture Decisions

- **Remote Theme**: Uses `mmistakes/minimal-mistakes` via `remote_theme` instead of forking, enabling automatic theme updates
- **Dynamic Theme Switching**: 10 color themes with localStorage persistence and bottom-left theme selector
- **Moments Collection**: Timeline-style display for short image/text content similar to social media posts
- **Bilingual Content**: Primarily Chinese content with English navigation elements
- **GitHub Pages**: Automated deployment via GitHub Actions workflow

### Directory Structure

- `_config.yml` - Site configuration, author profile, navigation, Jekyll settings, and collections
- `_posts/` - Blog posts following Jekyll naming convention (`YYYY-MM-DD-title.md`)
- `_moments/` - Moments collection for timeline content (output: false, sort_by: date)
- `assets/css/main.scss` - Imports theme and custom theme stylesheets
- `assets/css/themes.scss` - CSS variables for 10 different color themes
- `_includes/head/custom.html` - Theme switcher JavaScript and CSS links
- `_includes/footer/custom.html` - Theme switcher HTML interface
- `moments.md` - Moments timeline page with complete HTML/CSS/JS implementation
- `.github/workflows/pages.yml` - CI/CD pipeline for GitHub Pages deployment

### Theme System Architecture

- **Theme Switcher**: Bottom-left floating button with 10 theme options
- **Theme Storage**: User preference persisted in localStorage as `selected-theme`
- **Theme Variables**: CSS custom properties defined in `themes.scss` for each theme
- **Theme Application**: JavaScript dynamically applies theme classes to document body
- **Responsive Design**: Theme switcher adapts to mobile screens with smaller buttons

### Moments Collection System

- **Collection Configuration**: Jekyll collection `_moments` with `output: false` and `sort_by: date`
- **Content Format**: YAML front matter with date, images[], link{}, tags[], and markdown content
- **Display Features**: 
  - Responsive masonry-style timeline layout
  - Image galleries with modal lightbox
  - Link previews with thumbnails
  - Tag display and organization
  - Date formatting in Chinese locale
- **Content Sources**: 60+ existing moment files from 2020-2024

### Content Management

- Posts support Front Matter with layout, author_profile, read_time, comments, share, and related settings
- Chinese language content with `locale: zh-CN` and custom date format `"%Y年%-m月%-d日"`
- Organized by categories, tags, and year archive pages
- Author profile updated with Guangzhou location and multiple social links

### Deployment Pipeline

- **Trigger**: Pushes to main branch, manual dispatch, or weekly schedule (Monday 10:00 CST)
- **Ruby Version**: 3.4.5 with bundler cache and rbenv initialization
- **Build Process**: Standard Jekyll build with production environment
- **Theme Updates**: Weekly scheduled builds automatically pull latest theme updates

### Custom Features Implementation

- **Theme Switching**: Pure JavaScript with CSS variable manipulation, no dependencies
- **Moments Timeline**: Custom HTML/CSS/JS with responsive grid layout and image handling
- **Asset Management**: Downloaded avatar and favicon from source website during migration
- **Safe Customization**: All customizations preserve theme update compatibility