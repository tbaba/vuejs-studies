((exports) ->
  storage = exports.todoStorage

  storage.on 'child_added', (snapshot) ->
    item = snapshot.val()
    item.id = snapshot.name()
    app2.todos.push(item)

  storage.on 'child_removed', (snapshot) ->
    id = snapshot.name()
    app2.todos.some (todo) ->
      if todo.id is id
        app2.todos.$remove(todo)
        true

  app2 = exports.app2 = new Vue
    el: '#demo2'
    data:
      todos: []
      message: ''

    methods:
      addTodo: (ev) ->
        ev.preventDefault()
        value = this.message and this.message.trim()
        return if !value

        newTodo =
          body: value
          done: false

        storage.push newTodo
        this.message = ''

      removeTodo: (todo) ->
        new Firebase("#{exports.firebase_url}/todos/#{todo.$data.todo.id}").remove()

      toggleTodo: (todo) ->
        new Firebase("#{exports.firebase_url}/todos/#{todo.$data.todo.id}").update(done: todo.$data.todo.done)
)(window)
