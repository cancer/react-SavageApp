gulp       = require 'gulp'

webserver  = require 'gulp-webserver'
stubcell   = require 'gulp-stubcell'

watch      = require 'gulp-watch'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
reactify   = require 'coffee-reactify'
jade       = require 'gulp-jade'

gulp.task 'browserify', ->
  b = browserify()
  b.transform reactify
  b.add './coffee/app.coffee'
  b.bundle()
    .pipe source 'app.js'
    .pipe gulp.dest './htdocs/js'

gulp.task 'template', ->
  gulp.src './jade/**/*.jade'
    .pipe jade
      locals: {}
    .pipe gulp.dest './htdocs'

gulp.task 'server', ->
  gulp.src './htdocs'
    .pipe webserver
      port: 9001
      livereload: true
      directoryListing: false
      proxies: [
        source: "/api/members"
        target: "localhost:3000/members"
      ]
      #middleware: (connect, o) ->
      #  return ->
      #    options = url.parse 'http"://localhost:3000/test'
      #    options.root = '/test'
      #    proxy options

gulp.task 'stubcell', ->
  stubcell.start
    entry: 'api/entry.yml'
    port: 3000

gulp.task 'watch', ->
  gulp.watch 'coffee/**/*', ['browserify']
  gulp.watch 'jade/**/*.jade', ['template']

gulp.task 'default', ['server', 'stubcell', 'watch']

