@app = angular.module 'shareupApp', [
  'ngRoute'
  'shareupApp.controllers'
  'shareupApp.services'
]
  
@app.config ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: '/templates/dashboard.html'
      controller: 'HomeController'
    .otherwise
      redirectTo: '/'