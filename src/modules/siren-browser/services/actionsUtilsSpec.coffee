describe "SirenBrowser.actionsUtils", ->
  require "../siren-browser.coffee"
  require "./actionsUtils.coffee"
  actionsUtils = undefined
  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject(($injector) ->
    actionsUtils = $injector.get("actionsUtils")
  )
  describe "resolveFormContentType", ->
    it "have a default value param for enctype", ->
      data = actionsUtils.resolveFormContentType()
      expect(data).toBe 'application/x-www-form-urlencoded'
    it "return enctype if enctype param was set", ->
      someValue = 'Some Value'
      data = actionsUtils.resolveFormContentType(someValue)
      expect(data).toBe someValue

  describe "_proecessUrlecoded", ->
    it "returns the input variable", ->
      data = "urlencodedstring"
      expect(actionsUtils._proecessUrlecoded(data)).toBe data

  describe "_processJson", ->
    it 'converts url encoded string to Json', ->
      data = 'ids[]=1&ids[]=2&name=siren'
      json =
        'ids': [1,2]
        'name': 'siren'
      expect(actionsUtils._processJson(data)).toEqual(json)

  describe "formDataContentTypeConverter", ->
    it "support application/x-www-form-urlencoded content type", ->
      enctype = 'application/x-www-form-urlencoded'
      expect( ->
        actionsUtils.formDataContentTypeConverter({}, enctype)
      ).not.toThrow()

    it "support application/json content type", ->
      enctype = 'application/json'
      data = {}
      spyOn(actionsUtils, '_processJson')
      .andCallFake( ->
        data
      )
      expect( ->
        actionsUtils.formDataContentTypeConverter(data, enctype)
      ).not.toThrow()

    it "throw an error for unsupported content types", ->
      enctype = 'unsupportet content type'
      expect( ->
        actionsUtils.formDataContentTypeConverter({}, enctype)
      ).toThrow()

  describe "_urlBuilderGET", ->

    it "generate valid URL if default URL/
        has already query string built in", ->
      url = 'http://example.com?key=value'
      data = 'key1=value&key2=value'
      result = url + '&' + data
      expect(actionsUtils._urlBuilderGET(url, data)).toBe(result)

    it "generate valid URL if default URL/
        doesn't have query string", ->
      url = 'http://example.com'
      data = 'key1=value&key2=value'
      result = url + '?' + data
      expect(actionsUtils._urlBuilderGET(url, data)).toBe(result)

  describe "renderOptions", ->

    it "use _urlBuilderGET on GET methods", ->
      action = {method : 'GET'}
      formData = {}
      spyOn(actionsUtils, '_urlBuilderGET')
      .andCallFake(->)
      actionsUtils.renderOptions(action, formData)
      expect(actionsUtils._urlBuilderGET).toHaveBeenCalled()
