# psoldunov/openai-whisper-rocm

Create container with:

```sh
docker run -it --device=/dev/kfd --device=/dev/dri --name whisper-rocm --group-add video -v /PATH/TO/FOLDER:/data psoldunov/openai-whisper-rocm
```

Run Whisper with:

```sh
docker exec -it whisper-rocm whisper-rocm
```
