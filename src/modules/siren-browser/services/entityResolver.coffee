(->
  require "../siren-browser.coffee"
  entityResolver = ($rootScope, $http) ->
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
            $http.get(url)
          else
            {data:{}}
    new EntityResolverClass

  angular.module('SirenBrowser')
    .service "entityResolver", [
      '$rootScope'
      '$http'
      entityResolver
    ]
)()
