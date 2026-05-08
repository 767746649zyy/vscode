#!/bin/bash
# shell: build-linux-vscode.sh
# 作用: 下载 Linux Electron 二进制并打包自定义 VS Code Linux IDE

set -e

# ==== 配置区域 ====
ELECTRON_VERSION=39.8.7                    # Electron 版本
ELECTRON_DIST_DIR="./node_modules/electron/dist"
ELECTRON_ZIP="electron-v$ELECTRON_VERSION-linux-x64.zip"
ELECTRON_URL="https://github.com/electron/electron/releases/download/v$ELECTRON_VERSION/$ELECTRON_ZIP"

# ==== 1. 清理旧的 dist 文件夹 ====
echo "清理旧的 Electron dist 文件夹..."
rm -rf "$ELECTRON_DIST_DIR"
mkdir -p "$ELECTRON_DIST_DIR"

# ==== 2. 下载 Linux Electron 二进制 ====
# echo "下载 Linux Electron v$ELECTRON_VERSION ..."
# curl -L "$ELECTRON_URL" -o "$ELECTRON_ZIP"

# ==== 3. 解压 Electron 二进制 ====
echo "解压 Electron 到 node_modules/electron/dist ..."
unzip -q "$ELECTRON_ZIP" -d "$ELECTRON_DIST_DIR"

# ==== 4. 删除压缩包 ====
# rm "$ELECTRON_ZIP"


# ==== 5. 打包 Linux 可执行 IDE ====
echo "开始打包 Linux 可执行版..."
npm run gulp vscode-linux-x64

echo "打包完成！请检查 VSCode-linux-x64 目录。"
