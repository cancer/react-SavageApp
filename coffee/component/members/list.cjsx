# @cjsx React.DOM 

React         = require 'react/react'
MemberSummary = require './summary.cjsx'
MemberEdit    = require './edit.cjsx'

MembersList = React.createClass
  render: ->
    BEMElement =
      listItem: "#{@props.className}__member"
    console.log BEMElement
    rows = []
    this.props.members.forEach (member) =>
      rows.push(
        <li className={BEMElement.listItem}>
          <MemberSummary className="member-summary" member={member} />
          <MemberEdit className="member-edit" member={member} />
        </li>
      )

    <ul className={@props.className}>
      {rows}
    </ul>

module.exports = MembersList

