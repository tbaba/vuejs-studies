((exports) ->
  STORAGE_KEY = 'todo-list'

  app1 = exports.app1 = new Vue
    el: '#demo1'
    data:
      message: ''

  app2 = exports.app2 = new Vue
    el: '#demo2'
    data:
      todos: todoStorage.fetch()
      message: ''
    ready: ->
      this.$watch 'todos', (todos) ->
        todoStorage.save(todos)

    methods:
      addTodo: (e) ->
        e.preventDefault()
        value = this.message and this.message.trim()
        return if !value

        this.todos.push(body: value, done: false)
        this.message = ''
)(window)
