# @cjsx React.DOM 

React        = require 'react/react'

MemberAdd = React.createClass
  render: ->
    <div className={@props.className}>
      <a className="btn btn-primary btn-block btn-outlined">
        <i className="icon icon-plus" />
        メンバー追加
      </a>
    </div>

module.exports = MemberAdd

