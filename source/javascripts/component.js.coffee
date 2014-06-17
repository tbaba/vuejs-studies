((exports) ->
  Parse.initialize('iut9qNSHERM5wM5dLRpHHsr3CLgtNVE2g2f6iNvn', 'aQ7Vu2oq8XguWLUggB33xyhVaLAI19on3hzNFgYl')

  Vue.component('homeView', {
    template: """
    <h2>homeView</h2>
    <p>ほーむびゅー</p>
    """
  })

  Vue.component('signUpView', {
    template: """
    <h2>signUpView</h2>
    <form v-on="submit:signUp" role="form" style="width: 400px;">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" class="form-control" v-model="username"/>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" class="form-control" v-model="email"/>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" class="form-control" v-model="password"/>
      </div>
      <button type="submit" class="btn btn-default">SignUp</button>
    </form>
    """
  })

  Vue.component('loginView', {
    template: """
    <h2>loginView</h2>
    """
  })

  Vue.component('notFound', {
    template: """
    <h2>NotFound</h2>
    """
  })

  routes = ['homeView', 'signUpView', 'loginView']

  exports.getRoute = ->
    path = location.hash.replace(/^#!\/?/, '') || routes[0]
    if routes.indexOf(path) > -1 then path else 'notFound'

  exports.addEventListener 'hashchange', ->
    exports.componentApp.currentView = exports.getRoute()

  componentApp = exports.componentApp = new Vue
    el: '#component'
    data:
      currentView: exports.getRoute()
      routes: routes
      users: []
      username: ''
      email: ''
      password: ''
    methods:
      signUp: (el) ->
        el.preventDefault()

        newUser = new Parse.User()
        newUser.set 'username', this.username
        newUser.set 'password', this.password
        newUser.set 'email', this.email

        newUser.signUp(null, {
          success: (user) ->
            componentApp.users.push(user.attributes)
            componentApp.$data.username = ''
            componentApp.$data.email = ''
            componentApp.$data.password = ''
          error: (user, error) ->
            alert "Error: #{error.code} #{error.message}"
        })
)(window)
