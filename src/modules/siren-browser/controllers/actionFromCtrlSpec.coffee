describe "SirenBrowser.actionFromCtrl", ->
  require "../siren-browser.coffee"
  require "./actionFromCtrl.coffee"
  # See http://stackoverflow.com/questions/20968320
  $httpBackend = undefined
  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject((_$controller_, _$rootScope_, _$httpBackend_) ->
    $rootScope = _$rootScope_
    $scope = $rootScope.$new()
    $controller = _$controller_
    $httpBackend = _$httpBackend_
    @myCtrl = $controller "actionFromCtrl",
      $rootScope: $rootScope
      $scope: $scope
      $element:  angular.element('<div>')
  )
  describe "submit POST action", ->
    it "should POST for the given post action", ->
      actionHref = "/url"
      action =
        href: actionHref
        method: 'post'
      $httpBackend.whenPOST(actionHref).respond(201)
      @myCtrl.submit(action)
      $httpBackend.expectPOST(actionHref)
      $httpBackend.flush()
