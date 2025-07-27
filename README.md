# RVC for Apple Silicon (M系列芯片) Mac - 傻瓜式稳定运行版

本项目是一个经过深度修改的RVC整合包，旨在为 **Apple Silicon (M1/M2/M3/M4等) Mac** 用户提供一个“开箱即用”的稳定推理体验。

原始整合包的详细说明请参见 `README原作者.md` 文件。

---

## 快速上手指南

### 步骤一：配置环境 (首次使用，仅需一次)
1.  **‼️ 授予脚本运行权限 (关键一步)**
    *   由于macOS的安全机制，您需要手动为我们的自动化脚本授予“执行”权限。**此操作仅需进行一次。**
    *   **方法A (推荐，最简单)：拖拽法**
        1.  打开“**终端**” (Terminal) 应用。
        2.  输入 `chmod +x ` (注意 `+x` 后面有一个**空格**)，**但先不要按回车**。
        3.  从“访达”(Finder)里，将 `一键配置环境.command` 文件**拖拽**到终端窗口里。
        4.  按下**回车键**。
        5.  再次输入 `chmod +x ` (同样，`+x` 后面有**空格**)。
        6.  这次，将 `一键启动.command` 文件**拖拽**到终端窗口里。
        7.  按下**回车键**。
    *   **方法B (备用)：命令法**
        1.  打开“终端”(Terminal) 应用。
        2.  输入 `cd ` (注意 `cd` 后面有一个**空格**)，然后将您的 `RVC-for-Mac` 文件夹**拖拽**到终端窗口里，再按**回车键**。
        3.  复制并粘贴以下整行命令，然后按**回车键**：
            ```bash
            chmod +x *.command
            ```

2.  **运行“一键配置环境”脚本**
    *   现在，您可以回到“访达”，双击运行 `一键配置环境.command`。
    *   脚本会自动检查并引导您完成所有配置。请根据终端窗口的中文提示进行操作。

### 步骤二：日常使用
1.  **双击 `一键启动.command`**
    *   **首次运行**：脚本会自动下载所有必需的预训练模型，请耐心等待。
    *   **日常运行**：模型下载完成后，启动速度会非常快。

2.  **根据原作者的使用教程逐一操作**
    *   原作者使用教程链接：https://www.yuque.com/baicaigongchang1145haoyuangong/imh23d。

## ⚠️ **如何获取您的成果** ⚠️

*   **请无视网页上可能弹出的“Error”！** 这是一个已知的前端显示BUG。只要终端窗口没有崩溃退出，就代表程序正在正常计算。

*   **请耐心等待！** 因为我们使用CPU计算，速度会稍慢。点击”模型推理“或“转换”后，请给程序一定的处理时间。
*   **预估时间！** 我自己使用M4 Pro芯片 48gb内存，在推理模型时候把size拉满到40，依旧需要13分钟左右一轮。所以点击训练后终端出现不动的情况不是卡死，请给它点时间。

*   **您的成果在这里！** 在点击”转换“后，等待片刻，请直接到项目文件夹下的 **`my_rvc_outputs`** 文件夹中寻找您转换好的 `.wav` 音频文件！

## 许可证 (License)

本仓库中的原创脚本及代码修改采用 [MIT 许可证](LICENSE)。原始整合包中的其他代码及组件，遵循其原有的许可证。

## 致谢

*   RVC-Project 的所有开发者
*   [原始整合包作者]

---
---

# RVC for Apple Silicon (M-series) Mac - Easy & Stable Edition

This project is a heavily modified RVC integration package, designed to provide a truly "out-of-the-box" and stable inference experience for **Apple Silicon (M1/M2/M3/M4, etc.) Mac** users.

For a detailed description of the original package, please refer to the `README_original.md` file.

## Quick Start Guide

### Step 1: Environment Setup (First-time use only)
1.  **Run the "One-Click Environment Setup" Script**
    *   Navigate to the project folder you downloaded.
    *   Double-click `一键配置环境.command` to run it.
    *   The script will automatically check and guide you through the entire setup process. Please follow the instructions in the terminal window.

### Step 2: Daily Use
1.  **Double-click `一键启动.command`**
    *   **On the first run**: The script will automatically download all necessary pre-trained models. Please be patient.
    *   **For daily runs**: Once the models are downloaded, the startup will be very fast.

2.  **Follow the Original Author's Tutorial for Operations**
    *   Original Author's Tutorial Link (in Chinese): https://www.yuque.com/baicaigongchang1145haoyuangong/imh23d

## ⚠️ **How to Get Your Results** ⚠️

*   **Please IGNORE any "Error" messages that may appear on the web page!** This is a known front-end display bug. As long as the terminal window has not crashed, it means the program is processing correctly in the background.

*   **Please be patient!** We are using the CPU for computation, which is slower than a GPU. After clicking "Infer/Convert," please give the program some time to process.
*   **Time Estimation!** On my M4 Pro chip with 48GB of RAM, a single round of inference with the chunk size maxed out at 40 still takes about **13 minutes**. If the terminal seems unresponsive after you start a task, it's not frozen—it's working hard. Please give it time.

*   **Your results are here!** After clicking "Convert" and waiting for a while, please navigate to the **`my_rvc_outputs`** folder within the project directory to find your successfully converted `.wav` audio files!

## License

The original scripts and code modifications in this repository are licensed under the [MIT License](LICENSE). Other code and components from the original integration package are subject to their original licenses.

## Acknowledgements

*   All developers of the RVC-Project
*   The author of the original integration package
