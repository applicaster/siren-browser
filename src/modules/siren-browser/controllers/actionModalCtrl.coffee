(->
  require "../siren-browser.coffee"
  actionModalCtrl = ($scope, action) ->
    @action = action
    return
  angular.module("SirenBrowser").controller("actionModalCtrl", [
    '$scope'
    'action'
    actionModalCtrl
  ])
)()
