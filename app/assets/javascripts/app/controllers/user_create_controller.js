app = angular.module("UserCreate", ["User", "PasswordVerifyDir", "PasswordNoMatchDir", "ScopeWorkflow", "UserServices", "inputs", "services"])
    .controller("UserCreateCtrl",  [ "$scope", "$http", 'User', 'decorateScopeWithWorkflow', 'UsernameCheckSvc', 'InputDecoratorSvc', function($scope, $http, User, decorateScopeWithWorkflow, UsernameCheckSvc, decorator) {
        $scope.user = {isUsernameUnique: true};
        $scope.validationShow = function(name) {
            return 'createForm.username.$error.' + name
        };
        // $scope.validations = {
        //     'username': [
        //         {"input_attribute": 'required', "show": $scope.validationShow('required'), "message":"I am validation 1"}, 
        //         {"input_attribute": 'ng-pattern', "show": $scope.validationShow('pattern'), "message":"I am validation 2"}],
        //     'password': ['d','e','f']
        // };
        $scope.labels = {
            'username': "Username",
            'password': "Password",
            'password_confirmation': "Password Confirmation",
            'email': "Email Address"
        };
        $scope.validations = 
        $scope.decorations = {
            "validations": undefined,
            "label": $scope.labels['username'],
            "field_name": 'username',
            "model": 'user',
            "form_name": 'createForm'
        };
        decorator.getModelValidations($scope.decorations, 'User', ['username','password','password_confirmation','email']),
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
        $scope.checkValidation = function(validation) {
            return $scope.decorations.form_name + '.' + $scope.decorations.field_name + '.$error.' + validation.show_attribute
        }
    }]);
