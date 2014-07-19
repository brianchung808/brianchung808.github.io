module.exports = (grunt) ->
	grunt.initConfig 
		pkg: grunt.file.readJSON 'package.json'	

		htmlmin:
			dist:
				options:
					removeComments: true
					collapseWhitespace: true
				files:
					'index.html' : 'src/index.html'

			dev:
				files:
					'index.html' : 'src/index.html'

		less: 
			dist:
				options:
					paths: ['src/less']
					cleancss: true

				files:
					'dest/css/index.min.css': ['src/less/index.less']

			dev:
				options:
					paths: ['src/less']

				files:	
					'dest/css/index.min.css': ['src/less/index.less']

		uglify:
			dist:
				files:
					'dest/js/index.min.js': ['src/js/index.js']
				options:
					banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'

		clean: ['dest', 'index.html']

	# task packages we are using
	taskPackages = [
		'grunt-contrib-less'
		'grunt-contrib-uglify'
		'grunt-contrib-clean'
		'grunt-newer'
		'grunt-contrib-htmlmin'
	]

	# load the npm tasks
	grunt.loadNpmTasks task for task in taskPackages 

	grunt.registerTask 'compile', [
		'newer:less:dev' 
		'newer:uglify:dist'
		'newer:htmlmin:dev'
	]

	grunt.registerTask 'dist', [
		'clean'
		'newer:less:dist'
		'newer:uglify:dist'
		'newer:htmlmin:dist'
	]

	grunt.registerTask 'default', [
		'compile'
	]