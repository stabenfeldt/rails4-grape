angular
  .module('app')
  .controller('MainCtrl', ['Task', '$scope', function(Task, $scope) {
    $scope.tasks = Task.query();
  }]);
