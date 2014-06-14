((exports) ->
  Parse.initialize("4fD79Ombrc7GGDqiYlkaBBj8VzaQkZXU34EUDy55", "1cmwRRDueMDeNjUqQD8qc93XAeaEtSkmNsGz4Amd")

  app4 = exports.app4 = new Vue
    el: '#demo4'
    data:
      users: []
    methods:
      createUser: (ev) ->
        ev.preventDefault()

        user = new Parse.User()
        user.set 'username', this.user.username
        user.set 'password', this.user.password
        user.set 'email', this.user.email

        user.signUp(null, {
          success: (user) ->
            app4.users.push(user.attributes)
            app4.$data.user.username = ''
            app4.$data.user.email = ''
            app4.$data.user.password = ''

          error: (user, error) ->
            alert("Error: " + error.code + " " + error.message)
        })
)(window)
