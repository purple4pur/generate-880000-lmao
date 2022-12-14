周五上班时无聊的小小摸鱼，下班回家重写了一份。

看到某群友老图新发，我也顺便老代码新写。加上了 Makefile 和 README，是不
是更像一个正经项目了呢（？）感觉甚至可以拿来水个视频，这下狠狠 dssq 了，
虽然有点过气。

本项目生成的代码尽可能 1:1 地还原梗图里的代码，但还是自作主张在最后加了
一句 default。忍不了了，一拳把原代码打爆！

另外，原代码是 cpp 的，本项目额外写了一份生成 c 代码的版本，意外发现两份
代码编译时的资源消耗差别还挺大。

ps. 谁能想到这竟然是 2021 年 10 月出现的梗呢，我还想着这大概也就半年多
    前的事吧……

pps. 视频已经水出来了：
     https://www.bilibili.com/video/BV1sv4y1o72A/


食用方法
====================

遇事不决先 'make help' 一下，都写明白了。
A. 分步骤食用
    1) make gen         # 生成 88 万行代码
    2) make build       # 编译上一步生成的代码
    3) make run         # 润！我确实是可运行的哦
B. 一条龙服务
    make all            # gen + build + run

默认使用 cpp 代码，若需指定使用 c 代码，在每条 make 命令后添加 target=c，
如 'make all target=c'。

已加入 Python 版本，target 可指定为 cpp/c/py。
注意 Python 版本使用了 match 语句，要求 python 版本至少为 3.10。


关于编译时的性能消耗
====================

88 万行代码，虽然是一坨*，但还是会让编译器血压很高。

我的编译配置：i7-10750H + 16G（超过 11 G 可用）
使用 g++ 编译 cpp 代码：
    cpu：不到 20%，喝水
    内存：稳定时占用超过 6 G，最高时全部吃空，无法参考
    硬盘：最高时占用超过 8 G，编译完成后空间全部释放
    编译时间：将近 5 分钟
使用 gcc 编译 c 代码：
    cpu：不到 20%，喝水
    内存：稳定时占用不到 2 G，最高时占用超过 4 G
    硬盘：没有肉眼可见的空间占用
    编译时间：不到 3 分钟

另外，在我的办公笔记本（某一两年前的锐龙 + 8G）上，也跑过两次 c 代码的
编译：
    cpu：在 20% 上下浮动
    内存：没留意
    硬盘：没留意
    编译时间：大约 30 分钟

从这一坨暴力的编译测试能发现：
1) 不同设备的编译性能差别很大，就本例而言，充足的内存能显著加快编译速度
2) gcc/g++ 各自编译相同功能的 c/c++ 资源占用也差别较大，就本例而言，g++
   的内存和磁盘占用要显著多于 gcc

关于新加入的 Python 版本，运行速度飞快，在我的机器上（Python 3.10），
「解释」的时长不到 4s，运行中的内存占用不到 1.8 G，程序运行顺畅。

看来跑一坨*，还得看我 Python！
