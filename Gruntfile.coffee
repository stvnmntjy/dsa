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

  grunt.registerTask 'prod', ['clean', 'jade:prod', 'stylus:prod', 'coffee:prod']

  return

