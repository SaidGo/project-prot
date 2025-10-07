#!/usr/bin/env bash
set -euo pipefail

echo "[1/4] Проверка окружения MSYS2/MINGW64..."
uname -a || true
echo "PATH=$PATH"

echo "[2/4] Установка protoc через pacman (MSYS2)..."
pacman -S --noconfirm --needed mingw-w64-x86_64-protobuf

echo "[3/4] Проверка установки protoc..."
command -v protoc >/dev/null 2>&1 || { echo "protoc не найден в PATH"; exit 1; }
protoc --version

echo "[4/4] Генерация gRPC stubs..."
cd "$(dirname "$0")/.."
make tools
make generate

echo "Готово."
