angular
  .module('app')
  .service('helloWorldFromService', function() {
    console.log('helloWorldFromService');
    this.sayHello = function() {
        return "Hello, World!"
    };
});
