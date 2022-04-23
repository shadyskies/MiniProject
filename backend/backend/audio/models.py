from django.db import models

class MidiGenerated(models.Model):
    midi_input = models.FileField(upload_to='midi_input')
    midi_file_generated = models.FileField(upload_to='midi_files/')
    is_public = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey('users.CustomUser', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.id} :: {self.user}"


# song genre choices
GENRE_CHOICES  = [
    ('ROCK', 'ROCK'),
    ('JAZZ', 'JAZZ'),
    ('BLUES', 'BLUES'),
    ('ELECTRONIC', 'ELECTRONIC'),
]

class Song(models.Model):
    title = models.CharField(max_length=255)
    user = models.ForeignKey('users.CustomUser', on_delete=models.CASCADE)
    genre = models.CharField(max_length=255, choices=GENRE_CHOICES)
    song = models.FileField(upload_to='songs/')
    is_merged = models.BooleanField(default=False)
    is_public = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.title} :: {self.user}"