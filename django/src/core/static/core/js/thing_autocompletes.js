'use strict';
{
    const $ = django.jQuery;

    $.fn.djangoThingAdminSelect2 = function(getDependantValue) {
        $.each(this, function(i, element) {
            $(element).select2({
                ajax: {
                    data: (params) => {
                        return {
                            term: params.term,
                            page: params.page,
                            dependant_value: getDependantValue(),
                            app_label: element.dataset.appLabel,
                            model_name: element.dataset.modelName,
                            field_name: element.dataset.fieldName
                        };
                    }
                }
            });
        });
        return this;
    };

    // $('[name="type"]').val()

    $(function() {
        // Initialize all autocomplete widgets except the one in the template
        // form used when a new formset is added.
        $('[name="subType"]').djangoThingAdminSelect2(
            function() {
                return $('[name="type"]').val()
            }
         );
        $('[name="sublocation"]').djangoThingAdminSelect2(
            function() {
                return $('[name="location"]').val()
            }
         );
        $('[name="designated_sublocation"]').djangoThingAdminSelect2(
            function() {
                return $('[name="designated_location"]').val()
            }
         );
    });

}
