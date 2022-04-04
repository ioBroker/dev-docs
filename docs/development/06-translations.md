# Adapter Translations

Whenever possible, you should provide multiple languages for everything the user will see. Like

- Adapter name
- Adapter description
- Adapter news
- Objects
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

If you want to translate an English text to multiple languages, you can use the [ioBroker translator tool](https://translator.iobroker.in). It will translate any English phrase to all supported languages and returns JSON.

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