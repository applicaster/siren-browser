describe "SirenBrowser.sirenBrowserHttp", ->
  require "../siren-browser.coffee"
  require "./sirenBrowserHttp.coffee"
  $rootScope = undefined
  sirenBrowserHttp = undefined
  $httpBackend = undefined
  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject(($injector) ->
    $rootScope = $injector.get("$rootScope")
    sirenBrowserHttp = $injector.get("sirenBrowserHttp")
    $httpBackend = $injector.get("$httpBackend")
  )
  describe "sirenBrowserHttp.request", ->
    it "show an alert on HTTP error", ->
      actionHref = "/url"
      action =
        url: actionHref
        method: 'POST'
      properties =
        message: "Forbidden"
        details: "error details"
      $httpBackend.whenPOST(actionHref).respond(500, {properties: properties})
      sirenBrowserHttp.request(action)
      $httpBackend.flush()
      expect($rootScope.alerts).toEqual([
        type : 'danger'
        msg : 'HTTP Error 500: {"message":"Forbidden"\
        ,"details":"error details"}'
      ])
