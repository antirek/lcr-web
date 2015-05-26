angular.module 'lcr'
.controller 'ProvidersListController', [
  '$scope',
  'Provider',
  ($scope, Provider)->
    $scope.providers = []
    $scope.providers = Provider.query()

]