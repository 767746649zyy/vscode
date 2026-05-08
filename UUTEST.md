## 环境必备

nodejs version >= 22.x
python
c/c++

## 执行

### 安装依赖

`npm i`

### 编译源码

`npm run compile`

### VS Code内部构建

Ctrl+Shift+B（win）、CMD+Shift+B（mac）启动构建任务
Ctrl+D关闭构建

### 终端构建

`npm run watch` 这将在单个终端中运行核心监视任务和监视扩展任务。

### Desktop

macOS and Linux
`./scripts/code.sh`
`./scripts/code-cli.sh # for running CLI commands (eg --version)`

Windows
`.\scripts\code.bat`
`.\scripts\code-cli.bat`

### VS Code for the Web

macOS and Linux:`./scripts/code-web.sh`
Windows:`.\scripts\code-web.bat`

### Code Server Web

macOS and Linux:`./scripts/code-server.sh --launch`
Windows:`.\scripts\code-server.bat --launch`

### 打包

### windows 应用包

`npm run gulp vscode-win32-x64   `

### linux 应用包

由于打包 Linux 安装包 时在线下载linux Electron二进制文件失败，链接github.com失败。所以事先下载好放到本地
`curl -L https://github.com/electron/electron/releases/download/v39.8.7/electron-v39.8.7-linux-x64.zip -o electron-v39.8.7-linux-x64.zip`

然后执行 `sh prebuild-linux.sh`

注意：打包其他平台应用时需要重新下载electron依赖

### macOS 应用包（.app）

禁用copilot，打开build/gulpfile.vscode.ts注释prepareBuiltInCopilotExtensionShims

mac intel处理器，禁用copilot代码补全，也可以去掉BUILTIN_COPILOT_DISABLED=true
`BUILTIN_COPILOT_DISABLED=true npm run gulp vscode-darwin-x64`

mac M系列处理器，禁用copilot代码补全，也可以去掉BUILTIN_COPILOT_DISABLED=true
`BUILTIN_COPILOT_DISABLED=true npm run gulp vscode-darwin-arm64`

### macOS dmg 安装包（.dmg）

先生成 .app → 用 hdiutil 或 electron-builder 转成 .dmg
路径按需修改
`hdiutil create -volname "UUTest" \
-srcfolder /Users/miduo/code/uuTest/VSCode-darwin-x64/UUTest.app \
-ov -format UDZO UUTest.dmg`

## 打开控制台

cmd+option+i(mac)

## 参考资料

- VS Code官方文档：https://code.visualstudio.com/docs
- VS Code产品定制指南：https://github.com/microsoft/vscode/wiki/How-to-Contribute#build-and-run-from-source
- VS Code构建文档：https://github.com/microsoft/vscode/wiki/How-to-Contribute#building-and-running-the-code
