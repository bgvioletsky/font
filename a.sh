#!/bin/bash

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
            font-size: 20px;
            text-align: center;
            margin: 0;
        }
    </style>
</head>
<body>
    <h1 style=\"grid-column: span 3; text-align: center;\">欢迎使用自定义字体</h1>" > fonts.html

echo "<style>" >> fonts.html
for font in *.ttf; do
    font_name="${font%.ttf}"
    echo "    @font-face {
        font-family: '$font_name';
        src: url('$font') format('truetype');
    }" >> fonts.html
done
echo "</style>" >> fonts.html

for font in *.ttf; do
    font_name="${font%.ttf}"
    echo "    <div style=\"font-family: '$font_name'; padding: 10px; border: 1px solid #ccc; border-radius: 5px;\">
        <p>这是 $font_name 字体的展示。</p>
    </div>" >> fonts.html
done

echo "</body>
</html>" >> fonts.html

echo "字体展示 HTML 文件已生成：fonts.html"
