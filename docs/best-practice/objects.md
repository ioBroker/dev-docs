# Working with Objects

## Creating a new object

### Type channel

```javascript
await this.setObjectNotExistsAsync('myadapter.0.mychannel', {
    type: 'channel',
    common: {
        name: {
            en: 'Example',
            de: 'Beispiel',
            ru: 'Пример',
            pt: 'Exemplo',
            nl: 'Voorbeeld',
            fr: 'Exemple',
            it: 'Esempio',
            es: 'Ejemplo',
            pl: 'Przykład',
            'zh-cn': '例子'
        }
    },
    native: {},
});
```

### Type state

```javascript
await this.setObjectNotExistsAsync('myadapter.0.mychannel.state', {
    type: 'state',
    common: {
        name: 'My state',
        type: 'boolean',
        role: 'switch',
        read: true,
        write: true,
        def: false
    },
    native: {},
});
```

## Delete an object

### Single Object

```javascript
this.delObject('myadapter.0.mychannel.state');
```

### Recursive

```javascript
this.delObject('myadapter.0.mychannel', {recursive: true}, () => {
    this.log.debug('Deleted: ' + id);
});
```