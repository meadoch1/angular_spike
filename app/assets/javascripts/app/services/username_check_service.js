angular.module('UserServices', [])
    .factory('UsernameCheckSvc', ['$http', function($http) {
        return {
            checkUnique: function(user) {
                var name = user.username;
                if (name) {
                    var responsePromise = $http.get("/api/registrations/unique",
                                                    {params: {username: name}});
                    responsePromise.then( function(response) {
                        user.isUsernameUnique = response.data.unique
                    });
                }

            }
        }
    }]);
