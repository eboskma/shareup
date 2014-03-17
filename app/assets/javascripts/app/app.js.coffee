@app = angular.module 'shareupApp', [
  'ngRoute'
  'ngResource'
  'shareupApp.controllers'
  'shareupApp.services'
]
  
@app.config ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: '/templates/dashboard.html'
      controller: 'HomeController'
      resolve: 
        session: (SessionService) ->
          SessionService.getCurrentUser()
    .otherwise
      redirectTo: '/'
      
angular.module 'shareupApp.controllers', []
angular.module 'shareupApp.services', ['ngResource']