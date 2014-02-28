_ = require("underscore")
# lr = require("./livereload")
watcher = require("./watcher")

module.exports = (grunt) ->
    NPM_TASK_LIBS = [
        'grunt-contrib-requirejs'
        'grunt-contrib-watch'
        'grunt-contrib-coffee'
        'grunt-coffeelint'
        # 'grunt-contrib-jasmine'

    ]

    COFFEE_FILES = [
        'views/js/**/*.coffee'
    ]

    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')
        coffeelint:
            app: ["views/js/*.coffee"]
            options:
                indentation: {level: "ignore"}
                max_line_length: {level: "ignore"}
                no_throwing_strings: {level: "ignore"}

        coffee:
            compile:
                files: {}

        # jasmine:
        #     default: grunt.file.readJSON('jasmine.desktop.json')
        #     mobile: grunt.file.readJSON('jasmine.mobile.json')

        watch:
            coffee:
                files: COFFEE_FILES
                tasks: ['coffeelint', 'coffee']
                options: {spawn: false}


    _.each(NPM_TASK_LIBS, grunt.loadNpmTasks)
    grunt.registerTask('default', ['watch'])
    watcher.activate(grunt)