# Objects / States

<!-- Note: source https://github.com/ioBroker/ioBroker.docs/blob/master/docs/en/dev/objectsschema.md -->

There are two fundamentally different data types in ioBroker. So called states and objects.

**Objects** represent rarely changing and larger data, like meta-data of your systems devices, configurations and additional files.

**States** represent often changing data in your system, like the temperature of your living room. States can be used to trigger actions and states can create history data.

For every state there must exist a corresponding object with the type ``state`` which describes the state.

## Hierarchy

Objects are organized in a tree hierarchy (like the file system on your hard disk). The separator for this hierarchy is the dot ``.``.

## Objects

### Object attributes

| Field           | Required         | type           |                                                                                                                                                                   |
|-----------------|------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ``_id``         | :material-check: | string         | ID of the object (e.g. ``system.adapter.0.admin.uptime``                                                                                                          |
| ``type``        | :material-check: | string         | Type of object (see below for possible values)                                                                                                                    |
| ``common``      | :material-check: | object         | Specific abstraction properties (depends on selected type)                                                                                                        |
| ``common.name`` |                  | string\|object | The (translated) name of the object (optional but strictly suggested to fill it) - see the [ translation](../development/06-translations.md) for further details. |
| ``native``      | :material-check: | object         | Congruent properties of the target system                                                                                                                         |

**It depends on the object type which common attributes are required.**

### Object types

The most common object types for adapters are ``state``, ``channel`` and ``device``.

| Type         | Parent-Type               |                                           |
|--------------|---------------------------|-------------------------------------------|
| ``state``    | ``channel`` or ``device`` |                                           |
| ``channel``  | ``device``                | Group of ``state`` objects                |
| ``device``   | **none**                  | Group of ``channel`` or ``state`` objects |

There are additional object types, which are mostly used by the system (and are irrelevant for adapter development):

| Type         |   |
|--------------|---|
| ``enum``     |   |
| ``host``     |   |
| ``adapter``  |   |
| ``instance`` |   |
| ``meta``     |   |
| ``config``   |   |
| ``script``   |   |
| ``user``     |   |
| ``group``    |   |
| ``chart``    |   |
| ``folder``   |   |

### Create a new object

There exists several ways to create a new object in your own adapters:

1. Use the ``instanceObjects`` attribute in your ``io-package.json``
2. Use the adapter methods on runtime

## States



## Instance namespace



## System namespaces

| ID                         | object type |                                                                  |
|----------------------------|-------------|------------------------------------------------------------------|
| ``system.adapter.*``       | adapter     | Default adapter configuration and meta information               |
| ``system.adapter.*.[0-9]`` | instance    | Instance configuration / individual settings                     |
| ``system.group.*``         | group       | User groups                                                      |
| ``system.user.*``          | user        | Users                                                            |
| ``system.host.*``          | host        | Controller processes                                             |
| ``system.meta.*``          | meta        | System meta data (like UUID)                                     |
| ``system.config``          | config      | System settings (like default currency, date format or language) |
| ``system.certificates``    | config      | Known certificates                                               |
| ``system.licenses``        | config      | Licenses from iobroker.net                                       |
| ``system.repositories``    | config      | List of repositories (like ``stable`` and ``beta``)              |
| ``script.js.*``            | script      | Scripts for JavaScript-Engine                                    |
| ``enum.*``                 | enum        | Enumerations                                                     |

