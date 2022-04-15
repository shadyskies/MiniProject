from django.db import models

class MidiGenerated(models.Model):
    midi_input = models.FileField(upload_to='midi_input')
    midi_file_generated = models.FileField(upload_to='midi_files/')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey('users.CustomUser', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.id} :: {self.user}"


class Song(models.Model):
    title = models.CharField(max_length=255)
    user = models.ForeignKey('users.CustomUser', on_delete=models.CASCADE)
    genre = models.CharField(max_length=255)
    song = models.FileField(upload_to='songs/')

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.title} :: {self.user}"