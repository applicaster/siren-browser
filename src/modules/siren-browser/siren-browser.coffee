( ->
  require "angular-ui-router"
  angular.module("SirenBrowser", ["ui.router"]).config [
    "$stateProvider"
    "$urlRouterProvider"
    ($stateProvider, $urlRouterProvider) ->
      $urlRouterProvider.otherwise('/siren-browser')
      $stateProvider.state "siren-browser",
        url: "/siren-browser?url?cached"
        controller: "showCtrl as showCtrl"
        template: require("./templates/show.jade")
        resolve:
          sirenEntity:[
            'entityResolver'
            '$rootScope'
            '$stateParams'
            (entityResolver,$rootScope, $stateParams) ->
              entityResolver.resolve($stateParams.url)
            ]
  ]

  require "./controllers/showCtrl.coffee"
  require "./directives/actionForm.coffee"
  require "./services/entityResolver.coffee"
)()
