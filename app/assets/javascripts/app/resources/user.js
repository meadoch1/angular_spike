app = angular.module("User", ["ngResource"])

    .factory("User", [
        "$resource", function($resource) {
            return $resource("/api/registrations/:id", {
                id: "@id"
            }, {
                update: {
                    method: "PUT"
                }
            });
        }
    ]);

