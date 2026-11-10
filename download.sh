#!/bin/bash
# Download GGUF weights for mradermacher/Ornith-1.5-9B-uncensored-GGUF from HuggingFace.
# No token, no credentials: the HF repo is gated=false, anonymous download works.
# Usage:
#   ./download.sh            # default quant Q4_K_M (5.63 GB)
#   ./download.sh Q5_K_M     # download a specific quant
#   ./download.sh --list     # list all available quants and sizes
#   ./download.sh --mmproj   # additionally download the mmproj file(s)
set -euo pipefail
# Reject unexpected extra arguments: a stray extra arg must never start a download.
if [ "$#" -gt 1 ]; then
  echo "ERROR: too many arguments (expected at most 1). Usage: ./download.sh [QUANT|--list|--mmproj|--help]" >&2
  exit 1
fi


HF_REPO="mradermacher/Ornith-1.5-9B-uncensored-GGUF"
BASE="https://huggingface.co/$HF_REPO/resolve/main"
DEFAULT_QUANT="Q4_K_M"

list_quants() {
  echo "Available quants for $HF_REPO:"
  echo "  (default: $DEFAULT_QUANT)"
  printf "%-12s %10s  %s\n" "Q2_K" "3.83 GB" "Ornith-1.5-9B-uncensored.Q2_K.gguf"
  printf "%-12s %10s  %s\n" "Q3_K_S" "4.26 GB" "Ornith-1.5-9B-uncensored.Q3_K_S.gguf"
  printf "%-12s %10s  %s\n" "Q3_K_M" "4.62 GB" "Ornith-1.5-9B-uncensored.Q3_K_M.gguf"
  printf "%-12s %10s  %s\n" "Q3_K_L" "4.93 GB" "Ornith-1.5-9B-uncensored.Q3_K_L.gguf"
  printf "%-12s %10s  %s\n" "IQ4_XS" "5.23 GB" "Ornith-1.5-9B-uncensored.IQ4_XS.gguf"
  printf "%-12s %10s  %s\n" "Q4_K_S" "5.35 GB" "Ornith-1.5-9B-uncensored.Q4_K_S.gguf"
  printf "%-12s %10s  %s\n" "Q4_K_M" "5.63 GB" "Ornith-1.5-9B-uncensored.Q4_K_M.gguf"
  printf "%-12s %10s  %s\n" "Q5_K_S" "6.31 GB" "Ornith-1.5-9B-uncensored.Q5_K_S.gguf"
  printf "%-12s %10s  %s\n" "Q5_K_M" "6.47 GB" "Ornith-1.5-9B-uncensored.Q5_K_M.gguf"
  printf "%-12s %10s  %s\n" "Q6_K" "7.36 GB" "Ornith-1.5-9B-uncensored.Q6_K.gguf"
  printf "%-12s %10s  %s\n" "Q8_0" "9.53 GB" "Ornith-1.5-9B-uncensored.Q8_0.gguf"
  printf "%-12s %10s  %s\n" "f16" "17.92 GB" "Ornith-1.5-9B-uncensored.f16.gguf"
  echo "mmproj (optional, vision):"
  printf "%-12s %10s  %s\n" "mmproj" "0.62 GB" "Ornith-1.5-9B-uncensored.mmproj-Q8_0.gguf"
  printf "%-12s %10s  %s\n" "mmproj" "0.92 GB" "Ornith-1.5-9B-uncensored.mmproj-f16.gguf"
}

download_one() {
  local file="$1" size="$2" sha="$3"
  echo "Downloading $file ($size bytes, sha256 $sha) ..."
  if [ -f "$file" ]; then
    echo "  $file already exists, verifying ..."
  else
    curl -L --fail --retry 3 -o "$file.tmp" "$BASE/$file"
    mv "$file.tmp" "$file"
  fi
  local actual_size actual_sha
  actual_size="$(wc -c < "$file")"
  if [ "$actual_size" != "$size" ]; then
    echo "ERROR: size mismatch for $file: expected $size, got $actual_size" >&2
    rm -f "$file"
    exit 1
  fi
  actual_sha="$(sha256sum "$file" | awk '{print $1}')"
  if [ "$actual_sha" != "$sha" ]; then
    echo "ERROR: sha256 mismatch for $file: expected $sha, got $actual_sha" >&2
    rm -f "$file"
    exit 1
  fi
  echo "  OK: $file ($actual_size bytes, sha256 verified)"
}

