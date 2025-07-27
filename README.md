# RVC for Apple Silicon (M系列芯片) Mac - 傻瓜式稳定运行版

本项目是一个经过深度修改的RVC整合包，旨在为 **Apple Silicon (M1/M2/M3/M4等) Mac** 用户提供一个“开箱即用”的稳定推理体验。

原始整合包的详细说明请参见 `README原作者.md` 文件。

---

## 快速上手指南

### ‼️ 步骤零：安装核心开发工具 (在任何新Mac上，仅需执行一次)

在开始之前，您的Mac需要安装苹果官方的命令行开发工具，这是所有后续步骤的基础。

1.  打开“**终端**” (Terminal) 应用。
2.  **复制并粘贴**以下命令，然后按**回车键**：
    ```bash
    xcode-select --install
    ```
3.  在弹出的窗口中，点击 **“安装” (Install)**，并同意许可协议。
4.  请耐心等待安装完成。如果提示“已安装”，则可直接进行下一步。

---

### 步骤一：配置项目环境 (完成“步骤零”后，仅需一次)

1.  **授予脚本运行权限**
    *   由于macOS的安全机制，您需要为自动化脚本授予“执行”权限。
    *   打开“**终端**”，输入 `chmod +x ` (注意末尾有空格)，然后将 `一键配置环境.command` 和 `一键启动.command` 依次拖入终端并按回车。

2.  **运行“一键配置环境”脚本**
    *   **双击运行 `一键配置环境.command`**。
    *   脚本会尝试为您完成所有配置。**如果一切顺利，您可以直接跳到“步骤二：日常使用”。**
    *   如果脚本中途失败并提示 `CondaToSNonUserInteractiveError` 错误，请查看下面的“**故障排除**”章节来解决。

### ‼️ 故障排除：解决 Conda 服务条款错误

如果您在运行“一键配置环境”脚本时，终端提示 `CondaToSNonUserInteractiveError`，请按以下步骤手动同意Conda服务条款：

1.  **打开“终端”应用。**
2.  **复制并粘贴**以下命令，然后按**回车**：
    ```bash
    conda create -n tos_accept_test python=3.10
    ```
3.  **根据终端提示，完成两次确认**：
    *   首先，当提问 `Proceed ([y]/n)?` 时，请直接按 **回车键**。
    *   然后，当提问 `Do you accept the terms? [yes|no]` 时，请输入 **`yes`** ，然后按**回车键**。
4.  **操作完成后，请重新双击运行 `一键配置环境.command` 脚本**。这次它就能顺利完成了。

---

### 步骤二：日常使用

1.  **双击 `一键启动.command`**
    *   **⚠️ 国内用户网络建议**: 本项目首次运行时需要从国外服务器(Hugging Face)下载大量模型文件。**强烈建议您开启全局代理（梯子）**，否则极易因网络问题导致下载失败。
    *   **首次运行**：脚本会自动下载所有必需的预训练模型，请耐心等待。**如果中途因网络问题中断，请直接关闭终端窗口，然后重新双击`一键启动.command`**，脚本会自动继续下载未完成的部分。
    *   **日常运行**：模型下载完成后，启动速度会非常快。

2.  **根据原作者的使用教程逐一操作**
    *   原作者使用教程链接：https://www.yuque.com/baicaigongchang1145haoyuangong/imh23d。

## ⚠️ **如何获取您的成果** ⚠️

*   **请无视网页上可能弹出的“Error”！** 这是一个已知的前端显示BUG。只要终端窗口没有崩溃退出，就代表程序正在正常计算。

*   **请耐心等待！** 因为我们使用CPU计算，速度会稍慢。点击”模型推理“或“转换”后，请给程序一定的处理时间。
*   **预估时间！** 我自己使用M4 Pro芯片 48gb内存，在推理模型时候把size拉满到40，依旧需要13分钟左右一轮。所以点击训练后终端出现不动的情况不是卡死，请给它点时间。

