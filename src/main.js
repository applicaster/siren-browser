'use strict';
require("angular-ui-router");
require("angular-bootstrap/ui-bootstrap.js");
require("angular-bootstrap/ui-bootstrap-tpls.js");
// require("siren.coffee");
require("./modules/siren-browser/siren-browser.coffee");

var body = require("./body.jade");
$("body").html(body);

angular.module('MyApp', ['ui.bootstrap','SirenBrowser'])
  .filter('encodeURIComponent', function() {
    return window.encodeURIComponent;
  })
  .filter('prettify', function() {
    return function(obj) {
      return JSON.stringify(obj, function(key, val) {
        return (key === '$$hashKey') ? undefined : val;
      }, 2);
    };
  });

$(function() {
  angular.bootstrap(document, ['MyApp']);
});
