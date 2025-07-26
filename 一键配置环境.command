#!/bin/bash

#----------------------------------------------------------------------
# RVC for macOS (Apple Silicon) - 一键傻瓜式环境配置脚本
#
# 功能:
# 1. 检查并引导安装核心工具 (Homebrew, Miniconda)。
# 2. 自动安装 aria2 下载工具。
# 3. 自动创建一个名为 rvc_env 的全新、纯净的 Conda 环境。
# 4. 在新环境中，精确安装所有已验证兼容的 Python 库版本。
#----------------------------------------------------------------------

echo "############################################################"
echo "###   欢迎使用 RVC for Apple Silicon 环境配置向导！      ###"
echo "############################################################"
echo
echo "本向导将为您自动完成所有复杂的环境配置步骤。"
echo "请您根据提示操作，整个过程可能需要10-20分钟，请保持网络通畅。"
echo

# 函数：暂停并等待用户确认
function pause_and_continue {
    echo
    read -p "请按回车键继续..."
}

# --- 步骤 1: 检查核心工具 ---
echo "--- 步骤 1/4: 检查核心开发工具 (Homebrew & Conda) ---"

# 检查 Homebrew
if ! command -v brew &> /dev/null; then
    echo "[!] 未检测到 Homebrew。Homebrew 是 macOS 的必备包管理器。"
    echo "    请问是否现在自动为您安装？(y/n)"
    read -r install_brew
    if [[ "$install_brew" == "y" ]]; then
        echo "    正在为您安装 Homebrew，请根据屏幕提示输入您的电脑密码..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [ $? -ne 0 ]; then
            echo "[错误] Homebrew 安装失败！请检查您的网络或手动安装后再试。"
            exit 1
        fi
        echo "    Homebrew 安装成功！"
    else
        echo "[!] 已跳过 Homebrew 安装。请注意，后续步骤可能会失败。"
    fi
else
    echo "[✓] Homebrew 已安装。"
fi

# 检查 Conda
if ! command -v conda &> /dev/null; then
    echo "[!] 未检测到 Conda。Conda 是管理 Python 环境的最佳工具。"
    echo "    强烈建议您安装 Miniconda。请问是否现在为您打开下载页面？(y/n)"
    read -r install_conda
    if [[ "$install_conda" == "y" ]]; then
        echo "    正在为您打开 Miniconda 下载页面..."
        open "https://docs.conda.io/en/latest/miniconda.html"
        echo "    请下载与您 macOS 版本对应的 'pkg' 安装包并进行安装。"
        echo "    安装完成后，请完全关闭并重新打开本终端窗口，然后再次运行本脚本。"
        exit 0
    else
        echo "[!] 已跳过 Conda 安装。本脚本无法继续，请务必安装 Conda。"
        exit 1
    fi
else
    echo "[✓] Conda 已安装。"
fi
pause_and_continue

# --- 步骤 2: 安装 aria2 ---
echo
echo "--- 步骤 2/4: 安装 aria2 高速下载工具 ---"
if ! command -v aria2c &> /dev/null; then
    echo "    正在使用 Homebrew 安装 aria2c..."
    brew install aria2
    if [ $? -ne 0 ]; then
        echo "[错误] aria2 安装失败！"
        exit 1
    fi
    echo "[✓] aria2 安装成功！"
else
    echo "[✓] aria2 已安装。"
fi
pause_and_continue

# --- 步骤 3: 创建并配置 Conda 环境 ---
echo
echo "--- 步骤 3/4: 创建并配置全新的 Conda 环境 'rvc_env' ---"
ENV_NAME="rvc_env"
# 检查环境是否已存在
if conda env list | grep -q "$ENV_NAME"; then
    echo "[!] 检测到名为 '$ENV_NAME' 的环境已存在。"
    echo "    为了保证环境纯净，建议删除重建。是否删除现有环境？(y/n)"
    read -r delete_env
    if [[ "$delete_env" == "y" ]]; then
        echo "    正在删除旧环境..."
        conda env remove -n $ENV_NAME -y
        echo "    旧环境删除成功！"
    else
        echo "[!] 已跳过删除。请注意，这可能导致后续安装出现问题。"
    fi
fi

echo "    正在创建基于 Python 3.10 的新环境 '$ENV_NAME'..."
conda create -n $ENV_NAME python=3.10 -y
if [ $? -ne 0 ]; then
    echo "[错误] Conda 环境创建失败！"
    exit 1
fi
echo "[✓] Conda 环境创建成功！"
pause_and_continue

# --- 步骤 4: 精确安装所有Python库 ---
echo
echo "--- 步骤 4/4: 安装所有必需的 Python 库 (此步骤耗时最长) ---"
echo "    正在激活新环境并安装核心库..."

# 使用精确版本号进行安装，确保100%复现
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate $ENV_NAME

pip install \
    torch==2.1.2 \
    torchaudio==2.1.2 \
    av==11.0.0 \
    numpy==1.23.5 \
    fairseq==0.12.2 \
    faiss-cpu==1.7.3 \
    gradio==3.34.0 \
    librosa==0.9.1 \
    numba==0.56.4 \
    llvmlite==0.39.0 \
    pydantic==1.10.22 \
    starlette==0.22.0 \
    fastapi==0.88.0 \
    soundfile \
    ffmpeg-python \
    praat-parselmouth \
    pyworld==0.3.2 \
    scikit-learn \
    onnxruntime \
    torchcrepe==0.0.20

if [ $? -ne 0 ]; then
    echo "[错误] Python 库安装失败！请检查您的网络连接或Pip配置。"
    exit 1
fi

echo "[✓] 所有 Python 库均已成功安装！"
echo
echo "############################################################"
echo "###    恭喜您！所有环境配置已圆满完成！                ###"
echo "###                                                      ###"
echo "###    现在，您可以去双击运行 '一键启动.command' 了！    ###"
echo "############################################################"
echo
read -p "按回车键退出。"