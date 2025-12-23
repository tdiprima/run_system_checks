#!/usr/bin/env bash

# ================================
# 🌈 Color setup
# ================================
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
RESET="\033[0m"

# ================================
# ✨ Pretty helpers
# ================================
banner () {
  echo -e "\n${PURPLE}========================================${RESET}"
  echo -e "${PURPLE}$1${RESET}"
  echo -e "${PURPLE}========================================${RESET}\n"
}

run_step () {
  local file="$1"

  case "$file" in
    cuda_info.py)
      echo -e "${CYAN}🧠 Checking CUDA + NVIDIA driver vibes...${RESET}"
      python3 "$file"
      ;;
    gpu_info.sh)
      echo -e "${CYAN}🎮 Inspecting GPU hardware stats...${RESET}"
      bash "$file"
      ;;
    torch_info.py)
      echo -e "${CYAN}🔥 Verifying PyTorch + CUDA integration...${RESET}"
      python3 "$file"
      ;;
    disk_info.sh)
      echo -e "${CYAN}💾 Looking at disks and mount points...${RESET}"
      bash "$file"
      ;;
    filesystem_speed.sh)
      echo -e "${CYAN}🚀 Testing filesystem read/write speed...${RESET}"
      bash "$file"
      ;;
    disk_speed.sh)
      echo -e "${CYAN}⚡ Benchmarking raw disk speed...${RESET}"
      bash "$file"
      ;;
    cpu_info.sh)
      echo -e "${CYAN}🧮 Gathering CPU core + thread intel...${RESET}"
      bash "$file"
      ;;
    amp_test.py)
      echo -e "${CYAN}✨ Testing AMP (mixed precision) goodness...${RESET}"
      python3 "$file"
      ;;
    system_info.py)
      echo -e "${CYAN}🧾 Final boss: full system info dump...${RESET}"
      python3 "$file"
      ;;
    *)
      echo -e "${YELLOW}🤔 Unknown file: $file (skipping)${RESET}"
      ;;
  esac

  echo -e "${GREEN}✅ Done: $file${RESET}\n"
}

# ================================
# 🚀 Main event
# ================================
banner "🐻 Bear's System & GPU Vibe Check 🐻"

FILES=(
  cuda_info.py
  gpu_info.sh
  torch_info.py
  disk_info.sh
  filesystem_speed.sh
  disk_speed.sh
  cpu_info.sh
  amp_test.py
  system_info.py
)

for f in "${FILES[@]}"; do
  if [[ -f "$f" ]]; then
    run_step "$f"
  else
    echo -e "${RED}❌ Missing file: $f${RESET}\n"
  fi
done

banner "🎉 All checks complete — system understood 🎉"

