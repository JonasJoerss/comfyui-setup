#!/bin/bash

pip install --upgrade pip
pip install -r requirements.txt
apt-get update
apt-get install -y build-essential unzip unrar

# diffusion_models
if [ ! -d "/workspace/ComfyUI/models/diffusion_models/" ]; then
    mkdir -p /workspace/ComfyUI/models/diffusion_models/
fi

cd /workspace/ComfyUI/models/diffusion_models/
wget -b -q --header="Authorization: Bearer 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" https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors 

# clip
if [ ! -d "/workspace/ComfyUI/models/clip/" ]; then
    mkdir -p /workspace/ComfyUI/models/clip/
fi

cd /workspace/ComfyUI/models/clip/
wget -b -q https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
wget -b -q https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors

# vae
if [ ! -d "/workspace/ComfyUI/models/vae/" ]; then
    mkdir -p /workspace/ComfyUI/models/vae/
fi

cd /workspace/ComfyUI/models/vae/
wget -b -q --header="Authorization: Bearer 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" https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors

# checkpoints
if [ ! -d "/workspace/ComfyUI/models/checkpoints/" ]; then
    mkdir -p /workspace/ComfyUI/models/checkpoints/
fi

cd /workspace/ComfyUI/models/checkpoints/
wget -b -q https://huggingface.co/Justin-Choo/epiCRealism-Natural_Sin_RC1_VAE/resolve/main/epicrealism_naturalSinRC1VAE.safetensors

# loras
if [ ! -d "/workspace/ComfyUI/models/loras/" ]; then
    mkdir -p /workspace/ComfyUI/models/loras/
fi

cd /workspace/ComfyUI/models/loras/
wget -b -q -O more_details.safetensors https://civitai.com/api/download/models/87153
wget -b -q https://huggingface.co/XLabs-AI/flux-RealismLora/resolve/main/lora.safetensors 

# ultralytics/bbox
if [ ! -d "/workspace/ComfyUI/models/ultralytics/bbox/" ]; then
    mkdir -p /workspace/ComfyUI/models/ultralytics/bbox/
fi

cd /workspace/ComfyUI/models/ultralytics/bbox/
wget -b -q https://huggingface.co/datasets/Gourieff/ReActor/blob/main/models/sams/sam_vit_b_01ec64.pth
wget -b -q https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8n_v2.pt
wget -O archive.zip https://civitai.com/api/download/models/582143
unzip archive.zip
rm -r archive.zip 

# upscale_models
if [ ! -d "/workspace/ComfyUI/models/upscale_models/" ]; then
    mkdir -p /workspace/ComfyUI/models/upscale_models/
fi

cd /workspace/ComfyUI/models/upscale_models/
wget -O archive.zip https://civitai.com/api/download/models/219374
unzip archive.zip
unrar x upscalers.rar
rm -r archive.zip
rm -r upscalers.rar