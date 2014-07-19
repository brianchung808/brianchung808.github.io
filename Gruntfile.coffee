module.exports = (grunt) ->
	grunt.initConfig 
		pkg: grunt.file.readJSON 'package.json'	

		less: 
			production:
				options:
					paths: ['src/less']
					cleancss: true

				files:
					'dest/css/index.min.css': ['src/less/index.less']

		uglify:
			production:
				files:
					'dest/js/index.min.js': ['src/js/index.js']
				options:
					banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'


		clean: ['dest']


	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-clean'


	grunt.registerTask 'compile', ['less', 'uglify']
	grunt.registerTask 'default', ['clean', 'compile']