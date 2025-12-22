# ⚡️ Can your system handle AMP right now?
import torch
print("CUDA:", torch.cuda.is_available())
scaler = torch.amp.GradScaler('cuda')

x = torch.randn(32, 1024, device="cuda")
w = torch.randn(1024, 1024, device="cuda")

with torch.amp.autocast('cuda'):
    y = x @ w

print("AMP test passed")
