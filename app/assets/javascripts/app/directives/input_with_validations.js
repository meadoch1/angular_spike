angular.module("inputs", [])
    .directive("inputDecorations", function($compile) {
        return {
            template:
            '<div class="control-group"> \
<div class="controls" ng-transclude> \
</div> \
</div>',
            replace: true,
            transclude: true,
            link: function (scope, element) {
                function decorateInput() {
                    var input = element.find(":input");
                    if (!input.attr('placeholder')) {
                        input.attr("placeholder", scope.decorations.label);
                    }
                    if (!input.attr('ng-model')) {
                        input.attr("ng-model", scope.decorations.model + '.' + scope.decorations.field_name);
                    }
                    if (!input.attr('name')) {
                        input.attr("name", scope.decorations.field_name);
                    }
                    if (scope.decorations.validations) {
                        var vals = scope.decorations.validations[scope.decorations.field_name];
                        for (var i=0; i < vals.length; i++) {
                            console.log(vals[i].input_attribute);
                            console.log(vals[i].input_value);
                            console.log(vals[i].input_value === null);
                            input.attr(vals[i].input_attribute, ((vals[i].input_value === null) ? '' : vals[i].input_value));
                        }
                    }
                };
                scope.$watch(function() {return scope.decorations.validations}, function(validations) {
                    decorateInput();
                }, true);
                decorateInput();
            },

            scope: {
                decorations: '=inputDecorations'
            }
        }})
    .directive("inputValidation", function($compile) {
        return {
            // 'ng-show={{validation.show}}
            // '<div class="control-group"> \
            //    <div class="controls" ng-transclude></div> \
            //    <span ng-show="true">{{scope.decorations.validations[0]}}</span> \
            //  </div>',
            link: function (scope, element) {
                element.attr('ng-show', scope.form_name + '.' + scope.field_name + '.$error.' + scope.validation.show_attribute);
                element.text(scope.validation.message);
                $compile(element.contents())(scope);
            },
            scope: {
                validation: '=inputValidation',
                form_name: '=formName',
                field_name: '=fieldName'
            }
        }
    })
