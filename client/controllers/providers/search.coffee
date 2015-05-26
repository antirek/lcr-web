angular.module 'lcr'
.controller 'ProviderSearchController', [
  '$scope',
  '$state',
  'Provider',
  ($scope, $state, Provider)->
    $scope.providers = []
    $scope.providers = Provider.query()
    $scope.searchResult = []
    $scope.query = ''
    $scope.searchInProgress = false
    $scope.search = ()->
      $scope.searchInProgress = true
      providers = angular.copy $scope.providers
      searchQuery = angular.copy $scope.query;
      $scope.searchResult = []
      for index of providers
        query = searchQuery
        provider = providers[index]
        while query.length > 0
          for key of provider.directions
            direction = provider.directions[key]
            if direction.template is query
              $scope.searchResult.push
                provider: provider.name
                template: direction.template
                price: direction.price
              query = ''

          query = query.slice(0, -1)
      $scope.searchInProgress = false

]