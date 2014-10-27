# @cjsx React.DOM 

React        = require 'react/react'
MemberAdd    = require './members/add.cjsx'
MembersList  = require './members/list.cjsx'
MailTemplate = require './members/mail.cjsx'
Api          = require '../api.coffee'
$            = require 'jquery'
_            = require 'underscore'

Members = React.createClass
  getInitialState: ->
    return {
      members: []
    }

  componentDidMount: ->
    Api.members.get().done (data) =>
      @setState members: data.members

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
      <MembersList className="members-list" members={@state.members} />
      <MailTemplate />
    </div>

module.exports = Members

