'use strict';
// Karma configuration
// Generated on Tue Sep 30 2014 10:36:32 GMT+0300 (IDT)

module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
      'bower_components/jquery/dist/jquery.min.js',
      'bower_components/angular/angular.min.js',
      'bower_components/angular-mocks/angular-mocks.js',
      '**/src/**/*Spec.coffee',
    ],

    webpack: {
  		cache: true,
  		module: {
  			loaders: [
          { test: /\.jade$/, loader: "jade" },
  				{ test: /\.coffee$/, loader: "coffee-loader" }
  			]
  		}
  	},


  	webpackServer: {
  		stats: {
  			colors: true
  		}
  	},


    webpackPort: 1234,

    plugins: [
        require("karma-jasmine"),
        require("karma-webpack"),
        require("karma-phantomjs-launcher")
    ],

    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor

    preprocessors: {
      '**/*.coffee': ['coffee'],
      '**/*.jade': ['jade'],
      '**/src/**/*Spec.coffee': ['webpack']
    },


    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  });
};
