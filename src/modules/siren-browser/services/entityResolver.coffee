(->
  require "../siren-browser.coffee"
  entityResolver = ($rootScope, sirenBrowserHttp) ->
    class EntityResolverClass
      constructor: () ->
        @cachedEntity = null
      cacheEntity: (entity) ->
        @cachedEntity = entity
      resolve: (url) ->
        if (entity = @cachedEntity)
          @cachedEntity = null
          entity
        else
          if (url)
            sirenBrowserHttp.request({method: 'GET', url: url})
          else
            {data:{}}
    new EntityResolverClass

  angular.module('SirenBrowser')
    .service "entityResolver", [
      '$rootScope'
      'sirenBrowserHttp'
      entityResolver
    ]
)()
