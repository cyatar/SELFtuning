# SELFtuning

# 这是什么？

+ 一个尝试性的，对PID自整定方法的复现？(悬而未决的模棱两可)

+ 采用的是继电反馈控制的测试方法

# 文件介绍

+ FSFRelay.m  
  
  频率采样滤波器的代码，用来估计频率响应。

+ FR4PID.m
  
  基于系统两个已知频率点频率响应计算PID参数的代码。

+ Test4tuner.m
  
  运行该文件即可得到PID控制器的Kc tauI taud

+ Relay_Test.slx
  
  继电反馈控制的simulink模型

+ Model_Test.slx
  
  测试计算出的参数性能。

# 如何使用

运行Test4tuner.m 中的第一段，初始化

然后运行Relay_Test.slx

再运行Test4tuner.m的第二段即可

会计算出Kc tauI taud

填入Model_Test.slx中即可。

本次我们的目标系统是一个最小非相位行为系统，具有至少一个或多个极点位于右半平面。

所以我们整定出来的参数效果还是可以的。

有兴趣可以试一下别的系统。