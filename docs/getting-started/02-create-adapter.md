# Creating your first adapter

To get you started with writing an ioBroker adapter, we will create a simple adapter for getting the [number of page views](https://wikitech.wikimedia.org/wiki/Analytics/AQS/Pageviews) for ioBroker's [German Wikipedia page](https://de.wikipedia.org/wiki/IoBroker).

<!-- Note: use this URL as a base: https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/de.wikipedia/all-access/all-agents/IoBroker/daily/20210901/20210930 -->

First, run the [adapter creator](https://github.com/ioBroker/create-adapter) in a directory where you want to keep your ioBroker code.[^1] The creator will create a new subdirectory for your new adapter.
[^1]: We suggest using a local directory and regularly push local changes to GitHub for backup and transport instead of relying on full directory synchronization (like Nextcloud, Dropbox, iCloud or similar), because they might break the git repository structure or dev-server or npm dependencies.

``` bash
npx @iobroker/create-adapter
```

It is recommended to try creator with dummy data the first few times. For this getting started you can enter dummy data and select random options (play around) for the most questions. You can decide if you want to do Javascript or Typescript. The only important options to follow the getting started are:

<!-- TODO: this needs to change if https://github.com/ioBroker/create-adapter/issues/724 gets fixed. -->
* `Adapter` (instead of `Visualization`)
* `no` to React for Admin UI
* `yes` to dev-server

You can have a look at the folders and files created. It is a complete template of an ioBroker adapter. The most important
file is `main.js` or `main.ts` where your code goes. The UI for controlling options of your adapter goes into `admin`.

Now move into your adapter dir and fire up dev-server:
```bash
cd ioBroker.test
dev-server watch
```

It will run ioBroker and you can access admin at http://localhost:8081

[Continue to "Write adapter code"](03-edit-adapter.md){ .md-button .md-button--primary }