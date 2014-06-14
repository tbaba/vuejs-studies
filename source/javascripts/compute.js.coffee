((exports) ->
	app3 = exports.app3 = new Vue
		el: '#demo3'

		data:
			firstName: ''
			lastName: ''

		computed:
			fullName:
				$get: ->
					"#{this.firstName} #{this.lastName}"
)(window)
