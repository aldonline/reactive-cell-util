chai = require 'chai'
should = chai.should()
rcell = require 'reactive-cell'
x = require '../lib'

describe 'connect', ->
  it 'should connect two cells', -> 

    c1 = rcell()
    c1 'A'
    c2 = rcell()
    c2 'B'

    c1().should.equal 'A'
    c2().should.equal 'B'

    stopper = x.connect c1, c2

    c1().should.equal 'A'
    c2().should.equal 'A'

    c1 'C'

    c1().should.equal 'C'
    c2().should.equal 'C'

    c2 'D'

    c1().should.equal 'D'
    c2().should.equal 'D'

    stopper()

    c1().should.equal 'D'
    c2().should.equal 'D'

    c2 'X'

    c1().should.equal 'D'
    c2().should.equal 'X'