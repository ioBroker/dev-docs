# ioBroker Developer Documentation

Developer documentation available on https://iobroker.github.io/dev-docs/

## Contribute

This documentation uses [MkDocs](https://www.mkdocs.org/getting-started/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/).

```
pip install -r requirements.txt
mkdocs serve
```

Alternatively from within Docker:

```
docker build -t iobroker-dev-docs .
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs iobroker-dev-docs
```