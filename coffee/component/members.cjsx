# @cjsx React.DOM 

_            = require 'underscore'
React        = require 'react/react'
MemberAdd    = require './members/add.cjsx'
MembersList  = require './members/list.cjsx'
MailTemplate = require './members/mail.cjsx'

Members = React.createClass
  render: ->
    className = @props.className
    bemClassName =
      headline      : "#{className}-headline"
      headlineTitle : "#{className}-headline__title"
      headlineLead  : "#{className}-headline__lead"
      add           : "#{className}-add"
      list          : "#{className}__list"
    <div className={className}>
      <div className={bemClassName.headline}>
        <h2 className={bemClassName.headlineTitle}>
          メンバーリスト
        </h2>
      </div>
      <p className={bemClassName.headlineLead}>
        サバゲ部のメンバーを管理できます
      </p>
      <MemberAdd   className={bemClassName.add} />
      <MembersList className={bemClassName.list} />
      <MailTemplate />
    </div>

module.exports = Members

