(->
  require "../siren-browser.coffee"
  require "./actionModalCtrl.coffee"
  showCtrl = ($scope, $stateParams, $rootScope, sirenEntity, $modal) ->
    # Reset Alerts
    $rootScope.alerts = []
    @url = $stateParams.url
    @actions = sirenEntity.data.actions
    @class = sirenEntity.data.class
    @properties = sirenEntity.data.properties
    @links = sirenEntity.data.links
    @entities = sirenEntity.data.entities
    @openActionModal = (action) ->
      modalInstance = $modal.open
        template: require("../templates/actionModal.jade")
        controller: 'actionModalCtrl as actionModalCtrl'
        resolve:
          action: () ->
            action
        size: 'lg'
    return

  angular.module("SirenBrowser").controller("showCtrl", [
    '$scope'
    '$stateParams'
    '$rootScope'
    'sirenEntity'
    '$modal'
    showCtrl
  ])
)()
