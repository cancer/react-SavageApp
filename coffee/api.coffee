$ = require 'jquery'

Api = {}
Api.baseUrl = '/api'

class Members
  url: '/members'
  get: ->
    $.getJSON "#{Api.baseUrl}#{@url}"

Api.members = new Members

module.exports = Api

