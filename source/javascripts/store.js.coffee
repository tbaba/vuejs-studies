((exports) ->
  STORAGE_KEY = 'todolist-vuejs'

  exports.todoStorage =
    fetch: ->
      console.log "fetch todos from #{STORAGE_KEY}"
      JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]')
    save: (todos) ->
      console.log "save todos to #{STORAGE_KEY}"
      localStorage.setItem(STORAGE_KEY, JSON.stringify(todos))
)(window)
