angular
  .module('app')
  .controller 'CustomersCtrl', ['$scope', 'Restangular', 'Session',
  ($scope, Restangular, Session) ->
    # Initalize the Customer object
    Customer = Restangular.all('customers')

    Session.create('res.id', 'res.user.id', 'res.user.role')
    Session.userId

    console.log('userId seen from the controller: ' + Session.userId )

    $scope.customers = {}
    #$scope.customer = { name: 'hei' }

    $scope.readSession = () ->
      console.log('Read session: ' + Session.userId )



    $scope.getCustomers = () ->
      Customer.getList().then (customers) ->
        $scope.customers = customers


    $scope.save = (customer) ->
      if customer.id?
        customer.save().then (customer) ->
          $scope.getCustomers()
          $scope.customer = {}
      else
        Customer.post(customer).then (customer) ->
          $scope.getCustomers()
          $scope.customer = {}


    $scope.edit = (customer) ->
      Customer.get(customer.id).then (customer) ->
        $scope.customer = customer

    $scope.delete = (customer) ->
      customer.remove().then (customer) ->
        $scope.getCustomers()
]
  #.factory "notify", [
  #  "$window"
  #  (win) ->
  #    msgs = []
  #    return (msg) ->
  #      msgs.push msg
  #      if msgs.length is 3
  #        win.alert msgs.join("\n")
  #        msgs = []
  #      return
  #]

