module.exports = (grunt) ->
	grunt.initConfig 
		pkg: grunt.file.readJSON 'package.json'	
		less: 
			production:
				options:
					paths: ['src/less']
					cleancss: true

				files:
					'dest/css/main.css': ['src/less/main.less']

		uglify:
			production:
				files:
					'dest/js/index.min.js': ['src/js/index.js']
				options:
					banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'

	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-uglify'

	grunt.registerTask 'default', ['less', 'uglify']