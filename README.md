# dev-docs
Developer documentation available on https://iobroker.github.io/dev-docs/

## Development

**Note:** Don't use git bash under Windows!

Use either docker or native (working python environment required) to run server and then browse to http://localhost:8000

### Native

Install: 
```
pip install mkdocs-material mkdocs-git-revision-date-localized-plugin mkdocs-include-dir-to-nav
```

Run:
```
mkdocs serve
```

### Docker

Linux:
```
docker build . -t mkdocs-iobroker
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs mkdocs-iobroker
```

Windows:
```
docker build . -t mkdocs-iobroker
docker run --rm -it -p 8000:8000 -v "%cd%":/docs mkdocs-iobroker
```