describe "actionModalCtrl", ->
  require "../siren-browser.coffee"
  require "./actionModalCtrl.coffee"
  action = undefined
  modalInstance = undefined
  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject((_$controller_, _$rootScope_) ->
    $rootScope = _$rootScope_
    @$scope = $rootScope.$new()
    modalInstance =
      dismiss: ->
    $controller = _$controller_
    @myCtrl = $controller "actionModalCtrl",
      $rootScope: $rootScope
      $scope: @$scope
      $modalInstance: modalInstance
      action:
        href: "some value"
        name: "some value"
        fields: []
    return
  )
  it "close the modal when calling close function", ->
    spyOn(modalInstance, 'dismiss')
    @myCtrl.close()
    expect(modalInstance.dismiss).toHaveBeenCalled()

  it "pass action to scope", ->
    action =
      href: "some value"
      name: "some value"
      fields: []
    expect(action).toEqual @myCtrl.action
