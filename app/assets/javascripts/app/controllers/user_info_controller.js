app = angular.module("UserInfo", ["User", "ScopeWorkflow"])
    .controller("UserInfoCtrl",  [ "$scope", 'User', 'decorateScopeWithWorkflow', function($scope, User, decorateScopeWithWorkflow) {
        $scope.init = function(id) {
            $scope.user = User.get({id: id});
        };
        decorateScopeWithWorkflow($scope);
        $scope.addUserInfo = function() {
            var user;
            user = User.update($scope.user, $scope.markComplete, $scope.markError);
            $scope.view = "submitting"
            return $scope.user = user;
        };
    }]);
