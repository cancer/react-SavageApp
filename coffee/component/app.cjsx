# @cjsx React.DOM 

React = require 'react/react'

App = React.createClass
  render: ->
    <Main route=this.props.route />

module.exports = App
