app.controller('StaticPagesCtrl', ['$scope', '$location', function($scope, $location){
  $scope.message = "Hello World!";

  $scope.signUp = function(){
    $location.path('signup');
  };
}]);
