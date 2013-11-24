_src = 'src'
_bin = 'bin'
_bower = 'bower_components'
_compiled = 'compiled'

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean: ["#{_bin}", "#{_compiled}"]
    coffee:
      prod:
        files: [
          {
            src: [
              "#{_src}/modules/service.coffee"
              "#{_src}/services/algos.coffee"
              "#{_src}/modules/directive.coffee"
              "#{_src}/directives/barchart.coffee"
              "#{_src}/modules/ctrl.coffee"
              "#{_src}/controllers/appctrl.coffee"
              "#{_src}/modules/app.coffee"
            ]
            dest: "#{_compiled}/coffee.js"
            nonull: true
          }
        ]
    concat:
      prod:
        options:
          separator: '\n'
          stripBanners:
            block: true
            line: true
        files: [
          {
            src: [
              "#{_bower}/bootstrap/dist/css/bootstrap.min.css"
              "#{_bower}/font-awesome/css/font-awesome.min.css"
              "#{_compiled}/stylus.css"
            ]
            dest: "#{_bin}/css/dsa.css"
            nonull: true
          }
          {
            src: [
              "#{_bower}/jquery/jquery.min.js"
              "#{_bower}/bootstrap/dist/js/bootstrap.min.js"
              "#{_bower}/chance/chance.js"
              "#{_bower}/d3/d3.js"
              "#{_bower}/angular/angular.js"
              "#{_compiled}/coffee.js"
            ]
            dest: "#{_bin}/js/dsa.js"
            nonull: true
          }
        ]
    copy:
      prod:
        files: [
          {
            src: [
              '**'
            ]
            dest: "#{_bin}/fonts/"
            expand: true
            cwd: "#{_bower}/font-awesome/fonts"
            nonull: true
          }
        ]
    jade:
      prod:
        options:
          pretty: true
        files: [
          {
            src: [
              "#{_src}/index.jade"
            ]
            dest: "#{_bin}/index.html"
            nonull: true
          }
        ]
    stylus:
      prod:
        files: [
          {
            src: [
              "#{_src}/stylus/index.styl"
            ]
            dest: "#{_compiled}/stylus.css"
            nonull: true
          }
        ]

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'prod', ['clean', 'jade:prod', 'stylus:prod', 'coffee:prod', 'concat:prod', 'copy:prod']

  return

