describe "showCtrl", ->
  require "../siren-browser.coffee"
  require "./showCtrl.coffee"
  $modal = undefined
  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject((_$controller_, _$rootScope_) ->
    $rootScope = _$rootScope_
    @$scope = $rootScope.$new()
    $controller = _$controller_
    $modal = {
      open: ->
    }
    @myCtrl = $controller "showCtrl",
      $scope: @$scope
      $stateParams: {}
      $rootScope: $rootScope
      sirenEntity: {data: {}}
      $modal: $modal
  )
  describe "openActionModal", ->
    it "open a modal with a given action", ->
      action = {}
      spyOn($modal, 'open')
      @myCtrl.openActionModal(action)
      expect($modal.open).toHaveBeenCalled()
