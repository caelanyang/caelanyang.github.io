# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Start development server with live reload
bundle exec jekyll serve --livereload
```

Site will be available at http://127.0.0.1:4000

### Build Commands
```bash
# Production build
JEKYLL_ENV=production bundle exec jekyll build --trace

# Development build
bundle exec jekyll build
```

## Architecture Overview

This is a Jekyll-based personal blog using the Minimal Mistakes theme via `remote_theme`. The site is deployed automatically to GitHub Pages.

### Key Architecture Decisions

- **Remote Theme**: Uses `mmistakes/minimal-mistakes` via `remote_theme` instead of forking, enabling automatic theme updates
- **Bilingual Content**: Primarily Chinese content with English navigation elements
- **GitHub Pages**: Automated deployment via GitHub Actions workflow

### Directory Structure

- `_config.yml` - Site configuration, author profile, navigation, and Jekyll settings
- `_posts/` - Blog posts following Jekyll naming convention (`YYYY-MM-DD-title.md`)
- `_data/navigation.yml` - Top navigation menu structure
- `assets/css/main.scss` - Custom styles that override theme defaults
- `.github/workflows/pages.yml` - CI/CD pipeline for GitHub Pages deployment

### Theme Customization Approach

- **Safe Customization**: All customizations are update-safe by using overrides instead of modifying theme files
- **Style Overrides**: Custom styles in `assets/css/main.scss` load after theme styles
- **Layout Overrides**: Can create files in `_layouts/` or `_includes/` to override theme components
- **Skin Selection**: Theme appearance controlled via `minimal_mistakes_skin` in config

### Content Management

- Posts support Front Matter with layout, author_profile, read_time, comments, share, and related settings
- Chinese language content with `locale: zh-CN` configuration
- Organized by categories, tags, and year archive pages

### Deployment Pipeline

- **Trigger**: Pushes to main branch, manual dispatch, or weekly schedule (Monday 10:00 CST)
- **Ruby Version**: 3.2 with bundler cache
- **Build Process**: Standard Jekyll build with production environment
- **Theme Updates**: Weekly scheduled builds automatically pull latest theme updates