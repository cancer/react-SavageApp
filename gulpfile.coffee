gulp       = require 'gulp'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
watch      = require 'gulp-watch'
webserver  = require 'gulp-webserver'
reactify   = require 'coffee-reactify'

gulp.task 'browserify', ->
  b = browserify()
  b.transform reactify
  b.add './app.coffee'
  b.bundle()
    .pipe source 'app.js'
    .pipe gulp.dest './htdocs'

gulp.task 'server', ->
  gulp.src './htdocs'
    .pipe webserver
      port: 9001
      livereload: true
      directoryListing: false
      proxies: []

gulp.task 'watch', ->
  gulp.watch 'coffee/**/*', ['browserify']

gulp.task 'default', ['server', 'watch']

