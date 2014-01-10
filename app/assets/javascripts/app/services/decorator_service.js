angular.module('services', [])
    .factory('InputDecoratorSvc', ['$http', '$q', function($http, $q) {
        return {
            getModelValidations: function(container, klass, fields) {
                var responsePromise = $http.get("/api/validations/fetch",
                                                {params: {classid: klass, fields: JSON.stringify(fields)}});
                responsePromise.then( function(response) {
                    container.validations = response.data.validations;
                });
            }

        }
    }]);
