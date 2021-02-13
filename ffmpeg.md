# 使用ffmpeg合并MP4文件

```bash
ffmpeg -i "Apache Sqoop Tutorial Part 1.mp4" -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts
ffmpeg -i "Apache Sqoop Tutorial Part 2.mp4" -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts
ffmpeg -i "Apache Sqoop Tutorial Part 3.mp4" -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate3.ts
ffmpeg -i "Apache Sqoop Tutorial Part 4.mp4" -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate4.ts
ffmpeg -i "concat:intermediate1.ts|intermediate2.ts|intermediate3.ts|intermediate4.ts" -c copy -bsf:a aac_adtstoasc "Apache Sqoop Tutorial.mp4"
```

# 视频分割

```bash
ffmpeg -ss 00:00:00 -t 00:00:03 -y -i test.mp4 -vcodec copy -acodec copy test1.mp4  
```

参数解释

```
说明：上面的这个例子是将test.mp4视频的前3秒，重新生成一个新视频。
-ss 开始时间，如： 00:00:00，表示从0秒开始，格式也可以00:00:0
-t 时长，如： 00:00:03，表示截取3秒长的视频，格式也可以00:00:3
-y 如果文件已存在强制替换；
-i 输入，后面是空格，紧跟着就是输入视频文件；
-vcodec copy 和 -acodec copy表示所要使用的视频和音频的编码格式，这里指定为copy表示原样拷贝；
```


# 使用ffmpeg转换flv到mp4

```bash
ffmpeg -i out.flv -vcodec copy -acodec copy out.mp4
```

# 使用ffmpeg截图

```bash
ffmpeg -ss 00:10:00 -i "Apache Sqoop Tutorial.mp4" -y -f image2 -vframes 1 test.png
```

或

```bash
ffmpeg -ss 10 -i input.flv -y -f image2  -vframes 100 -s 352x240 b-%03d.jpg
```

```
ffmpeg -i test.mp4 -y -f mjpeg -ss 3 -t 1  test1.jpg
ffmpeg -i test.mp4 -y -f image2 -ss 3 -vframes 1 test1.jpg
```

上面二个例子都表示，在第三秒的时候，截图。

参数解释:

```
-i  输入文件
-y  覆盖
-f  生成图片格式
-ss 开始截图时间 seconds or in hh:mm:ss[.xxx] 如果截图开始时间越接近篇尾，所花费的时间就会越长
-vframes  截图帧数 或者 使用 -t : 截图时长 seconds, or hh:mm:ss[.xxx]
-s  图片宽高比
b-%3d.jpg 格式化文件命名,会生成 b-001.jpg，b-002.jpg 等。
```
注意：把-ss 10放到第一个参数的位置，速度比放到放到其他位置快，且不会出现如下错误


# 添加水印

* 水印局中

```bash
ffmpeg -i out.mp4 -i sxyx2008@163.com.gif -filter_complex overlay="(main_w/2)-(overlay_w/2):(main_h/2)-(overlay_h)/2" output.mp4
```

参数解释

```
-i out.mp4(视频源)
-i sxyx2008@163.com.gif(水印图片)
overlay 水印的位置
output.mp4 输出文件
```


# 翻转和旋转


翻转

水平翻转语法: -vf hflip

```
ffplay -i out.mp4 -vf hflip
```

垂直翻转语法：-vf vflip

```
ffplay -i out.mp4 -vf vflip
```

旋转

语法：transpose={0,1,2,3}

0:逆时针旋转90°然后垂直翻转

1:顺时针旋转90°

2:逆时针旋转90°

3:顺时针旋转90°然后水平翻转


将视频顺时针旋转90度

```
ffplay -i out.mp4 -vf transpose=1
```

将视频水平翻转(左右翻转)

```
ffplay -i out.mp4 -vf hflip
```

顺时针旋转90度并水平翻转

```
ffplay -i out.mp4 -vf transpose=1,hflip
```

# 添加字幕

有的时候你需要给视频加一个字幕(subtitle)，使用ffmpeg也可以做。一般我们见到的字幕以srt字幕为主，在ffmpeg里需要首先将srt字幕转化为ass字幕，然后就可以集成到视频中了(不是单独的字幕流，而是直接改写视频流)。

```bash
ffmpeg -i my_subtitle.srt my_subtitle.ass
ffmpeg -i inputfile.mp4 -vf ass=my_subtitle.ass outputfile.mp4
```

但是值得注意的是：

my_subtitle.srt需要使用UTF8编码，老外不会注意到这一点，但是中文这是必须要考虑的；

将字幕直接写入视频流需要将每个字符渲染到画面上，因此有一个字体的问题，在ass文件中会指定一个缺省字体，例如Arial，但是我们首先需要让ffmpeg能找到字体文件，不然文字的渲染就无从谈起了。ffmpeg使用了fontconfig来设置字体配置。你需要首先设置一下FONTCONFIG_PATH或者FONTCONFIG_FILE环境变量，不然fontconfig是无法找到配置文件的，这一点请参看这篇文章，如果你设置的是FONTCONFIG_PATH，那把配置文件保存为%FONTCONFIG_PATH%/font.conf即可，然后你可以在font.conf文件中配置字体文件的路径之类的。


Windows下为fontconfig设置如下的环境变量

```
FC_CONFIG_DIR=C:\ffmpeg
FONTCONFIG_FILE=font.conf
FONTCONFIG_PATH=C:\ffmpeg
PATH=C:\ffmpeg\bin;%PATH%
```

下面是一个简单的Windows版font.conf文件。

