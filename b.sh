#!/bin/bash
###
 # @Author: bgcode
 # @Date: 2024-10-25 18:46:46
 # @LastEditTime: 2024-10-25 19:14:10
 # @LastEditors: bgcode
 # @Description: 描述
 # @FilePath: /font/b.sh
 # 本项目采用GPL 许可证，欢迎任何人使用、修改和分发。
### 

# 创建或清空 fonts.html 文件
echo "<!DOCTYPE html>
<html lang=\"zh\">
<head>
   <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>字体展示</title>
    <style>
        body {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        p {
            font-size: 30px;
            text-align: center;
            margin: 0;
        }
    </style>
     <script>
        function copyToClipboard(text) {
            navigator.clipboard.writeText(text).then(() => {
                alert('已复制: ' + text);
            }).catch(err => {
                console.error('复制失败:', err);
            });
        }
    </script>
</head>
<body>
    <h1 style=\"grid-column: span 3; text-align: center;\">欢迎使用自定义字体</h1>" > index.html
url="https://cdn.jsdelivr.net/gh/bgvioletsky/font@0.0.1/"
# 将文件名按顺序存储到数组中
files=(*.ttf)

# 生成 @font-face 规则
content="<style>\n"
for ((i=0; i<${#files[@]}; i++)); do
    font="${files[i]}"
    font_name="font_$((i + 1))"  # 使用 i + 1 生成 font_1, font_2, 等
    content+="    @font-face {\n"
    content+="        font-family: '$font_name';\n"
    content+="        src: url('$url$font_name.ttf') format('truetype');\n"
    content+="    }\n"
done
content+="</style>\n"

# 生成字体展示的 HTML
for ((i=0; i<${#files[@]}; i++)); do
    font="${files[i]}"
    font_name="font_$((i + 1))"  # 使用与上面相同的命名方式
    content+="    <div style=\"font-family: '$font_name'; padding: 10px; border: 1px solid #ccc; border-radius: 5px;\">\n"
    content+="        <p>$font_name 字体展示。</p>\n"
    content+="        <button class=\"copy-button\" onclick=\"copyToClipboard('$url$font_name.ttf')\">复制字体链接</button>\n"
    content+="    </div>\n"
done

# 写入文件
echo -e "$content" >> index.html

# 结束 HTML 文件
echo "</body>
</html>" >> index.html

echo "字体展示 HTML 文件已生成：index.html"
