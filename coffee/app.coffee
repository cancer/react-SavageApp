React   = require 'react'
Members = require './component/members.cjsx'

React.renderComponent <Members className="members" />, document.getElementById 'main'
