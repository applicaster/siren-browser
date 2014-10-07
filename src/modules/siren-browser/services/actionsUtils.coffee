(->
  require "../siren-browser.coffee"
  require "jquery.ba-bbq"
  actionsUtils = () ->

    # Public: Resolve form enctype and use application/x-www-form-urlencoded
    # and use 'application/x-www-form-urlencoded' as default
    # See http://www.w3.org/TR/html401/interact/forms.html#adef-enctype.
    #
    # enctype - the content type to resolve.
    #
    # Returns the resolved form enctype.
    resolveFormContentType: (enctype = 'application/x-www-form-urlencoded') ->
      enctype

    # Private: Process data as x-www-form-urlencoded after using serialize.
    # data stays the same. The reason to use a fuction here is to stay
    # consitsnat with other process avaiable process fucntions.
    #
    # data - serialized form data.
    #
    # Returns entered data.
    _proecessUrlecoded: (data) ->
      data

    # Private: Process data as JSON afetr using serialize.
    #
    # data - serialized form data.
    #
    # Returns data as JSON object.
    _processJson: (data) ->
      $.deparam(data, true)

    # Public: Convert form data depending of form content type.
    #
    # data - The form data.
    # enctype = The form content type.
    #
    # Retunrs  converted form.
    # Raises Error in case of an unrecognised content type.
    formDataContentTypeConverter: (data, enctype) ->
      processFormData =
        'application/x-www-form-urlencoded': @_proecessUrlecoded
        'application/json': @_processJson
      if processFormData[enctype]
        convertedData = processFormData[enctype](data)
      else
        throw new Error("Form content type not suppoted.")
      convertedData

    # Private: create a valid URl when concting a query stirng
    # to an existing URL.
    # Make sure there is no more than 1 apperaence of '?' sign
    #
    # url - the url to attch the query string
    # queryString - query string
    #
    # Returns a valid URL
    _urlBuilderGET: (url, queryString) ->
      separator = if (url.search(/\?/) > 0) then "&" else "?"
      url + separator + queryString

    # Public: render action options for $http service.
    #
    # action - The action object.
    # formData - serialized form data values.
    #
    # Returns the renderd options.
    renderOptions: (action, formData) ->
      resolveFormContentType = @resolveFormContentType(action.type)
      options =
        method: action.method
        url: action.href
        headers:
          'Content-Type': resolveFormContentType
          'Accept':
            'application/vnd.siren+json, application/json, text/plain, */*'
      data = @formDataContentTypeConverter(
        formData, resolveFormContentType
      )
      if (action.method == 'GET')
        options.url = @_urlBuilderGET(options.url, data)
      else
        options.data = data
      options


  angular.module('SirenBrowser')
    .factory "actionsUtils", [
      actionsUtils
    ]

)()
