(->
  require("../services/actionsUtils.coffee")
  require("../services/entityResolver.coffee")
  actionFromCtrl = (
    $scope
    $element
    $http
    $state
    $rootScope
    entityResolver
    actionsUtils
  ) ->
    # Public: submits action data to a siren API request.
    #
    # action - action metadat and values to send.
    #
    # returns nothing.
    @submit = (action) ->
      formData = $element.find("form").serialize()
      options = actionsUtils.renderOptions(action, formData)
      $rootScope.entityUrl = options.url
      $http(options)
      .success((data) ->
        entityResolver.cacheEntity(data: data)
        url = $rootScope.entityUrl
        options =
          notify: true
          reload: true
        $state.go('siren-browser', {url: url}, options)
      ).error (data, status) ->
        console.log("error in get  status="+status)
    return

  angular.module("SirenBrowser").controller("actionFromCtrl", [
    '$scope'
    '$element'
    '$http'
    '$state'
    '$rootScope'
    'entityResolver'
    'actionsUtils'
    actionFromCtrl
  ])
)()
