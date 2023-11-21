# Write adapter code

For network communication the adapter relies on the axios module, let's add it. In adapter dir run this:

```bash
npm install --save-prod axios
```

Additionally, we need to import axios in `main.js` or `main.ts` as follows. Please add the line at the top of the main 
file (there should already be a line containing the `require` function there, best is to keep all imports in one place).

=== "JavaScript"
    ```js
    const axios = require("axios").default;
    ```
=== "TypeScript"
    ```ts
    import axios from 'axios';
    ```

Now have a look at the boilerplate and example code in `main.js` or `main.ts`. You should see a Class with a constructor 
where eventHandlers are added to `ready`, `stateChange` and `unload` by default. These are the functions that ioBroker 
will call in your code. First we will implement to download some data from the API in `onReady` after the adapter start.

You should read the examples in the `onReady` function that already explain how the adapter interacts with ioBroker in a
lot of common examples. Feel free to try different things here, too. If you create objects and set states you can see 
the results of your actions in the [dev-server admin](http://localhost:8081/#tab-objects). 

Now let's retrieve some data in the `onReady` function. Replace the existing code with this:
=== "JavaScript"

    ``` js
    async onReady() {
        //download data:
		const url = "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/de.wikipedia/all-access/all-agents/IoBroker/daily/20220401/20220404";
		try {
			const response = await axios.get(url);
			if (response.status === 200) {
				const data = response.data;

				//for each day:
				for (const day of data.items) {
					//create object, using timestamp as ID. ID should always be unique and constant for a certain device.
					await this.setObjectNotExistsAsync(day.timestamp, {
						type: "state",
						common: {
							type: "number",
							role: "state",
							read: true,
							write: false,
							name: `Day ${day.timestamp}`
						},
						native: {}
					});

					//now set the value of the state. Set 'ack' to true in order to show ioBroker that this data comes from the 'device'.
					await this.setStateAsync(day.timestamp, day.views, true);
				}
			} else {
				this.log.error("Could not retrieve data, status code " + response.status);
			}
		} catch (e) {
			this.log.error("Could not retrieve data: " + e.message);
		}
    }
    ```

=== "TypeScript"

    ``` ts
    private async onReady(): Promise<void> {
		//download data:
		const url = 'https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/de.wikipedia/all-access/all-agents/IoBroker/daily/20220401/20220404';
		try {
			const response = await axios.get(url);
			if (response.status === 200) {
				const data = response.data;

				//for each day:
				for (const day of data.items) {
					//create object, using timestamp as ID. ID should always be unique and constant for a certain device.
					await this.setObjectNotExistsAsync(day.timestamp, {
						type: 'state',
						common: {
							type: 'number',
							role: 'state',
							read: true,
							write: false,
							name: `Day ${day.timestamp}`
						},
						native: {}
					});

					//now set the value of the state. Set 'ack' to true in order to show ioBroker that this data comes from the 'device'.
					await this.setStateAsync(day.timestamp, day.views, true);
				}
			} else {
				this.log.error('Could not retrieve data, status code ' + response.status);
			}
		} catch (e: any) {
			this.log.error('Could not retrieve data: ' + e.message);
		}
	}
    ```

If you have `dev-server watch` running as explained earlier this should already create a few objects with values in 
ioBroker on file save. But currently this is very static code. Let's allow the user to select a date. 

We start by defining the parameters for our adapter in `io-package.json`, change the `native` section to this:

```json
"native": {
	"startDate": "20220401",
	"endDate": "20220404"
},
```
JSON UI allows us to easily add an options page in ioBroker.admin without minding frontend code at all. The UI is defined in `admin/jsonConfig.json`, 
so we change it to reflect our new options:
```json
{
  "type": "panel",
  "i18n": true,
  "items": {
    "startDate": {
      "newLine": true,
      "type": "text",
      "label": "Start Date:",
      "maxLength": 8,
      "validator": "/[0-9]{8}/.test(data.startDate)"
    },
    "endDate": {
      "type": "text",
      "label": "End Date:",
      "maxLength": 8,
      "validator": "/[0-9]{8}/.test(data.endDate)"
    },
    "_errorMessage": {
      "newLine": true,
      "type": "staticText",
      "text": "Please enter Date in format YYYYMMDD.",
      "hidden": "/[0-9]{8}/.test(data.startDate) && /[0-9]{8}/.test(data.endDate)",
      "style": {
        "color": "red"
      }
    }
  }
}
```

For typescript Adapters, also change `src/lib/adminConfig.ts` to this:
=== "TypeScript"
    ```ts
    // This file extends the AdapterConfig type from "@types/iobroker"

    // Augment the globally declared type ioBroker.AdapterConfig
    declare global {
	    namespace ioBroker {
    		interface AdapterConfig {
		    	startDate: string;
			    endDate: string;
		    }
	    }
    }

    // this is required so the above AdapterConfig is found by TypeScript / type checking
    export {};
    ```

Hint: In order for changes to `io-package.json` and `jsonConfig.json` an upload is required. You can do that by running
`dev-server upload` in your adapter directory.

It will add two text fields in configuration where the user can select start and enddates for our page views request. Now
we need to adjust the `onReady` code to read the config and adjust the request.

=== "JavaScript"
    ``` js
    async onReady() {
        const adapterObjects = await this.getAdapterObjectsAsync(); //get all current adapter objects. 

        //download data:
        const url = `https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/de.wikipedia/all-access/all-agents/IoBroker/daily/${this.config.startDate}/${this.config.endDate}`;
        try {
            const response = await axios.get(url);
            if (response.status === 200) {
                const data = response.data;

				//for each day:
				for (const day of data.items) {
					//create object, using timestamp as ID. ID should always be unique and constant for a certain device.
					await this.setObjectNotExistsAsync(day.timestamp, {
						type: 'state',
						common: {
							type: 'number',
							role: 'state',
							read: true,
							write: false,
							name: `Day ${day.timestamp}`
						},
						native: {}
					});

					//now set the value of the state. Set 'ack' to true in order to show ioBroker that this data comes from the 'device'.
					await this.setStateAsync(day.timestamp, day.views, true);
					//remove used objects from the hashmap.
					//NOTE: usually we can omit 'test.x.' on our own objects, but getAdapterObjects fills the hashmap for full ids.
					delete adapterObjects[this.namespace + '.' + day.timestamp];
				}

				//delete all Objects that were not used above:
				for (const id of Object.keys(adapterObjects)) {
					await this.delObjectAsync(id);
				}
			} else {
				this.log.error('Could not retrieve data, status code ' + response.status);
			}
		} catch (e) {
			this.log.error('Could not retrieve data: ' + e.message);
		}
	}
    ```
=== "TypeScript"
    ``` ts
    private async onReady(): Promise<void> {
        const adapterObjects = await this.getAdapterObjectsAsync(); //get all current adapter objects.
		//download data:
		const url = `https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/de.wikipedia/all-access/all-agents/IoBroker/daily/${this.config.startDate}/${this.config.endDate}`;
		try {
			const response = await axios.get(url);
			if (response.status === 200) {
				const data = response.data;

				//for each day:
				for (const day of data.items) {
					//create object, using timestamp as ID. ID should always be unique and constant for a certain device.
					await this.setObjectNotExistsAsync(day.timestamp, {
						type: 'state',
						common: {
							type: 'number',
							role: 'state',
							read: true,
							write: false,
							name: `Day ${day.timestamp}`
						},
						native: {}
					});

					//now set the value of the state. Set 'ack' to true in order to show ioBroker that this data comes from the 'device'.
					await this.setStateAsync(day.timestamp, day.views, true);
					//remove used objects from the hashmap.
					//NOTE: usually we can omit 'test.x.' on our own objects, but getAdapterObjects fills the hashmap for full ids.
					delete adapterObjects[this.namespace + '.' + day.timestamp];
				}

				//delete all Objects that were not used above:
				for (const id of Object.keys(adapterObjects)) {
					await this.delObjectAsync(id);
				}
			} else {
				this.log.error('Could not retrieve data, status code ' + response.status);
			}
		} catch (e: any) {
			this.log.error('Could not retrieve data: ' + e.message);
		}
	}
    ```

Of course, you would need to add a few checks for the user input. Also loading only once in the `onReady` function is only
useful for schedule Adapter, daemons usually employ `setTimeout` to regularly download something or even listen
on events coming from the outside. But this should give you a basic idea on how to fill ioBroker states from an API request.

If you want to listen to state changes (i.e. the user wants to control a device) this happens in `onStateChange`. Feel
free to experiment with that also (you could create a state of type `boolean` with role `button` that you can click in 
admin and poll new data or similar).[^1]
[^1]: To be honest we did not yet find a sensible example for the getting started guide. If you have some idea or know
of a free to use and very stable API that could be helpful for such a tutorial, feel free to [create an issue on github](https://github.com/ioBroker/dev-docs/issues).

[Continue to "Publishing your adapter"](04-publish-adapter.md){ .md-button .md-button--primary }