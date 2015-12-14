app.controller('StaticPagesCtrl', ['$scope', '$location', '$auth', '$http', function($scope, $location, $auth, $http){

  var url = "api/v1/";

  $scope.message = "Hello World!";
  $scope.currentUser = null;

  $auth.validateUser().then(function(resp){
    console.log(resp);
    $scope.currentUser = resp;
  }).catch(function(resp){
    console.log(resp);
  });

  $scope.newSentence = {};

  $scope.newSentence.submit = function(){
    $http.post(url + '/sentences', {
      sentence: {
        content: $scope.newSentence.content
      }
    }).success(function(resp){
      console.log(resp);
      $scope.getWrittenSentences();
      $scope.getThreeNewWords();
      $scope.newSentence.content = '';
    });
  };

  $scope.getWrittenSentences = function(){
    $http.get(url + '/sentences').success(function(resp){
      $scope.sentences = resp;
    });
  }

  $scope.getThreeNewWords = function(){
    $http.get(url + '/three_new_words').success(function(resp){
      $scope.three_new_words = resp;
    });
  }

  $scope.getWrittenSentences();
  $scope.getThreeNewWords();
}]);
