React = require 'react'
app = require './coffee/index.cjsx'

React.renderComponent app(), document.getElementById 'content'
