# 🧪 Is AMP enabled in your PyTorch build?
# CUDA version printed
# AMP available: True
import torch

print(torch.cuda.get_device_name(0))
print(f"VRAM: {torch.cuda.get_device_properties(0).total_memory / 1e9:.2f} GB")

print("Torch version:", torch.__version__)
print("CUDA version:", torch.version.cuda)
print("AMP available:", hasattr(torch.cuda, "amp"))
