# Documentation style guide

## Code blocks

When providing code examples, ensure to provide those examples for JavaScript and TypeScript. **Code examples should be indented with 4 spaces.**

```
=== "JavaScript"

    ``` js
    class TestAdapter extends utils.Adapter {
        /**
        * @param {Partial<utils.AdapterOptions>} [options={}]
        */
        constructor(options) {
            super({
                ...options,
                name: 'test-adapter',
            });
            this.on('ready', this.onReady.bind(this));
            this.on('stateChange', this.onStateChange.bind(this));
            // this.on('objectChange', this.onObjectChange.bind(this));
            // this.on('message', this.onMessage.bind(this));
            this.on('unload', this.onUnload.bind(this));
        }
    }
    ```

=== "TypeScript"

    ``` ts
    class TestAdapter extends utils.Adapter {

        public constructor(options: Partial<utils.AdapterOptions> = {}) {
            super({
                ...options,
                name: "test-adapter",
            });
            this.on("ready", this.onReady.bind(this));
            this.on("stateChange", this.onStateChange.bind(this));
            // this.on("objectChange", this.onObjectChange.bind(this));
            // this.on("message", this.onMessage.bind(this));
            this.on("unload", this.onUnload.bind(this));
        }
    }
    ```
```

## Links

When you create links to other documents, please use the regular markdown link outline like

``` markdown
See [getting started](../getting-started/01-installation.md) for further details.
```

You can also link to another document by using a button:

``` markdown
[Continue to "Creating your first adapter"](02-create-adapter.md){ .md-button .md-button--primary }
```

MkDocs will replace these **relative** links automatically. Don't use absolute paths!