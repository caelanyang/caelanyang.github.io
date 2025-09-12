# Gemini Code Assistant Context

This document provides context for the Gemini Code Assistant to understand and effectively assist with this project.

## Project Overview

This is a personal blog built with [Jekyll](https://jekyllrb.com/) and the [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) theme. The site is configured to be deployed on GitHub Pages.

### Key Technologies

*   **Jekyll:** A static site generator written in Ruby.
*   **Minimal Mistakes:** A flexible, responsive Jekyll theme.
*   **GitHub Pages:** The hosting platform for the website.

### Directory Structure

*   `_config.yml`: Main Jekyll configuration file. Contains site-wide settings like title, author information, and theme customizations.
*   `_posts/`: Contains the blog posts, written in Markdown.
*   `_moments/`: A collection of short, timestamped notes, similar to a timeline or "moments".
*   `assets/`: Contains static assets like CSS, images, and JavaScript.
*   `_site/`: The generated static website. This directory is not version-controlled.
*   `Gemfile`: Lists the Ruby gems (dependencies) for the project.
*   `README.md`: Provides an overview of the project and instructions for setup and development.

## Building and Running

To work on this project locally, you need to have Ruby and Bundler installed.

1.  **Install dependencies:**
    ```bash
    bundle install
    ```

2.  **Run the local development server:**
    ```bash
    bundle exec jekyll serve --livereload
    ```

The site will be available at `http://127.0.0.1:4000`. The `--livereload` option automatically refreshes the browser when you make changes to the files.

## Development Conventions

*   **Content:** New blog posts should be created in the `_posts` directory with the filename format `YYYY-MM-DD-title.md`.
*   **Styling:** Custom styles should be added to `assets/css/main.scss`.
*   **Theme Customization:** The site uses the `remote_theme` feature, so theme files are not directly present in the repository. To override theme components, create files with the same name in the corresponding directories (e.g., `_includes`, `_layouts`).
*   **Dependencies:** Project dependencies are managed with Bundler. Add new gems to the `Gemfile` and run `bundle install`.
