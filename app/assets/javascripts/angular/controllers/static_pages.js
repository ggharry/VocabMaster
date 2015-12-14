app.controller('StaticPagesCtrl', ['$scope', '$location', '$auth', function($scope, $location, $auth){
  $scope.message = "Hello World!";
  $scope.currentUser = null;

  $scope.signUp = function(){
    $location.path('signup');
  };

  $auth.validateUser().then(function(resp){
    console.log(resp);
    $scope.currentUser = resp;
  }).catch(function(resp){
    console.log(resp);
  });
}]);
