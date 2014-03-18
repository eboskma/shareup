angular.module 'shareupApp.controllers'
  .controller 'HomeController', ($scope, $sanitize, session, SessionService, ArticleService, ShareService) ->
    ArticleService.getLatestFeed()
      .then (data) ->
        # console.log data
        $scope.articles = data
    
    $scope.user = session.user
    
    $scope.newShare = 
      recipient: ''
    
    $scope.share = (article) ->
      console.log arguments
      share = new ShareService
        url: article.link
        from_user: $scope.user.id
        user: $scope.newShare.recipient
      share.$save()
      $scope.newShare.recipient = ''
