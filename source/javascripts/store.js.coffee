((exports) ->
  STORAGE_KEY = 'todolist-vuejs'
  FIREBASE_URL = 'https://dazzling-fire-1988.firebaseio.com'

  exports.todoStorage = new Firebase("#{FIREBASE_URL}/todos")
  exports.firebase_url = FIREBASE_URL
)(window)
