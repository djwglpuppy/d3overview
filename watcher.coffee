module.exports = 
	activate: (grunt) ->
		grunt.event.on "watch", (e, filepath, context) ->
			if context is "coffee" or context is "coffee_no_tests"
				temp = {}
				temp["static/js/" + filepath.substr(9).replace(/\.coffee$/,".js")] = filepath
				grunt.config('coffee.compile.files', temp)