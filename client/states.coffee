angular.module 'lcr'
.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise '/'

  $stateProvider
  .state
      name: 'main'
      url: '/'
  .state
      name: 'providers'
      url: '/providers'
      views:
        list:
          controller: 'ProvidersListController'
          templateUrl: '/partials/providers/list'
  .state
      name: 'providers.view'
      url: '/view/:id'
      views:
        'data@':
          controller: 'ProviderViewController'
          templateUrl: '/partials/providers/view'
  .state
      name: 'providers.create'
      url: '/create'
      views:
        'data@':
          controller: 'ProviderCreateController'
          templateUrl: '/partials/providers/create'
  .state
      name: 'providers.search'
      url: '/search'
      views:
        'data@':
          controller: 'ProviderSearchController'
          templateUrl: '/partials/providers/search'
]