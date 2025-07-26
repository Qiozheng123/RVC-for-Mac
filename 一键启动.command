#!/bin/bash

#-----------------------------------------------------------
# RVC for macOS - 一键启动脚本 (v2.0)
#-----------------------------------------------------------

echo "你好，主人！正在为您启动RVC..."
echo "------------------------------------"

# 第1步：初始化并激活标准conda环境
echo "第1步：正在激活conda环境 rvc_env ..."

# 找到conda并初始化
source "$(conda info --base)/etc/profile.d/conda.sh"
if [ $? -ne 0 ]; then
    echo "错误：无法找到并初始化Conda！"
    echo "请先双击运行 '一键配置环境.command' 来完成首次配置。"
    read -p "按回车键退出。"
    exit 1
fi

# 激活标准环境
conda activate rvc_env
if [ $? -ne 0 ]; then
    echo "错误：激活conda环境 rvc_env 失败！"
    echo "请先双击运行 '一键配置环境.command' 来创建标准环境。"
    read -p "按回车键退出。"
    exit 1
fi
echo "环境激活成功！"
echo "------------------------------------"

# 第2步：自动进入脚本所在的文件夹
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"
echo "第2步：正在进入RVC项目文件夹..."
echo "已进入工作目录：$(pwd)"
echo "------------------------------------"

# 第3步：执行核心的启动脚本
echo "第3步：启动RVC WebUI，请稍候..."
echo "当看到 http://... 网址后，请复制到浏览器打开。"
./run.sh
echo "------------------------------------"

# 第4步：保持窗口开启，方便查看信息
echo "RVC程序已结束。按回车键退出此窗口。"
read -p ""