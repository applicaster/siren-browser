# Siren Browser
Front end [Siren API](https://github.com/kevinswiber/siren) web browser.
The work is based to some extent on both - https://github.com/wurlinc/siren-browser, and https://github.com/kevinswiber/siren-api-browser siren browsers.

## Live demo

[http://applicaster.github.io/siren-broswer/](http://applicaster.github.io/siren-broswer/)

## Why build a new one?
* https://github.com/wurlinc/siren-browser - [isn't supported anymore](https://github.com/wurlinc/siren-browser/issues/4).
* https://github.com/kevinswiber/siren-api-browser - Siren Action submission has some error and to change it caused a lot of major refactoring in the code. Another issue is the lack of sub-entities action support and lack of unit tests.

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
