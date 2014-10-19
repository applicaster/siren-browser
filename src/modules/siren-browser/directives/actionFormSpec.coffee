describe "actionForm directive", ->
  ele = undefined
  scope = undefined
  beforeEach(window.angular.mock.module("SirenBrowser"))
  beforeEach inject(($compile, $rootScope) ->
    scope = $rootScope
    ele = angular.element(
      '<action-form ng-model="action"/>'
    )
    $compile(ele)(scope)
    scope.$apply()
  )
  it "dispaly action form", ->
    scope.$apply(->
      scope.action =
        "name": "add-item"
        "title": "Add Item"
        "method": "POST"
        "href": "http://api.x.io/orders/42/items"
        "type": "application/x-www-form-urlencoded"
        "fields": [
          { "name": "orderNumber", "type": "hidden", "value": "42" }
          { "name": "productCode", "type": "text" }
          { "name": "quantity", "type": "number" }
        ]

    )
    expect(ele.html()).toContain('type="text" name="productCode"')
  it "check radio buttons by default if their\
      selected attribute is set to true", ->
    scope.$apply(->
      scope.action =
        "fields": [
          {
            "type":"radio"
            "value": [
              {
                "value": "value1"
                "selected": true
              }
              {
                "value": "value2"
              }
            ]
          }
        ]
    )
    expect(ele.find('input[value="value1"]')
      .first().attr('checked')).toBe('checked')
    expect(ele.find('input[value="value2"]')
      .first().attr('checked')).toBeUndefined()

  it "show field for all supported Siren input type\
      - https://github.com/kevinswiber/siren#type-3\
      expect radio checkbox and file types that have thier\
      special UI implementation", ->
    scope.$apply(->
      scope.action =
        "fields": [
          {
          "type": "hidden"
          "name": "datetime1"
          }
          {
          "type": "text"
          "name": "text1"
          }
          {
          "type": "search"
          "name": "search1"
          }
          {
          "type": "tel"
          "name": "tel1"
          }
          {
          "type": "email"
          "name": "email1"
          }
          {
          "type": "password"
          "name": "password1"
          }
          {
          "type": "datetime"
          "name": "datetime1"
          }
          {
          "type": "date"
          "name": "date1"
          }
          {
          "type": "month"
          "name": "month1"
          }
          {
          "type": "week"
          "name": "week1"
          }
          {
          "type": "time"
          "name": "time1"
          }
          {
          "type": "datetime-local"
          "name": "datetime-local1"
          }
          {
          "type": "number"
          "name": "number1"
          }
          {
          "type": "range"
          "name": "range1"
          }
          {
          "type": "color"
          "name": "color1"
          }
          {
          "type": "image"
          "name": "image1"
          }
        ]
    )
    i = 0
    while i < scope.action.fields.length
      expect(ele.find('input[type="'+scope.action.fields[i].type+'"]')
        .first().attr('name')).toBe(scope.action.fields[i].name)
      i++
