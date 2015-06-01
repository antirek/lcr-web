angular.module 'lcr'
.controller 'ProviderCreateController', [
  '$scope',
  '$state',
  'Provider',
  'Papa',
  ($scope, $state, Provider, Papa)->
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