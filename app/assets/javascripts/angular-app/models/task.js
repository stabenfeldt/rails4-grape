angular
  .module('app')
  .factory('Task', function($resource) {

    var Task = $resource('http://localhost:4444/api/v1/tasks/:id.json', {id: '@id'}, {
      update: {
        method: 'PUT'
      }
    });

    return Task;
  });

