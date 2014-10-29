# @cjsx React.DOM 

React = require 'react/react'

MemberSummary = React.createClass
  handleEdit: ->
    @props.onMemberEdit()

  render: ->
    className = @props.className
    bemClassName =
      name         : "#{className}__name"
      status       : "#{className}__status"
      statusAction : "#{className}__status__action"
      checkbox     : "#{className}__checkbox"
      btnEdit      : "#{className}__btn-edit"

    <div className={className}>
      <div className={bemClassName.name}>{@props.member.name}</div>
      <div className={bemClassName.status}>
        <div className={bemClassName.statusAction}>
          <div className={bemClassName.checkbox} />
        </div>
        <div className={bemClassName.statusAction}>
          <a className={bemClassName.btnEdit} onClick={@handleEdit}>編集</a>
        </div>
      </div>
    </div>

module.exports = MemberSummary

