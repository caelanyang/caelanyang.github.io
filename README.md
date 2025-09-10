# 个人网站（Minimal Mistakes）

基于 [mmistakes/minimal-mistakes](https://github.com/mmistakes/minimal-mistakes) 主题构建，使用 `remote_theme`，便于安全定制和后续无痛升级。

## 本地预览

- 安装 Ruby（macOS 推荐 `rbenv`/`asdf`）。
- 安装依赖并启动：

```bash
bundle install
bundle exec jekyll serve --livereload
```

访问 http://127.0.0.1:4000

## 目录结构

- `_config.yml` 站点配置（标题、导航、作者信息、插件等）
- `_posts/` 文章目录（`YYYY-MM-DD-title.md`）
- `assets/css/main.scss` 自定义样式（先引入主题，再写覆盖样式）
- `_data/navigation.yml` 顶部导航
- `index.md` 首页（最新文章）
- `about.md`、`categories.md`、`tags.md`、`year-archive.md` 常用页面

## 安全定制建议

- 使用 `remote_theme`，避免直接 fork 主题代码。
- 自定义样式放在 `assets/css/main.scss`，不改主题源文件。
- 复写布局/包含：在 `_layouts/`、`_includes/` 新建同名文件即可覆盖（按需）。
- 配色换肤：修改 `_config.yml` 中 `minimal_mistakes_skin`，或把 `assets/css/main.scss` 的 `@import` 皮肤改为对应名称。

## 升级策略

- 因为使用 `remote_theme: mmistakes/minimal-mistakes@latest`，每次重新构建都会拉取最新主题。
- 可在 GitHub Actions 中设定定时构建（`.github/workflows/pages.yml`），定期触发以获取更新。
- 若担心 breaking changes，可把 `@latest` 换成固定版本 tag，并按需升级。

## 迁移旧博客内容（blogdown -> Jekyll）

- 工作流会自动检出仓库 `caelanyang/blogdown`（分支 `master`），并通过 `scripts/migrate_blogdown_to_jekyll.rb` 将 `content/` 下的 Markdown/HTML（带 Front Matter）转换到本仓库的 `_posts/`。
- Hugo 的 `_index.md` 会自动跳过。源文章若无日期，将从文件名或当前时间推断。
- 如需本地执行：

```bash
ruby scripts/migrate_blogdown_to_jekyll.rb ../path/to/blogdown/content _posts
```

## 部署到 GitHub Pages

开启仓库的 Pages（Settings -> Pages），Source 选择 `GitHub Actions`。本仓库已包含工作流文件，推送后会自动构建与发布。

## 写作示例

新建 `_posts/2025-09-10-hello-world.md`，参考已有示例 Front Matter。

---

如需 SEO、评论系统（Giscus/Disqus）或统计（Plausible/GA），可根据 Minimal Mistakes 文档在 `_config.yml` 增加配置。