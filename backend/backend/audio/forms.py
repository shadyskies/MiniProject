from django import forms


class MergeAudioForm(forms.Form):
    audio_file = forms.FileField(label='Audio File')
    audio_file_2 = forms.FileField(label='Audio File 2')
    

class GenerateMidiForm(forms.Form):
    input_midi = forms.FileField(label='Input MIDI File')


class SongUploadForm(forms.Form):
    title = forms.CharField(label='Title', max_length=255)
    genre = forms.CharField(label='Genre', max_length=255)
    audio_file = forms.FileField(label='Audio File')