(->
  require("../services/actionsUtils.coffee")
  require("../services/entityResolver.coffee")
  actionFromCtrl = (
    $scope
    $element
    sirenBrowserHttp
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
      sirenBrowserHttp.request(options)
      .success((data) ->
        entityResolver.cacheEntity(data: data)
        url = $rootScope.entityUrl
        options =
          notify: true
          reload: true
        $state.go('siren-browser', {url: url}, options)
      )
    return

  angular.module("SirenBrowser").controller("actionFromCtrl", [
    '$scope'
    '$element'
    'sirenBrowserHttp'
    '$state'
    '$rootScope'
    'entityResolver'
    'actionsUtils'
    actionFromCtrl
  ])
)()
