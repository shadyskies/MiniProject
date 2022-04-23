import uvicorn
from fastapi import FastAPI, File, UploadFile
from fastapi.responses import Response, JSONResponse
from pydantic import BaseModel
import os
from utils import concatenate_audio_pydub

app = FastAPI()

class Audio(BaseModel):
    audio1: str
    

@app.get('/ping/')
async def ping():
    concatenate_audio_pydub(['1.mp3' ,'2.mp3'], 'output.mp3')
    return "pong"


@app.get("/")
async def read_main():
    return {"msg": "Hello World"}

# TODO: connect this with s3
@app.post("/api/concat_audio/")
async def api_concat_audio( first_file: UploadFile = File(...), second_file: UploadFile = File(...)):
    '''
    # concats two audio files and returns the bytes in response
    '''

    files = [first_file.filename, second_file.filename]
    print(files)
    with open(files[0], "wb") as f1:
        contents = await first_file.read()
        f1.write(contents)
    with open(files[1], "wb") as f2:
        contents = await second_file.read()
        f2.write(contents)


    concatenate_audio_pydub(files, 'output.mp3')
    with open("output.mp3", "rb") as f:
        output_bytes = f.read()

    # delete the files
    os.remove(files[0])
    os.remove(files[1])
    os.remove("output.mp3")
    # print(f"contents: {contents}")
    return Response(content=output_bytes, media_type="audio/mpeg")


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
