# @cjsx React.DOM 

React = require 'react/addons'

module.exports = React.createClass
  handleSave: ->
    @props.onSave
      name: @refs.name.getDOMNode().value.trim()
      oldName: @props.member.name
    @handleClose()

  handleDelete: ->
    @props.onDelete @props.member
    @handleClose()

  handleClose: ->
    @props.onClose()

  render: ->
    className = @props.className
    BEMElement =
      name               : "#{className}__name"
      nameLabel          : "#{className}__name__label"
      nameValue          : "#{className}__name__value"
      action             : "#{className}__action"
      actionBtn          : "#{className}__action__btn"
      actionBtnForSave   : "#{className}__action__btn #{className}__action__btn--save"
      actionBtnForDelete : "#{className}__action__btn #{className}__action__btn--delete"
      actionBtnForClose  : "#{className}__action__btn #{className}__action__btn--close"

    _classes = {}
    _classes[className] = true
    _classes["is--hidden"] = !@props.visible
    classSet = React.addons.classSet _classes

    <div className={classSet}>
      <div className={BEMElement.name}>
        <div className={BEMElement.nameLabel}>名前</div>
        <div className={BEMElement.nameValue}>
          <input type="text" defaultValue={@props.member.name} ref="name" />
        </div>
      </div>
      <div className={BEMElement.action}>
        <div className={BEMElement.actionBtnForSave}>
          <a className="btn btn-positive btn-block btn-outlined" onClick={@handleSave}>
            <i className="icon icon-edit" />
          </a>
        </div>
        <div className={BEMElement.actionBtnForDelete}>
          <a className="btn btn-negative btn-block btn-outlined" onClick={@handleDelete}>
            <i className="icon icon-trash" />
          </a>
        </div>
        <div className={BEMElement.actionBtnForClose} onClick={@handleClose}>
          <a className="btn btn-block btn-outlined">
            <i className="icon icon-close" />
          </a>
        </div>
      </div>
    </div>

