#!/bin/bash
###
 # @Author: bgcode
 # @Date: 2024-10-25 18:24:04
 # @LastEditTime: 2024-10-25 18:24:07
 # @LastEditors: bgcode
 # @Description: 描述
 # @FilePath: /font/rename.sh
 # 本项目采用GPL 许可证，欢迎任何人使用、修改和分发。
### 

# 初始化计数器
counter=1

# 遍历所有 .ttf 文件
for file in *.ttf; do
    # 重命名文件
    mv "$file" "font_$counter.ttf"
    # 递增计数器
    ((counter++))
done

echo "文件重命名完成！"
