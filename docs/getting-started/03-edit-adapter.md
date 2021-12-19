# Write adapter code

This is just some dummy text to show code in JavaScript and TypeScript:

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

[Continue to "Publishing your adapter"](04-publish-adapter.md){ .md-button .md-button--primary }