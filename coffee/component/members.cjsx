# @cjsx React.DOM 

_            = require 'underscore'
React        = require 'react/react'
MemberAdd    = require './members/add.cjsx'
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
      <MemberAdd   className="member-add" />
      <MembersList className="members-list" />
      <MailTemplate />
    </div>

module.exports = Members

