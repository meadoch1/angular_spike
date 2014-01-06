app = angular.module("ScopeWorkflow", [])
    .value("decorateScopeWithWorkflow",    function(scope) {
        scope.view = "form";
        scope.showForm = function() {
            return scope.view == "form";
        };
        scope.showSubmitting = function() {
            return scope.view == "submitting";
        };
        scope.showComplete = function() {
            return scope.view == "complete";
        };
        scope.showError = function() {
            return scope.view == "submission error";
        };
        scope.markComplete = function(result) {
            console.log(result);
            scope.view = "complete";
        };
        scope.markError = function(error) {
            console.log(error);
            scope.view = "submission error";
        };
    });
