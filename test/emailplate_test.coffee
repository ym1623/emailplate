should = require('chai').should()
Emailplate = require '..'

describe "Emailplate", ->

  emailplate = null

  beforeEach ->
    emailplate = new Emailplate

  it "should hv default template folder", ->
    emailplate.get('views').should.be.a 'string'

  it 'shoud set custom template folder', ->
    emailplate.set 'views', './templates'
    emailplate.get('views').should.equal './templates'
    emailplate.set
      'views': './another_templates'
    emailplate.get('views').should.equal './another_templates'

  it 'should get the themes info', (done) ->
    emailplate.set 'views', __dirname + '/fixtures'
    emailplate.themes (err, files) ->
      files.should.be.an 'array'
      files[0].name.should.equal 'sample'
      done()

  it 'should render inline css html', (done) ->
    emailplate.set 'views', __dirname + '/fixtures'
    emailplate.render 'sample', (err, html) ->
      html.should.be.a 'string'
      done()


