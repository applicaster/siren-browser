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
