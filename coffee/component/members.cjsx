# @cjsx React.DOM 

React        = require 'react/react'
AddMember    = require './members/add.cjsx'
MembersList  = require './members/list.cjsx'
MailTemplate = require './members/mail.cjsx'

Members = React.createClass
  render: ->
    <div className="members">
      <div className="members-headline">
        <h2 className="members-headline__title">
          メンバーリスト
        </h2>
      </div>
      <p className="members-headline__lead">
        サバゲ部のメンバーを管理できます
      </p>
      <AddMember />
      <MembersList className="member-list" members={@props.members} />
      <MailTemplate />
    </div>

module.exports = Members

