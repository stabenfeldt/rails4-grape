angular
  .module('app')
  .controller('UsersCtrl', ['User', '$scope', function(User, $scope) {
    $scope.users = User.query();
  }]);
