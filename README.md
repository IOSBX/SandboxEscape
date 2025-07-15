# SandboxEscape

## 介绍

这个项目演示了如何使用 MacDirtyCow 漏洞（CVE-2022-46689）在 iOS 设备上实现沙盒逃逸。MacDirtyCow 是一种针对 iOS 15.0 到 16.1.2 版本的漏洞，允许应用程序读写沙盒外的文件，而无需完全越狱设备。

**注意**：此项目仅用于教育和研究目的。请确保在合法环境中使用，且遵守相关法律法规。使用此漏洞可能导致设备不稳定或安全风险。

## 要求

- iOS 设备运行 iOS 15.0 - 16.1.2
- Xcode 开发环境（本项目基于 Objective-C）

## 项目结构

- `SandboxEscape/`：主应用目录
  - `Exploitation/MacDirtyCow/`：漏洞利用相关代码
  - `ViewController.m`：主视图控制器，实现 exploit 逻辑
- `libchoma.a` 和 `libxpf.dylib`：所需库文件

## 安装和构建

1. 打开 Xcode 项目：`GetRoot.xcodeproj`
2. 构建并部署到兼容的 iOS 设备。
3. 确保设备未越狱，且版本符合要求。

## 使用方法

1. 启动应用。
2. REQUEST ACCESS SERVICE com.apple.app-sandbox.read-write的UIAlertContrller弹窗点击好

## 警告

- 此 exploit 不提供完全 root 权限，仅限于沙盒逃逸。
- Apple已通过更新系统版本修复此漏洞。
- 如果遇到错误，请检查设备兼容性。

## 参考

- <mcurl name="MacDirtyCow 详情" url="https://github.com/search?q=MacDirtyCow"></mcurl>
        
