import uuid

from django.db import models
from smart_selects.db_fields import ChainedForeignKey

from lib.utils import none_to_underscore


class Plane(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class Type(models.Model):
    name = models.CharField(max_length=200)
    plane = models.ForeignKey(Plane, on_delete=models.PROTECT, null=True)
    default_tags = models.ManyToManyField('TagType', blank=True, null=True)

    def __str__(self):
        return self.name


class SubType(models.Model):
    type = models.ForeignKey(Type, on_delete=models.PROTECT, null=True)
    name = models.CharField(max_length=200, null=True)
    default_tags = models.ManyToManyField('TagType', blank=True, null=True)

    def __str__(self):
        return self.name


class TagType(models.Model):
    name = models.CharField(max_length=200)
    suffix = models.CharField(max_length=200, blank=True, default=None)
    default_type = models.ForeignKey(Type, on_delete=models.PROTECT, blank=True, null=True, default=None)
    default_subType = models.ForeignKey(SubType, on_delete=models.PROTECT, blank=True, null=True, default=None)

    def __str__(self):
        return self.name


class Tag(models.Model):
    tagType = models.ForeignKey(TagType, on_delete=models.PROTECT, null=True)
    value = models.CharField(max_length=200, blank=True, null=True, default=None)

    def __str__(self):
        return self.tagType.name + ':' + self.value + ' ' + self.tagType.suffix


class Owner(models.Model):
    name = models.CharField(max_length=200)


class House(models.Model):
    name = models.CharField(max_length=200)
    onwer = models.ForeignKey(Owner, on_delete=models.PROTECT)


class Location(models.Model):
    name = models.CharField(max_length=200, unique=True)
    house = models.ForeignKey(House, on_delete=models.PROTECT, null=True)
    thing = models.ForeignKey('Thing', on_delete=models.PROTECT, null=True, blank=True,
                              related_name='equivalentLocation')

    def save(self, *args, **kwargs):
        if (not self.name == "Outside"):
            super().save(*args, **kwargs)

    # skip validation rules
    def hard_save(self, *args, **kwargs):
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        if (not self.name == "Outside"):
            super().delete(*args, **kwargs)

    def __str__(self):
        return self.name


class Sublocation(models.Model):
    name = models.CharField(max_length=200)
    location = models.ForeignKey(Location, on_delete=models.PROTECT)

    def __str__(self):
        return self.name


class Thing(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    barcode = models.CharField(max_length=128, blank=True, null=True)
    name = models.CharField(max_length=200)
    type = models.ForeignKey(Type, on_delete=models.PROTECT, null=True)
    subType = models.ForeignKey(SubType, on_delete=models.PROTECT, blank=True, null=True)
    tags = models.ManyToManyField(Tag, blank=True)
    location = models.ForeignKey(Location, on_delete=models.PROTECT, blank=True, null=True, related_name='things')
    sublocation = models.ForeignKey(Sublocation, on_delete=models.PROTECT, blank=True, null=True, related_name='things')
    designated_location = models.ForeignKey(Location, on_delete=models.PROTECT, blank=True, null=True,
                                            related_name='designated_things')
    designated_sublocation = models.ForeignKey(Sublocation, on_delete=models.PROTECT, blank=True, null=True,
                                               related_name='designated_things')
    labeled = models.BooleanField(default=False)

    def designated(self):
        if self.designated_location is None:
            return ""
        else:
            return f"{none_to_underscore(self.designated_location)} ({none_to_underscore(self.designated_sublocation)})"

    def placed(self):
        if self.location is None:
            return ""
        else:
            return f"{none_to_underscore(self.location)} ({none_to_underscore(self.sublocation)})"

    def length(self):
        try:
            return self.tags.filter(tagType__name='Length')[0].value + TagType.objects.filter(name='Length')[0].suffix
        except:
            return None

    def __str__(self):
        return self.name  # + " (" + (self.barcode if self.barcode else "-") + ")"
