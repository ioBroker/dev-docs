# dev-docs
Developer documentation available on https://iobroker.github.io/dev-docs/

## Development

**Note:** Don't use git bash under Windows!

Linux / MacOS / Windows(PowerShell):
```
docker build . -t mkdocs-iobroker
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs mkdocs-iobroker
```

Windows(cmd):
```
docker build . -t mkdocs-iobroker
docker run --rm -it -p 8000:8000 -v "%cd%":/docs mkdocs-iobroker
```
