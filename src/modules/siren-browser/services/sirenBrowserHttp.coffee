(->
  require "../siren-browser.coffee"
  sirenBrowserHttp = ($rootScope, $http) ->
    class SirenBrowserHttpClass
      constructor: () ->
      request: (options) ->
        $rootScope.myPromise = $http(options)
        .error (data, status) ->
          msg = 'HTTP Error ' + status + ': ' + JSON.stringify(data.properties)
          $rootScope.alerts = []
          $rootScope.alerts.push(
            { type: 'danger', msg: msg }
          )
          console.log("error in get  status="+status, data.properties)
          return
    new SirenBrowserHttpClass

  angular.module('SirenBrowser')
    .service "sirenBrowserHttp", [
      '$rootScope'
      '$http'
      sirenBrowserHttp
    ]
)()
