# @cjsx React.DOM 

_             = require 'underscore'
React         = require 'react/react'
MemberSummary = require './summary.cjsx'
MemberEdit    = require './edit.cjsx'

MembersListRow = React.createClass
  getInitialState: ->
    return {
      isEdit: false
    }

  handleEdit: ->
    @setState isEdit: !@state.isEdit

  handleSave: (args) ->
    _oldName = args.oldName
    _member = _.extend {}, @props.member, name: args.name
    @props.onMemberEdit _member, _oldName

  handleDelete: (member) ->
    #@props.onMemberDelete member
    console.log 'Now, can not delete member.'

  handleClose: ->
    @setState isEdit: false

  render: ->
    console.log @props.member
    <li className={@props.className}>
      <MemberSummary className="member-summary" member={@props.member} onMemberEdit={@handleEdit} />
      <MemberEdit 
        className="member-edit"
        member={@props.member}
        visible={@state.isEdit}
        onSave={@handleSave}
        onDelete={@handleDelete}
        onClose={@handleClose}
        />
    </li>

module.exports = MembersListRow

