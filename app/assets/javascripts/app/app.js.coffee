@app = angular.module 'shareupApp', [
  'ngRoute'
  'ngResource'
  'shareupApp.controllers'
  'shareupApp.services'
  'shareupApp.directives'
]
  
@app.config ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: '/assets/dashboard.html'
      controller: 'HomeController'
      resolve: 
        session: (SessionService) ->
          SessionService.getCurrentUser()
    .otherwise
      redirectTo: '/'
      
angular.module 'shareupApp.controllers', ['ngSanitize']
angular.module 'shareupApp.services', ['ngResource']
angular.module 'shareupApp.directives', []