angular.module 'shareupApp.services'
  .factory 'ShareService', ($resource) ->
    Share = $resource '/api/shares/:id.json',
      { id: '@id' },
      {}