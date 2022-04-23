import requests

# send audio files using python
def send_audio():
    headers = {'content-type': 'audio/wav'}
    f1 = open("../1.mp3", "rb")
    f2 = open("../2.mp3", "rb")
    url = "http://localhost:8000/api/concat_audio/"
    data = {
        "first_file": f1,
        "second_file": f2
    }
    response = requests.post(url=url, files=data)
    print(response.json())

    f1.close()
    f2.close()

if __name__ == '__main__':
    send_audio()