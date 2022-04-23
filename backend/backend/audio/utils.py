from pydub import AudioSegment
from tqdm import tqdm 
import os
import collections
import pretty_midi
import numpy as np
import pandas as pd
import tensorflow as tf
from tensorflow.keras.models import load_model

model = load_model('./music_model50.h5', compile=False)

def concatenate_audio_pydub(audio_file, audio_file_2, output_path, verbose=True):
    """
    Concatenates two or more audio files into one audio file using PyDub library
    and save it to `output_path`. 
    """
    
    def get_file_extension(filename):
        """A helper function to get a file's extension"""
        return os.path.splitext(filename)[1].lstrip(".")


    # wrap the audio clip paths with tqdm if verbose
    clips = []
    clip = AudioSegment.from_file(audio_file)
    clips.append(clip)
    clip = AudioSegment.from_file(audio_file_2)
    clips.append(clip)

    final_clip = clips[0]
    range_loop = tqdm(list(range(1, len(clips))), "Concatenating audio") if verbose else range(1, len(clips))
    for i in range_loop:
        # looping on all audio files and concatenating them together
        # ofc order is important
        final_clip = final_clip + clips[i]
    # export the final clip
    final_clip_extension = get_file_extension(output_path)
    if verbose:
        print(f"Exporting resulting audio file to {output_path}")
    final_clip.export(output_path, format=final_clip_extension)


def midi_to_notes(midi_file) -> pd.DataFrame:
  pm = pretty_midi.PrettyMIDI(midi_file)
  instrument = pm.instruments[0]
  notes = collections.defaultdict(list)

  # Sort the notes by start time
  sorted_notes = sorted(instrument.notes, key=lambda note: note.start)
  prev_start = sorted_notes[0].start

  for note in sorted_notes:
    start = note.start
    end = note.end
    note_name = pretty_midi.note_number_to_name(note.pitch)
    notes['pitch'].append(note.pitch)
    notes['pitch_name'].append(note_name)
    notes['start'].append(start)
    notes['end'].append(end)
    notes['step'].append(start - prev_start)
    notes['velocity'].append(note.velocity)
    notes['duration'].append(end - start)
    
    prev_start = start

  return pd.DataFrame({name: np.array(value) for name, value in notes.items()})

def notes_to_midi(notes: pd.DataFrame,out_file: str, instrument_name: str,velocity: int = 100) -> pretty_midi.PrettyMIDI:

  pm = pretty_midi.PrettyMIDI()
  instrument = pretty_midi.Instrument(program=pretty_midi.instrument_name_to_program(instrument_name))

  prev_start = 0
  for i, note in notes.iterrows():
    start = float(prev_start + note['step'])
    end = float(start + note['duration'])
    note = pretty_midi.Note(
        velocity=velocity,
        pitch=int(note['pitch']),
        start=start,
        end=end,
    )
    instrument.notes.append(note)
    prev_start = start

  pm.instruments.append(instrument)
  pm.write(out_file)
  return pm


def predict_next_note(
    notes: np.ndarray, 
    keras_model: tf.keras.Model, 
    temperature: float = 1.0) -> int:
  """Generates a note IDs using a trained sequence model."""

  assert temperature > 0

  # Add batch dimension
  inputs = tf.expand_dims(notes, 0)

  predictions = model.predict(inputs)
  pitch_logits = predictions['pitch']
  step = predictions['step']
  duration = predictions['duration']

  pitch_logits /= temperature
  pitch = tf.random.categorical(pitch_logits, num_samples=1)
  pitch = tf.squeeze(pitch, axis=-1)
  duration = tf.squeeze(duration, axis=-1)
  step = tf.squeeze(step, axis=-1)

  # `step` and `duration` values should be non-negative
  step = tf.maximum(0, step)
  duration = tf.maximum(0, duration)

  return int(pitch), float(step), float(duration)