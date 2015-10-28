{module, test} = QUnit
module \ES6
test 'ArrayBuffer#slice', !(assert)~>
  assert.isFunction ArrayBuffer::slice
  assert.arity ArrayBuffer::slice, 2
  assert.name ArrayBuffer::slice, \slice
  assert.looksNative ArrayBuffer::slice
  array = new Uint8Array [1 2 3 4 5]
  buffer = array.buffer
  assert.ok buffer instanceof ArrayBuffer, 'correct buffer'
  assert.ok buffer.slice! isnt buffer, 'returns new buffer'
  assert.ok buffer.slice! instanceof ArrayBuffer, 'correct instance'
  assert.ok buffer.slice!buffer isnt array.buffer, 'with new buffer'
  assert.arrayEqual new Uint8Array(buffer.slice!), array
  assert.arrayEqual new Uint8Array(buffer.slice 1 3), [2 3]
  assert.arrayEqual new Uint8Array(buffer.slice 1 void), [2 3 4 5]
  assert.arrayEqual new Uint8Array(buffer.slice 1 -1), [2 3 4]
  assert.arrayEqual new Uint8Array(buffer.slice -2 -1), [4]
  assert.arrayEqual new Uint8Array(buffer.slice -2 -3), []