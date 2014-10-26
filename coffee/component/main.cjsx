# @cjsx React.DOM 

React   = require 'react/react'
Members = require './component/members.cjsx'

Main = React.createClass
  render: ->
    switch 
      when this.props.route is "/members"
        return <Members members=MEMBERS />

module.exports = Main

