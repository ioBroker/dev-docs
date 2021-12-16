# Working with Objects

## Creating a new object

```javascript
await this.setObjectNotExistsAsync('myadapter.0.state', {
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
this.delObject('myadapter.0.channel');
```

### Recursive

```javascript
this.delObject('myadapter.0.channel', {recursive: true}, () => {
    this.log.debug('Deleted: ' + id);
});
```