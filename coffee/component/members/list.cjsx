# @cjsx React.DOM 

_              = require 'underscore'
React          = require 'react/react'
MembersListRow = require './row.cjsx'
Api            = require '../../api.coffee'

MembersList = React.createClass
  getInitialState: ->
    return {
      members: []
    }

  componentDidMount: ->
    Api.members.get().done (data) =>
      @setState members: data

  handleMemberEdit: (member, oldName) ->
    _members = []
    @state.members.forEach (val) ->
      if val.name is oldName
        _members.push _.extend {}, val, member
      else
        _members.push val
    @setState members: _members

  handleMemberDelete: (member) ->
    _members = _.without @state.members, member
    @setState members: _members
    # TODO: API request to delete member

  render: ->
    BEMElement =
      row: "#{@props.className}__member"

    rows = []
    @state.members.forEach (member) =>
      rows.push(
        <MembersListRow 
          className={BEMElement.row}
          member={member}
          onMemberDelete={@handleMemberDelete}
          onMemberEdit={@handleMemberEdit}
          />
      )

    <ul className={@props.className}>
      {rows}
    </ul>

module.exports = MembersList

