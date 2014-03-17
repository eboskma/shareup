angular.module 'shareupApp.services'
  .factory 'SessionService', ($http, $q) ->
    service = 
      getCurrentUser: ->
        if service.isAuthenticated()
          return $q.when(service.currentUser)
        else
          return $http.get '/api/current_user'
            .then (resp) ->
              service.current_user = resp.data
      currentUser: null
      isAuthenticated: ->
        !!service.currentUser