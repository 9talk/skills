#!/bin/bash

# ==============================================================================
# Script: pl-init.sh
# Description: 创建规划文件
# Usage: ./pl-init.sh <plan-name>
# ==============================================================================

# 配置
PLANS_DIR="plans"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 函数：打印帮助信息
show_help() {
    echo -e "${YELLOW}用法:${NC} ./pl-init.sh <plan-name>"
    echo -e "  名称：必须是 kebab-case 格式 (例如：add-user-auth)"
}

# 主逻辑
main() {
    # 1. 检查参数
    if [ -z "$1" ]; then
        show_help
        exit 1
    fi

    if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        show_help
        exit 0
    fi

    local plan_name="$1"

    # 2. 验证 kebab-case 格式
    if [[ ! $plan_name =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
        echo -e "${RED}错误：名称 '$plan_name' 不符合 kebab-case 格式${NC}"
        exit 1
    fi

    # 3. 确保目录存在
    if [ ! -d "$PLANS_DIR" ]; then
        mkdir -p "$PLANS_DIR"
    fi

    local file_path="${PLANS_DIR}/plan-${plan_name}.md"

    # 4. 检查文件是否存在
    if [ -f "$file_path" ]; then
        echo -e "${RED}错误：文件 '$file_path' 已存在${NC}"
        exit 1
    fi

    # 5. 创建空文件
    touch "$file_path"
    echo -e "${GREEN}✓ 创建成功：$file_path${NC}"
}

main "$@"
