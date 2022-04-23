from django.shortcuts import render
from .utils import concatenate_audio_pydub, midi_to_notes, notes_to_midi, predict_next_note
from .forms import MergeAudioForm, GenerateMidiForm, SongUploadForm
from tensorflow.keras.models import load_model
import numpy as np
import pandas as pd
import tensorflow as tf
import pretty_midi 
from .models import MidiGenerated, Song
from django.contrib import messages
from django.contrib.auth.decorators import login_required
import os
import uuid

key_order = ['pitch', 'step', 'duration']
seq_length = 25
vocab_size = 128
model = load_model('music_model50.h5', compile=False)

@login_required
def merge_audio_view(request):
    context = {}
    if request.method == 'POST':
        # get the audio files
        print(request.FILES)
        audio_file = request.FILES['audio_file']
        audio_file_2 = request.FILES['audio_file_2']
        # merge the audio files
        # TODO: create object 
        outfile = audio_file.name + str(uuid.uuid4()) + ".mp3"
        concatenate_audio_pydub(audio_file, audio_file_2, outfile)
        context['merged'] = True
        obj = Song.objects.create(user=request.user, is_merged=True, title='Merged Audio', genre='N/A', song=outfile)
        context['merged_file_path'] = obj.song.url
        print(f"URL: {obj.song.url}")
        return render(request, 'audio/merge_audio.html', context)
    form = MergeAudioForm()
    return render(request, 'audio/merge_audio.html', {'form': form})


@login_required
def generate_midi_view(request):
    context = {}
    if request.method == 'POST':
        # get the audio files
        form = GenerateMidiForm(request.POST)
        print(f"POST Request: {request.FILES}")
        input_midi = request.FILES['input_midi']
        temperature = 2.0
        num_predictions = 120

        notes_df = midi_to_notes(input_midi)

        sample_notes = np.stack([notes_df[key] for key in key_order], axis=1)

        # The initial sequence of notes; pitch is normalized similar to training
        # sequences
        input_notes = (
            sample_notes[:seq_length] / np.array([vocab_size, 1, 1]))

        generated_notes = []
        prev_start = 0
        print(f"Starting generation of notes")
        for _ in range(num_predictions):
            pitch, step, duration = predict_next_note(input_notes, model, temperature)
            start = prev_start + step
            end = start + duration
            input_note = (pitch, step, duration)
            generated_notes.append((*input_note, start, end))
            input_notes = np.delete(input_notes, 0, axis=0)
            input_notes = np.append(input_notes, np.expand_dims(input_note, 0), axis=0)
            prev_start = start

        generated_notes = pd.DataFrame(
            generated_notes, columns=(*key_order, 'start', 'end'))

        # Convert the notes to MIDI
        outfile = input_midi.name + str(uuid.uuid4()) + '.mid'
        out_pm = notes_to_midi(generated_notes, outfile, instrument_name='Acoustic Grand Piano')

        print(f"saved the MIDI File!!")
        obj = MidiGenerated.objects.create(user=request.user, midi_input=input_midi, midi_file_generated=outfile)
        messages.success(request, "Generated MIDI File Successfully!")
        return render(request, 'audio/generate_midi.html', {'file_path': obj.midi_file_generated.url})

    form = GenerateMidiForm()
    return render(request, 'audio/generate_midi.html', {'form': form, 'description': 'failure'})

@login_required
def song_upload_view(request):
    context = {}
    if request.method == 'POST':
        # get the audio files
        form = SongUploadForm(request.POST, request.FILES)
        print(f"POST Request: {request.FILES}")
        title = request.POST['title']
        genre = request.POST['genre']
        is_public = True if request.POST['is_public'] == 'on' else False
        audio_file = request.FILES['audio_file']
        
        Song.objects.create(title=title, genre=genre, song=audio_file, user=request.user, is_public=is_public)
        messages.success(request, 'Song Uploaded Successfully!')

        return render(request, 'audio/song_upload.html', {'form': form, 'description': 'success'})

    form = SongUploadForm()
    return render(request, 'audio/song_upload.html', {'form': form, 'description': 'failure'})


@login_required
def songs_view(request):
    """
    Displays the list of songs which are public
    """
    context = {}
    context['songs'] = Song.objects.filter(is_public=True)
    return render(request, 'audio/songs_display.html', context) 
