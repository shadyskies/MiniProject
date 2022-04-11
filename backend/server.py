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

@app.post("/api/concat_audio/")
async def api_concat_audio( first_file: UploadFile = File(...), second_file: UploadFile = File(...)):
    return {"description": first_file}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