*   **您的成果在这里！** 在点击”转换“后，等待片刻，请直接到项目文件夹下的 **`my_rvc_outputs`** 文件夹中寻找您转换好的 `.wav` 音频文件！

## 许可证 (License) & 致谢

本仓库中的原创脚本及代码修改采用 [MIT 许可证](LICENSE)。感谢 RVC-Project 的所有开发者和原始整合包作者。

---
---

# RVC for Apple Silicon (M-series) Mac - Easy & Stable Edition

This project is a heavily modified RVC integration package, designed to provide a truly "out-of-the-box" and stable inference experience for **Apple Silicon (M1/M2/M3/M4, etc.) Mac** users.

For a detailed description of the original package, please refer to the `README_original.md` file.

---

## Quick Start Guide

### ‼️ Step 0: Install Core Developer Tools (Required once on any new Mac)

Before you begin, your Mac needs the official Apple Command Line Tools, which are essential for all subsequent steps.

1.  Open the **Terminal** application.
2.  **Copy and paste** the following command, then press **Enter**:
    ```bash
    xcode-select --install
    ```
3.  In the pop-up window, click **"Install"** and agree to the license terms.
4.  Please wait patiently for the installation to complete. If it says "already installed," you can proceed to the next step.

---

### Step 1: Configure the Project Environment (Required once after Step 0)

1.  **Grant Script Execution Permissions**
    *   Due to macOS security mechanisms, you need to grant "execute" permissions to the automation scripts.
    *   Open **Terminal**, type `chmod +x ` (note the space at the end), then drag and drop the `一键配置环境.command` and `一键启动.command` files into the Terminal window one by one, pressing Enter after each.

2.  **Run the "One-Click Environment Setup" Script**
    *   **Double-click `一键配置环境.command` to run it.**
    *   The script will attempt to complete all configurations for you. **If it finishes successfully, you can proceed directly to "Step 2: Daily Use."**
    *   If the script fails with a `CondaToSNonUserInteractiveError` message, please see the "**Troubleshooting**" section below.

### ‼️ Troubleshooting: Resolving the Conda Terms of Service Error

If the "One-Click Environment Setup" script fails and displays a `CondaToSNonUserInteractiveError`, please follow these steps to manually accept the Conda Terms of Service:

1.  **Open the Terminal application.**
2.  **Copy and paste** the command below, then press **Enter**:
    ```bash
    conda create -n tos_accept_test python=3.10
    ```
3.  **Follow the prompts to confirm twice**:
    *   First, when asked `Proceed ([y]/n)?`, simply press **Enter**.
    *   Then, when asked `Do you accept the terms? [yes|no]`, type **`yes`** and press **Enter**.
4.  **Once completed, please double-click and run the `一键配置环境.command` script again**. It will now complete without any issues.

---

### Step 2: Daily Use

1.  **Double-click `一键启动.command`**
    *   **⚠️ Network Recommendation**: On its first run, this project needs to download large model files from international servers (Hugging Face). It is **highly recommended to use a global VPN or proxy** to avoid network-related failures.
    *   **On the first run**: The script will automatically download all necessary pre-trained models. Please be patient. **If the download is interrupted by network issues, simply close the terminal window and double-click `一键启动.command` again.** The script is smart enough to resume downloading the remaining files.
    *   **For daily runs**: Once the models are downloaded, the startup will be very fast.

2.  **Follow the Original Author's Tutorial for Operations**
    *   Original Author's Tutorial Link (in Chinese): https://www.yuque.com/baicaigongchang1145haoyuangong/imh23d

## ⚠️ **How to Get Your Results** ⚠️

*   **Please IGNORE any "Error" messages that may appear on the web page!** This is a known front-end display bug.
*   **Please be patient!** CPU inference takes time (it can take around 13 minutes on an M4 Pro). As long as the terminal has not crashed, the program is working correctly.
*   **Your results are in the `my_rvc_outputs` folder!**

## License & Acknowledgements

The original modifications in this repository are licensed under the [MIT License](LICENSE). We thank all developers of the RVC-Project and the author of the original integration package.
