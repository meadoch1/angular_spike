angular.module("PasswordNoMatchDir", [])
    .directive("passwordNomatch", function() {
        return {
            require: "ngModel",
            scope: {
                passwordNomatch: '='
            },
            link: function(scope, element, attrs, ctrl) {
                scope.$watch(function() {
                    var combined;

                    if (scope.passwordNomatch || ctrl.$viewValue) {
                        combined = scope.passwordNomatch + '_' + ctrl.$viewValue;
                    }
                    return combined;
                }, function(value) {
                    if (value) {
                        ctrl.$parsers.unshift(function(viewValue) {
                            var origin = scope.passwordNomatch;
                            if (origin == viewValue) {
                                ctrl.$setValidity("passwordNomatch", false);
                                return undefined;
                            } else {
                                ctrl.$setValidity("passwordNomatch", true);
                                return viewValue;
                            }
                        });
                    }
                });
            }
        };
    });
