angular.module 'lcr'
.factory 'Provider', ['$resource', ($resource)->
  $resource '/providers/:id', id: '@_id'
]