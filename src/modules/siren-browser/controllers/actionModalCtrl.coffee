(->
  require "../siren-browser.coffee"
  actionModalCtrl = ($scope, $modalInstance, action) ->
    @action = action
    @close = ->
      $modalInstance.dismiss('cancel');
    return
  angular.module("SirenBrowser").controller("actionModalCtrl", [
    '$scope'
    '$modalInstance'
    'action'
    actionModalCtrl
  ])
)()
