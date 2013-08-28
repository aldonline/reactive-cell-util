reactive-cell-util
==================

A set of utility functions that operate on [reactive-cells](https://github.com/aldonline/reactive-cell).

## connect( cell1, cell2 )

```coffeescript

cell = require 'reactive-cell'
util = require 'reactive-cell-util'

# create two empty cells
cell1 = cell()
cell2 = cell()

# set initial values
cell1 1
cell2 2

console.log cell1() # 1
console.log cell2() # 2

# connect them
# note: argument order is important
# first assignment happens from left to right ( cell1 --> cell2 )
util.connect cell1, cell2

console.log cell1() # 1
console.log cell2() # 1

# lets change one value
cell1 3

console.log cell1() # 3
console.log cell2() # 3

# lets see if it works the other way around ( cell2 --> cell1 )
cell2 4

console.log cell1() # 4
console.log cell2() # 4
```

### Garbage Collection Considerations

Naturally, a connection creates a set of references to several objects.
( it creates two [Reactivity.js](https://github.com/aldonline/reactivity) subscriptions under the covers )
Be sure to dispose of them when done.

```coffeescript

# the connect() method returns a callback
dispose_callback = util.connect cell1, cell2

# at some future point in time
dispose_callback()

```




