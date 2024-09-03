#!/bin/bash

# diffusion_models
if [ ! -d "/workspace/ComfyUI/models/diffusion_models/" ]; then
    mkdir -p /workspace/ComfyUI/models/diffusion_models/
fi

cd /workspace/ComfyUI/models/diffusion_models/
if [ ! -f "flux1-dev.safetensors" ]; then
    wget -b -q --header="Authorization: Bearer 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" https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors
fi

# clip
if [ ! -d "/workspace/ComfyUI/models/clip/" ]; then
    mkdir -p /workspace/ComfyUI/models/clip/
fi

cd /workspace/ComfyUI/models/clip/
if [ ! -f "clip_l.safetensors" ]; then
    wget -b -q https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
fi
if [ ! -f "t5xxl_fp16.safetensors" ]; then
    wget -b -q https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors
fi

# vae
if [ ! -d "/workspace/ComfyUI/models/vae/" ]; then
    mkdir -p /workspace/ComfyUI/models/vae/
fi

cd /workspace/ComfyUI/models/vae/
if [ ! -f "ae.safetensors" ]; then
    wget -b -q --header="Authorization: Bearer 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" https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors
fi

# checkpoints
if [ ! -d "/workspace/ComfyUI/models/checkpoints/" ]; then
    mkdir -p /workspace/ComfyUI/models/checkpoints/
fi

cd /workspace/ComfyUI/models/checkpoints/
if [ ! -f "epicrealism_naturalSinRC1VAE.safetensors" ]; then
    wget -b -q https://huggingface.co/Justin-Choo/epiCRealism-Natural_Sin_RC1_VAE/resolve/main/epicrealism_naturalSinRC1VAE.safetensors
fi

# loras
if [ ! -d "/workspace/ComfyUI/models/loras/" ]; then
    mkdir -p /workspace/ComfyUI/models/loras/
fi

cd /workspace/ComfyUI/models/loras/
if [ ! -f "more_details.safetensors" ]; then
    wget -b -q -O more_details.safetensors https://civitai.com/api/download/models/87153
fi
if [ ! -f "lora.safetensors" ]; then
    wget -b -q https://huggingface.co/XLabs-AI/flux-RealismLora/resolve/main/lora.safetensors
fi

# controlnet
if [ ! -d "/workspace/ComfyUI/models/controlnet/" ]; then
    mkdir -p /workspace/ComfyUI/models/controlnet/
fi

cd /workspace/ComfyUI/models/controlnet/
if [ ! -f "diffusion_pytorch_model.safetensors" ]; then
    wget -b -q https://huggingface.co/InstantX/FLUX.1-dev-Controlnet-Union/resolve/main/diffusion_pytorch_model.safetensors
fi

# ultralytics/bbox
if [ ! -d "/workspace/ComfyUI/models/ultralytics/bbox/" ]; then
    mkdir -p /workspace/ComfyUI/models/ultralytics/bbox/
fi

cd /workspace/ComfyUI/models/ultralytics/bbox/
if [ ! -f "sam_vit_b_01ec64.pth" ]; then
    wget -b -q https://huggingface.co/datasets/Gourieff/ReActor/blob/main/models/sams/sam_vit_b_01ec64.pth
fi
if [ ! -f "face_yolov8n_v2.pt" ]; then
    wget -b -q https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8n_v2.pt
fi
if [ ! -f "Eyeful_v2-Paired.pt" ]; then
    wget -O archive.zip https://civitai.com/api/download/models/582143
    unzip archive.zip
    rm -r archive.zip 
fi

# upscale_models
if [ ! -d "/workspace/ComfyUI/models/upscale_models/" ]; then
    mkdir -p /workspace/ComfyUI/models/upscale_models/
fi

cd /workspace/ComfyUI/models/upscale_models/
if [ ! -f "x1_ITF_SkinDiffDetail_Lite_v1.pth" ]; then
    wget -O archive.zip https://civitai.com/api/download/models/219374
    unzip archive.zip
    unrar x upscalers.rar
    rm -r archive.zip
    rm -r upscalers.rar
fi

# custom_nodes
if [ ! -d "/workspace/ComfyUI/custom_nodes/" ]; then
    mkdir -p /workspace/ComfyUI/custom_nodes/
fi

cd /workspace/ComfyUI/custom_nodes/

git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git
git clone https://github.com/WASasquatch/was-node-suite-comfyui.git
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git
git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale --recursive
git clone https://github.com/melMass/comfy_mtb.git
git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git
git clone https://github.com/bash-j/mikey_nodes.git
git clone https://github.com/Gourieff/comfyui-reactor-node.git
git clone https://github.com/rgthree/rgthree-comfy.git
git clone https://github.com/cubiq/ComfyUI_essentials.git
git clone https://github.com/chrisgoringe/cg-image-picker.git
git clone https://github.com/ronniebasak/ComfyUI-Tara-LLM-Integration.git
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git
git clone https://github.com/kijai/ComfyUI-Florence2.git
git clone https://github.com/KoreTeknology/ComfyUI-Universal-Styler.git
git clone https://github.com/un-seen/comfyui-tensorops.git
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
git clone https://github.com/chrisgoringe/cg-use-everywhere.git
git clone https://github.com/EeroHeikkinen/ComfyUI-eesahesNodes.git
python comfyui-reactor-node/install.py

BASE_DIR="/workspace/ComfyUI/custom_nodes/"

# Find all requirements.txt files and install them
find "$BASE_DIR" -type f -name "requirements.txt" | while read -r file; do
    pip install -r "$file"
done
