angular
  .module('app', ['ngRoute', 'restangular'])
  .config(['$routeProvider', 'RestangularProvider', function($routeProvider, RestangularProvider) {
    RestangularProvider.setBaseUrl('/api/v1');
    // $routeProvider.when('/', {
    //   controller: 'MainCtrl'
    // }).when('/:status', {
    //   controller: 'HomeCtrl',
    // }).otherwise({
    //   redirectTo: '/'
    // });
  }]);
