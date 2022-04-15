from django.contrib import admin
from .models import MidiGenerated, Song


admin.site.register(MidiGenerated)
admin.site.register(Song)