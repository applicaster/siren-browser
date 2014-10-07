describe "route tests", ->
  beforeEach(window.angular.mock.module("SirenBrowser"))
  location = undefined
  state = undefined
  rootScope = undefined
  beforeEach inject((_$location_, _$state_, _$rootScope_) ->
    location = _$location_
    state = _$state_
    rootScope = _$rootScope_
  )
  it "load siren browser show page on successful load of /siren-browser", ->
    location.path('/siren-browser')
    rootScope.$digest()
    expect(state.current.controller)
      .toBe('showCtrl as showCtrl')

  it "should redirect to the siren-browser path on non-existent route", ->
    location.path('/definitely/not/a/_route')
    rootScope.$digest()
    expect(state.current.controller)
      .toBe('showCtrl as showCtrl')
