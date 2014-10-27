# @cjsx React.DOM 

React         = require 'react/react'
MemberSummary = require './summary.cjsx'
MemberEdit    = require './edit.cjsx'

MembersList = React.createClass
  getInitialState: ->
    return {
      isEdit: false
    }

  handleEdit: ->
      @setState isEdit: !@state.isEdit

  render: ->
    BEMElement =
      listItem: "#{@props.className}__member"

    rows = []
    @props.members.forEach (member) =>
      rows.push(
        <li className={BEMElement.listItem}>
          <MemberSummary className="member-summary" member={member} onMemberEdit={@handleEdit} />
          <MemberEdit className="member-edit" member={member} visible={@state.isEdit} />
        </li>
      )

    <ul className={@props.className}>
      {rows}
    </ul>

module.exports = MembersList

