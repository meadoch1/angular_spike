app = angular.module("UserCreate", ["User", "PasswordVerifyDir", "PasswordNoMatchDir", "ScopeWorkflow", "UserServices"])
    .controller("UserCreateCtrl",  [ "$scope", "$http", 'User', 'decorateScopeWithWorkflow', 'UsernameCheckSvc', function($scope, $http, User, decorateScopeWithWorkflow, UsernameCheckSvc) {
        $scope.user = {isUsernameUnique: true};
        decorateScopeWithWorkflow($scope);
        $scope.checkUsername = function() {
            UsernameCheckSvc.checkUnique($scope.user);
        };
        $scope.addUser = function() {
            var user;
            user = User.save($scope.user).$promise.then($scope.markComplete, $scope.markError);
            $scope.view = "submitting"
            return $scope.user = user;
        };
        $scope.clearUniqueCheck = function() {
            $scope.user.isUsernameUnique = true;
        };
    }]);
