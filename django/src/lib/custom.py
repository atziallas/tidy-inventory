from django.contrib.admin import RelatedOnlyFieldListFilter
from django.contrib.admin.utils import get_fields_from_path

class MultipleRelatedOnlyFieldListFilter(RelatedOnlyFieldListFilter):
    def __init__(self, field, request, params, model, model_admin, field_path):
        super().__init__(field, request, params, model, model_admin, field_path)
        self.lookup_kwarg = '%s__%s__in' % (field_path, field.target_field.name)
        self.lookup_kwarg_isnull = '%s__isnull' % field_path

class DependantMultipleListFilter(MultipleRelatedOnlyFieldListFilter):
    title = ''
    parameter_name = ''
    relevant_field_name = ''


    def field_choices(self,field, request, model_admin):
        """
        Returns a list of tuples. The first element in each
        tuple is the coded value for the option that will
        appear in the URL query. The second element is the
        human-readable name for the option that will appear
        in the right sidebar.
        """
        field = get_fields_from_path(model_admin.model,self.field_path)[-1]
        model_class = field.related_model().__class__
       
        return [(obj.id, str(obj),str(getattr(obj, self.relevant_field_name).id)) for obj in model_class.objects.all()]

