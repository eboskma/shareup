angular.module 'shareupApp.controllers', []
  .controller 'HomeController', ($scope, ArticleService) ->
    ArticleService.getLatestFeed()
      .then (data) ->
        $scope.articles = data