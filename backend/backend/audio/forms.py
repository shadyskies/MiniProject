from django import forms


class MergeAudioForm(forms.Form):
    audio_file = forms.FileField(label='Audio File')
    audio_file_2 = forms.FileField(label='Audio File 2')
    

class GenerateMidiForm(forms.Form):
    input_midi = forms.FileField(label='Input MIDI File')


GENRE_CHOICES  = [
    ('ROCK', 'ROCK'),
    ('JAZZ', 'JAZZ'),
    ('BLUES', 'BLUES'),
    ('ELECTRONIC', 'ELECTRONIC'),
]

class SongUploadForm(forms.Form):
    title = forms.CharField(label='Title', max_length=255)
    genre = forms.ChoiceField(choices = GENRE_CHOICES, initial='genre', widget=forms.Select(), required=True)
    audio_file = forms.FileField(label='Audio File')
    is_public = forms.BooleanField(label='Make song public?', required=True)