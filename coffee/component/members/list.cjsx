# @cjsx React.DOM 

React          = require 'react/react'
MembersListRow = require './row.cjsx'

module.exports = React.createClass
  render: ->
    BEMElement =
      row: "#{@props.className}__member"

    rows = []
    @props.members.forEach (member) =>
      rows.push(
        <MembersListRow className={BEMElement.row} member={member} />
      )

    <ul className={@props.className}>
      {rows}
    </ul>

