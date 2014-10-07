describe "actionModalCtrl", ->
  require "../siren-browser.coffee"
  require "./actionModalCtrl.coffee"

  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject((_$controller_, _$rootScope_) ->
    $rootScope = _$rootScope_
    @$scope = $rootScope.$new()
    $controller = _$controller_
    @myCtrl = $controller "actionModalCtrl",
      $rootScope: $rootScope
      $scope: @$scope
      action: action =
        href: "some value"
        name: "some value"
        fields: []
  )
  it "pass action to scope", ->
    action =
      href: "some value"
      name: "some value"
      fields: []
    expect(action).toEqual @myCtrl.action
