# Adapter Translations

Whenever possible, adapters should provide multiple languages for everything the user will see. Like

- Adapter name
- Adapter description
- Adapter news
- Object names
- Instance configuration inputs
- VIS widgets
- End user documentation / help
- ...

## Languages

| Code      | Required         | Language   |
|-----------|------------------|------------|
| ``en``    | :material-check: | English    |
| ``de``    |                  | German     |
| ``ru``    |                  | Russian    |
| ``pt``    |                  | Portuguese |
| ``nl``    |                  | Dutch      |
| ``fr``    |                  | French     |
| ``it``    |                  | Italian    |
| ``es``    |                  | Spanish    |
| ``pl``    |                  | Polish     |
| ``zh-cn`` |                  | Chinese    |

## Translation tools

### Dev-Tools

<!-- Note: source https://github.com/ioBroker/adapter-dev -->

The easiest way to translate strings is the [adapter-dev package](https://github.com/ioBroker/adapter-dev).

It should be added as a dev dependency the adapter project and provides several commands to translate admin UI, io-package objects and other texts.

```
npm install --save-dev @iobroker/adapter-dev
```

### Website

To translate an English text to multiple languages, the [ioBroker translator tool](https://translator.iobroker.in) is also helpful. The website will translate any English phrase to all supported languages and returns JSON.

Example output:

``` json
{
  "Example": {
    "en": "Example",
    "de": "Beispiel",
    "ru": "Пример",
    "pt": "Exemplo",
    "nl": "Voorbeeld",
    "fr": "Exemple",
    "it": "Esempio",
    "es": "Ejemplo",
    "pl": "Przykład",
    "zh-cn": "例子"
  }
}
```