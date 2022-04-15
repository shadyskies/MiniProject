from django.urls import path, include
from .views import *


urlpatterns = [
    path('audio-merge/', merge_audio_view, name='merge_audio'),
    path('midi-generate/', generate_midi_view, name='generate_audio'),
    path('song-upload/', song_upload_view, name='song_upload'),
]