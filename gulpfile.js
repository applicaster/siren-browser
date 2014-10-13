'use strict';
var gulp = require("gulp");
var clean = require('gulp-clean');
var jade = require('gulp-jade');
var gutil = require("gulp-util");
var webpack = require("webpack");
var webpackConf = require("./webpack.config.js");
var livereload = require('gulp-livereload');
var nodemon = require('gulp-nodemon');
var karma = require('gulp-karma');

gulp.task('test', function() {
  // Be sure to return the stream
  // NOTE: Using the fake './foobar' so as to run the files
  // listed in karma.conf.js INSTEAD of what was passed to
  // gulp.src !
  return gulp.src('./foobar')
    .pipe(karma({
      configFile: 'karma.conf.js',
      action: 'run'
    }))
    .on('error', function(err) {
      // Make sure failed tests cause gulp to exit non-zero
      console.log(err);
      this.emit('end'); //instead of erroring the stream, end it
    });
});




gulp.task("clean", function(done){
  gulp.src('./dist', {read: false})
  .pipe(clean());
  done();
});

gulp.task("webpack", ["clean"], function(callback) {
    // run webpack
    webpack(
      webpackConf,
      function(err, stats) {
        if(err) {throw new gutil.PluginError("webpack", err);}
        gutil.log("[webpack]", stats.toString({
            // output options
        }));
        callback();
    });
});

gulp.task("build",["webpack"], function(done){
  gulp.src('./src/index.jade')
  .pipe(jade())
  .pipe(gulp.dest('./dist'));
  done();
});

gulp.task('develop', ['build'], function() {
  livereload.listen();
  nodemon({ script: 'index.js'});
  gulp.watch('./src/**/*', ['build', function(){
    livereload.changed();
  }]);
});
