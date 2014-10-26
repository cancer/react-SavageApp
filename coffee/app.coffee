React   = require 'react'
Members = require './component/members.cjsx'

MEMBERS = [
  {
    "name": "cacner"
    "isAwaken": true
  },
  {
    "name": "geckotang"
    "isAwaken": false
  },
  {
    "name": "gundam"
    "isAwaken": true
  },
  {
    "name": "chalo"
    "isAwaken": false
  }
]

React.renderComponent <Members members={MEMBERS} />, document.getElementById 'main'
