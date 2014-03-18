angular.module 'shareupApp.services'
  .factory 'ArticleService', ($http, $q) ->
    getLatestFeed: ->
      d = $q.defer();
      feed_url = encodeURIComponent 'https://news.ycombinator.com/rss'
      # feed_url = encodeURIComponent 'http://feeds.arstechnica.com/arstechnica/index'
      $http.jsonp("http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=50&callback=JSON_CALLBACK&q=#{feed_url}")
        .then (data, status) ->
          if data.status is 200
            d.resolve data.data.responseData.feed.entries
          else
            d.reject data
      
      d.promise