```xml
<?xml version="1.0"?>
<fontconfig>

<dir>C:\WINDOWS\Fonts</dir>

<match target="pattern">
   <test qual="any" name="family"><string>mono</string></test>
   <edit name="family" mode="assign"><string>monospace</string></edit>
</match>

<match target="pattern">
   <test qual="all" name="family" mode="not_eq"><string>sans-serif</string></test>
   <test qual="all" name="family" mode="not_eq"><string>serif</string></test>
   <test qual="all" name="family" mode="not_eq"><string>monospace</string></test>
   <edit name="family" mode="append_last"><string>sans-serif</string></edit>
</match>

<alias>
   <family>Times</family>
   <prefer><family>Times New Roman</family></prefer>
   <default><family>serif</family></default>
</alias>
<alias>
   <family>Helvetica</family>
   <prefer><family>Arial</family></prefer>
   <default><family>sans</family></default>
</alias>
<alias>
   <family>Courier</family>
   <prefer><family>Courier New</family></prefer>
   <default><family>monospace</family></default>
</alias>
<alias>
   <family>serif</family>
   <prefer><family>Times New Roman</family></prefer>
</alias>
<alias>
   <family>sans</family>
   <prefer><family>Arial</family></prefer>
</alias>
<alias>
   <family>monospace</family>
   <prefer><family>Andale Mono</family></prefer>
</alias>
<match target="pattern">
   <test name="family" mode="eq">
      <string>Courier New</string>
   </test>
   <edit name="family" mode="prepend">
      <string>monospace</string>
   </edit>
</match>
<match target="pattern">
   <test name="family" mode="eq">
      <string>Courier</string>
   </test>
   <edit name="family" mode="prepend">
      <string>monospace</string>
   </edit>
</match>

</fontconfig>
```


下面这个是Linux系统下改版过来的

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<!-- /etc/fonts/fonts.conf file to configure system font access -->
<fontconfig>
<!-- 
	Find fonts in these directories
-->
<dir>C:/Windows/Fonts</dir>
<!--
<dir>/usr/X11R6/lib/X11/fonts</dir>
-->
<!--
	Accept deprecated 'mono' alias, replacing it with 'monospace'
-->
<match target="pattern">
	<test qual="any" name="family"><string>mono</string></test>
	<edit name="family" mode="assign"><string>monospace</string></edit>
</match>

<!--
	Load per-user customization file, but don't complain
	if it doesn't exist
-->
<include ignore_missing="yes" prefix="xdg">fontconfig/fonts.conf</include>

<!--
	Load local customization files, but don't complain
	if there aren't any
-->
<include ignore_missing="yes">conf.d</include>
<include ignore_missing="yes">local.conf</include>

<!--
	Alias well known font names to available TrueType fonts.
	These substitute TrueType faces for similar Type1
	faces to improve screen appearance.
-->
<alias>
	<family>Times</family>
	<prefer><family>Times New Roman</family></prefer>
	<default><family>serif</family></default>
</alias>
<alias>
	<family>Helvetica</family>
	<prefer><family>Arial</family></prefer>
	<default><family>sans</family></default>
</alias>
<alias>
	<family>Courier</family>
	<prefer><family>Courier New</family></prefer>
	<default><family>monospace</family></default>
</alias>

<!--
	Provide required aliases for standard names
	Do these after the users configuration file so that
	any aliases there are used preferentially
-->
<alias>
	<family>serif</family>
	<prefer><family>Times New Roman</family></prefer>
</alias>
<alias>
	<family>sans</family>
	<prefer><family>Arial</family></prefer>
</alias>
<alias>
	<family>monospace</family>
	<prefer><family>Andale Mono</family></prefer>
</alias>
</fontconfig>
```

[http://blog.raphaelzhang.com/2013/04/video-streaming-and-ffmpeg-transcoding/](http://blog.raphaelzhang.com/2013/04/video-streaming-and-ffmpeg-transcoding/)


# 嵌入字幕

在一个MP4文件里面添加字幕，不是把 .srt 字幕文件集成到 MP4 文件里，而是在播放器里选择字幕，这种集成字幕比较简单，速度也相当快

```bash
ffmpeg -i input.mp4 -i subtitles.srt -c:s mov_text -c:v copy -c:a copy output.mp4
```

希望字幕直接显示出来，其实也不难

```
ffmpeg -i subtitle.srt subtitle.ass
ffmpeg -i input.mp4 -vf ass=subtitle.ass output.mp4
```

[http://blog.neten.de/posts/2013/10/06/use-ffmpeg-to-burn-subtitles-into-the-video/](http://blog.neten.de/posts/2013/10/06/use-ffmpeg-to-burn-subtitles-into-the-video/)


# 截图

每隔一秒截一张图

```
ffmpeg -i out.mp4 -f image2 -vf fps=fps=1 out%d.png
```

每隔20秒截一张图

```
ffmpeg -i out.mp4 -f image2 -vf fps=fps=1/20 out%d.png
```

多张截图合并到一个文件里（2x3）每隔一千帧(秒数=1000/fps25)即40s截一张图

```
ffmpeg -i out.mp4 -frames 3 -vf "select=not(mod(n\,1000)),scale=320:240,tile=2x3" out.png
```

从视频中生成GIF图片

```
ffmpeg -i out.mp4 -t 10 -pix_fmt rgb24 out.gif
```

转换视频为图片（每帧一张图）

```
ffmpeg -i out.mp4 out%4d.png
```

图片转换为视频

```
ffmpeg -f image2 -i out%4d.png -r 25 video.mp4
```

# 添加字幕

```
ffmpeg -i out.mp4 -vf subtitles=out.srt output.mp4
```
