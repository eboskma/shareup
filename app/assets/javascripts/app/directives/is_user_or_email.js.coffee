angular.module 'shareupApp.directives'
  .directive 'isUserOrEmail', ($http, $timeout, $filter, $q) ->
    isUser = (input) ->
      d = $q.defer()
      
      if input?
        $http
          url: '/api/check/is_user'
          method: 'POST'
          data:
            name: input
        .then (data) ->
          if data.status == 200
            d.resolve data.data
          else
            d.reject data.data
      else
        d.reject 'No input'
      
      d.promise
    
    checking = null
    emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/
    
    restrict: 'A'
    require: 'ngModel'
    link: (scope, ele, attrs, ctrl) ->
      scope.$watch attrs.ngModel, (value) ->
        clearTimeout(checking) if checking?
        
        # value = scope.ngModel.$viewValue
        
        checking = $timeout ->
          isUser(value).then (data) ->
            if data.success
              checking = null
              ctrl.$setValidity 'isUserOrEmail', true
            else
              if emailRegex.test value
                checking = null
                ctrl.$setValidity 'isUserOrEmail', true
              else
                checking = null
                ctrl.$setValidity 'isUserOrEmail', false
        , 200