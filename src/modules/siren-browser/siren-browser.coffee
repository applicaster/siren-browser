( ->
  require "angular-ui-router"
  require "angular-busy/dist/angular-busy.min.css"
  require "angular-busy/dist/angular-busy.min.js"
  require("angular-bootstrap/ui-bootstrap.js")
  require("angular-bootstrap/ui-bootstrap-tpls.js")
  
  angular.module("SirenBrowser", ["ui.bootstrap", "ui.router", "cgBusy"]).config [
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
  require "./services/sirenBrowserHttp.coffee"
)()
