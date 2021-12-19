FROM squidfunk/mkdocs-material:latest

RUN pip install \
    mkdocs-include-dir-to-nav \
    mkdocs-git-revision-date-localized-plugin
