((exports) ->
  STORAGE_KEY = 'todo-list'

  app1 = exports.app1 = new Vue
    el: '#demo1'
    data:
      message: ''

  app2 = exports.app2 = new Vue
    el: '#demo2'
    data:
      todos: [
        { message: 'Vue.jsに触れる', done: true }
        { message: 'Vue.jsに慣れる', done: false }
      ]
    methods:
      submit: (e) ->
        e.preventDefault()
        dd = new Date()
        this.todos.$set dd.getTime(), { message: this.message, done: false }
)(window)
