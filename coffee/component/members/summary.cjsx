# @cjsx React.DOM 

React = require 'react/react'

MemberSummary = React.createClass
  handleEdit: ->
    @props.onMemberEdit()

  render: ->
    className = @props.className
    BEMElement =
      name         : "#{className}__name"
      status       : "#{className}__status"
      statusAction : "#{className}__status__action"
      checkbox     : "#{className}__checkbox"
      btnEdit      : "#{className}__btn-edit"

    <div className={className}>
      <div className={BEMElement.name}>{@props.member.name}</div>
      <div className={BEMElement.status}>
        <div className={BEMElement.statusAction}>
          <div className={BEMElement.checkbox} />
        </div>
        <div className={BEMElement.statusAction}>
          <a className={BEMElement.btnEdit} onClick={@handleEdit}>編集</a>
        </div>
      </div>
    </div>

module.exports = MemberSummary

