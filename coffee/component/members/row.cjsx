# @cjsx React.DOM 

React         = require 'react/react'
MemberSummary = require './summary.cjsx'
MemberEdit    = require './edit.cjsx'

module.exports = React.createClass
  getInitialState: ->
    return {
      isEdit: false
    }

  handleEdit: ->
      @setState isEdit: !@state.isEdit

  render: ->
    <li className={@props.className}>
      <MemberSummary className="member-summary" member={@props.member} onMemberEdit={@handleEdit} />
      <MemberEdit className="member-edit" member={@props.member} visible={@state.isEdit} />
    </li>

