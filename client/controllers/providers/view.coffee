angular.module 'lcr'
.controller 'ProviderViewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Provider',
  ($scope, $state, $stateParams, Provider)->
    $scope.provider = Provider.get id: $stateParams.id
    $scope.save = ()->
      $scope.provider.$save ()->
        $state.go 'providers', {}, reload: true
    if !$scope.provider.directions
      $scope.provider.directions = []

    $scope.addDirection = ()->
      $scope.provider.directions.push
        template: ''
        price: ''

    $scope.removeDirection = (index)->
      $scope.provider.directions.splice index, 1

    $scope.delete = ()->
      $scope.provider.$delete ()->
        $state.go 'providers', {}, reload: true
]