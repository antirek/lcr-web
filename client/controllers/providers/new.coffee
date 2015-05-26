angular.module 'lcr'
.controller 'ProviderCreateController', [
  '$scope',
  '$state',
  'Provider',
  ($scope, $state, Provider)->
    $scope.provider = new Provider
      name: ''
      directions: []
    $scope.save = ()->
      $scope.provider.$save ()->
        $state.go 'providers', {}, reload: true

    $scope.addDirection = ()->
      $scope.provider.directions.push
        template: ''
        price: ''

    $scope.removeDirection = (index)->
      $scope.provider.directions.splice index, 1

]