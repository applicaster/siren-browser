# Siren Browser [![Build Status](https://travis-ci.org/applicaster/siren-broswer.svg?branch=master)](https://travis-ci.org/applicaster/siren-broswer) [![Dependency Status](https://david-dm.org/applicaster/siren-broswer.svg)](https://david-dm.org/applicaster/siren-broswer)

Front end Siren API browser build in Angular


## Goal
To have a production ready [Siren API](https://github.com/kevinswiber/siren) Browser that is fully tested and supports all Siren API features.



The work is based to some extent on both - https://github.com/wurlinc/siren-browser, and https://github.com/kevinswiber/siren-api-browser siren browsers.


## Live demo

[http://applicaster.github.io/siren-broswer/](http://applicaster.github.io/siren-broswer/)

## Why build a new one?

The work is based to some extent on both - https://github.com/wurlinc/siren-browser, and https://github.com/kevinswiber/siren-api-browser siren browsers.

* https://github.com/wurlinc/siren-browser - [isn't actively supported](https://github.com/wurlinc/siren-browser/issues/4).
* https://github.com/kevinswiber/siren-api-browser - Our browser is heavily inspired on @kevinswiber's work in terms of UI and some of the logics. Once we feel its stable enough we'll create a pull request and hope it can be treated as the 2.0 fork of @kevinswiber's implementation. Our browser has all the functionality of @kevinswiber's browser + test coverege and support for sub-entities actions inline.

## Environment setup
* Make sure you have node.js installed.
* Make sure you have `gulp cli` installed. if not run:
```
npm install --g gulp
```
* Make sure you have `bower cli` installed. if not run:
```
npm install -g bower
```
* clone this repository and run:
```
npm insall
bower install

```


## Usage
* Run:
```
gulp develop
```
* Go to [localhost:3000](http://localhost:3000/)

## Run Tests
```
gulp test
```

## Contributing
Please follow these [Commit Message Conventions](https://github.com/camunda/camunda.org/blob/master/COMMIT_MESSAGES.md).


## Environment Architecture
* Gulp - for build.
* Webpack - for dependencies management.
* Coffeescript - for coding.
* Karma - for testing.
* Jade - for HTML templates.
