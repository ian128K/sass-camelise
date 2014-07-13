module.exports = (grunt) ->

	# Modules
	grunt.loadNpmTasks('bootcamp')
	grunt.loadNpmTasks('grunt-contrib-sass')
	grunt.loadNpmTasks('grunt-contrib-watch')

	# Grunt Tasks
	grunt.initConfig(
		meta:
			version: '1.0.0-alpha.1'

		# Sass
		sass:
			test:
				options:
					style: 'expanded',
					loadPath: './node_modules/bootcamp/dist'
				files:
					'./specresults.css': './specrunner.sass'

		# Bootcamp
		bootcamp:
			test:
				files:
					src: ['./specresults.css']

		# Watch
		watch:
			dist:
				files: ['./**/*.sass']
				tasks: ['sass', 'bootcamp']

	# Tasks
	grunt.registerTask('default', ['sass', 'bootcamp', 'watch'])
	grunt.registerTask('test',    ['sass', 'bootcamp']))