download_mmproj() {
  download_one "Ornith-1.5-9B-uncensored.mmproj-Q8_0.gguf" 624229760 "aa9d85f3e01af1fc776a1d5d18dfd27b1802676ee3abe4e6f8b449d8da374a8b"
  download_one "Ornith-1.5-9B-uncensored.mmproj-f16.gguf" 918166016 "3170dd53d7ed442c944cfb378535e96a5981283d65ec4f6c389f07999f32b380"
}

download_quant() {
  local quant="$1" file="" size="" sha=""
  case "$quant" in
    Q2_K) FILE="Ornith-1.5-9B-uncensored.Q2_K.gguf" SIZE=3827262624 SHA="4db5a3939119b4c5e2e1c992ddb9d42ff0f3cf725e454cdda97ced8e158244bb" ;;
    Q3_K_S) FILE="Ornith-1.5-9B-uncensored.Q3_K_S.gguf" SIZE=4259407008 SHA="5c85e5e72b3b9e8d9854e743a81f1e1da84998a7a3997f8c0cbb9a551c42ba62" ;;
    Q3_K_M) FILE="Ornith-1.5-9B-uncensored.Q3_K_M.gguf" SIZE=4623525024 SHA="c9a221d5b86a092520a08f83dce16ee747fc338eb1a553ed8df26b001c8a1183" ;;
    Q3_K_L) FILE="Ornith-1.5-9B-uncensored.Q3_K_L.gguf" SIZE=4925514912 SHA="c3353f9cae3d9b874dcdba39220d6a0206b8ba435ef19152363000a451b09aba" ;;
    IQ4_XS) FILE="Ornith-1.5-9B-uncensored.IQ4_XS.gguf" SIZE=5227898016 SHA="a118b27b0522b65a0c80fb3bb5fb271d4025a8c745799287ac3192f34630cd5a" ;;
    Q4_K_S) FILE="Ornith-1.5-9B-uncensored.Q4_K_S.gguf" SIZE=5351629984 SHA="82cb794ba63c12e33a384e366fb594270fda167143a9a47365598bfa93ddc832" ;;
    Q4_K_M) FILE="Ornith-1.5-9B-uncensored.Q4_K_M.gguf" SIZE=5629109408 SHA="ee180b66bc2dcd49f41e0d3c991d2eaab3078d651d97595852d16ae6d9af3c9e" ;;
    Q5_K_S) FILE="Ornith-1.5-9B-uncensored.Q5_K_S.gguf" SIZE=6305309856 SHA="dc2d9b5fb6b9a007739f1e35f7efe878c42fc80e09b4549582ba390474e67237" ;;
    Q5_K_M) FILE="Ornith-1.5-9B-uncensored.Q5_K_M.gguf" SIZE=6467970208 SHA="7f06a0e1da5103610153d1533ea9d75ab5e688acc44aa49391377188dbf2e203" ;;
    Q6_K) FILE="Ornith-1.5-9B-uncensored.Q6_K.gguf" SIZE=7359259808 SHA="5d48d49aae8aa7cb415e2cc4989457a094ff5a13bbb425222f1450abcd6cf1b8" ;;
    Q8_0) FILE="Ornith-1.5-9B-uncensored.Q8_0.gguf" SIZE=9527501984 SHA="05e0878744b36b7c55385ecb8aaf47bddf0b43f720dbfac5c79e489c02abca8f" ;;
    f16) FILE="Ornith-1.5-9B-uncensored.f16.gguf" SIZE=17920697504 SHA="0c63472360579233eff2a90f01888ba72baac6e538cd91c59a34ff3b7e7ab42f" ;;
    *) echo "ERROR: unknown quant '$quant'. Run ./download.sh --list" >&2; exit 1 ;;
  esac
  local total_gb
  total_gb="$(awk -v s="$size" 'BEGIN { printf "%.2f", s/1e9 }')"
  echo "Total download size: $total_gb GB. Make sure you have at least that much free disk space."
  download_one "$file" "$size" "$sha"
}

case "${1:-}" in
  --list) list_quants ;;
  --mmproj) download_mmproj ;;
  -h|--help)
    echo "Usage: ./download.sh [QUANT]"
    echo "       ./download.sh --list        list all available quants and sizes"
    echo "       ./download.sh --mmproj      download the mmproj vision file only"
    echo "Default QUANT: $DEFAULT_QUANT"
    ;;

  "") download_quant "$DEFAULT_QUANT" ;;
  *) download_quant "$1" ;;
esac
