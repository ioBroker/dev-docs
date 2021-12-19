# Install tools

## Development computer

We suggest you develop on your own computer and not on the system where you might already have your ioBroker installation running.

It is much easier to do local development and then later deploy the adapter to your real installation once everything is working.

*Note:* There is no need to install ioBroker on your computer to develop an adapter.

## Install NodeJS

To develop for ioBroker you need the current NodeJS LTS version installed on your PC. If you installed ioBroker, NodeJS is already on your system, otherwise download and install it from the following sources:

- [Windows / Mac](https://nodejs.org/en/download/)
- [Debian and Ubuntu based distributions (deb)](https://github.com/nodesource/distributions#debinstall)
- [Enterprise Linux based distributions (rpm)](https://github.com/nodesource/distributions#rpm)
- [All other systems](https://nodejs.org/en/download/#:~:text=Additional%20Platforms)

## Install Visual Studio Code

As an IDE (integrated development environment) we will use Visual Studio Code.

Please download it from the [official page](https://code.visualstudio.com/download).

## Install ioBroker dev-server

The easiest way to develop adapters is using [dev-server](https://github.com/ioBroker/dev-server#readme).

Simply execute the following command in your console/terminal:

``` bash
npm install --global @iobroker/dev-server
```

[Continue to "Creating your first adapter"](02-create-adapter.md){ .md-button .md-button--primary }
