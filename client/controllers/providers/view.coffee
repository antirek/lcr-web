angular.module 'lcr'
.controller 'ProviderViewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Provider',
  'Papa',
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

    $scope.addFromFile = ()->
      if $scope.files && $scope.files[0]
        Papa.parse $scope.files[0],
          delimiter: ';'
          skipEmptyLines: true
          complete: (results)->
            results.data.forEach (elem)->
              if elem[0] && elem[1]
                $scope.provider.directions.push
                  template: elem[0]
                  price: elem[1]
            $scope.$apply()
]