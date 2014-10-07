(->
  actionForm = () ->
    restrict: 'E',
    template: require("../templates/action-form.jade")
    require: "ngModel"
    scope:
      action: '=ngModel'
    controller: "actionFromCtrl as actionFromCtrl"
  require "../controllers/actionFromCtrl.coffee"
  angular.module("SirenBrowser").directive("actionForm", actionForm)
)()
