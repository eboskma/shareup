angular.module 'shareupApp.controllers'
  .controller 'HomeController', ($scope, session, SessionService, ArticleService, ShareService) ->
    ArticleService.getLatestFeed()
      .then (data) ->
        $scope.articles = data
    $scope.user = session.user