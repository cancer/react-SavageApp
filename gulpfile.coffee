gulp         = require 'gulp'

webserver    = require 'gulp-webserver'
stubcell     = require 'gulp-stubcell'

jade         = require 'gulp-jade'
compass      = require 'gulp-compass'
autoprefixer = require 'gulp-autoprefixer'
cssmin       = require 'gulp-cssmin'
watch        = require 'gulp-watch'
browserify   = require 'browserify'
source       = require 'vinyl-source-stream'
reactify     = require 'coffee-reactify'

gulp.task 'browserify', ->
  b = browserify()
  b.transform reactify
  b.add './coffee/app.coffee'
  b.bundle()
    .pipe source 'app.js'
    .pipe gulp.dest './htdocs/js'

# compile jade
gulp.task 'template', ->
  gulp.src './jade/**/*.jade'
    .pipe jade
      locals: {}
    .pipe gulp.dest './htdocs'

# compile scss
gulp.task 'css', ->
  gulp.src 'scss/**/*.scss'
    .pipe compass
      css: './htdocs/css'
      sass: './scss'
      bundle_exec: true
    .pipe autoprefixer()
    #.pipe cssmin()
    .pipe gulp.dest './htdocs/css'

# copy font
gulp.task 'fonts', ->
  gulp.src './bower_components/ratchet/fonts/**/*'
    .pipe gulp.dest './htdocs/fonts'

gulp.task 'server', ->
  gulp.src './htdocs'
    .pipe webserver
      port: 9001
      livereload: true
      directoryListing: false
      proxies: [
        {
          source: "/api/members"
          target: "http://localhost:3000/api/members"
        }
      ]
      #middleware: (connect, o) ->
      #  return ->
      #    options = url.parse 'http"://localhost:3000/'
      #    options.root = '/'
      #    proxy options

gulp.task 'stubcell', ->
  stubcell.start
    entry: './api/entry.yml'
    port: 3000

gulp.task 'watch', ->
  gulp.watch 'coffee/**/*', ['browserify']
  gulp.watch 'jade/**/*',   ['template']
  gulp.watch 'scss/**/*',   ['css']

gulp.task 'default', ['server', 'stubcell', 'watch']

