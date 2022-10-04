# toy
编写些脚本将运维经常所用到小玩意所集成在一起
toy有玩具的意思，我觉得这些脚本都不是很高大上的玩意，只不过方便我完成些太重复繁琐的过程。
在工作的过程中发现有一些事情其实完全可以使用脚本来实现，方便在以后运维时候，拿着U盘然后快速的完成维护的工作，提供工作效率。
以后的计划：
* Windows Bat版本（初步完成）
* Linux Shell版本（在mac os也可用）（新建文件夹）

# WindowsToy v1.0
## 大概介绍
使用bat编写
之前使用if else语句来生成全部，发现经常有bug，干脆就使用编程的流氓goto来实现，目前使用goto来实现，效果类似于switch case的效果。
话说bat真的无语啊，经常有错的地方，比如for内的需要括号转义，bat相比于python、lua之类的脚本语言不适合作为开发，但是奈何目前我们遇到的大部分桌面运维都是接触到Windows的多，使用bat直接可以用，不需要配置安装python、lua的解释环境，所以嘛，先忍忍。
## 更新了
* 2022年10月4日15:33:18->v1.0
  * 基础的完成大致框架的功能
  * *后面打算更新终端颜色的美化、拓展更多的功能
  
## 目前的功能
现在还是有蛮多的bug，欢迎各位大佬一起来交流！
``` bash
echo ----------====start====----------
echo		ID	NOTES
echo 	00	退出
echo 	0	切换到administrator执行
echo 	 0a	切换到指定用户执行
echo 	1	重置网络设置
echo 	2	修复输入法
echo 	3	清空回收站
echo 	4	批量安装%~dp0目录下全部*.msu,*.msi,*.exe可执行文件
echo 	5	重命计算机名字
echo 	6	新电脑设置域
echo 	 6a	老电脑修改域
echo.
set dev=设备管理器(devmgmt.msc)
set reg=注册表(regedit)
set dco=系统组件(dcomcnfg)
set com=计算机管理(compmgmt.msc)
set mst=远程桌面(mstsc)
set cle=磁盘清理(cleanmgr)
set lus=本机用户/组(lusrmgr.msc)
set osk=屏幕键盘(osk)
set info=显示系统信息
set win=检查Windows系统(winver)
set fsm=共享文件夹管理(fsmgmt.msc)
set gpe=组策略(gpedit.msc)
set uti=辅助功能(utilman)
set off=注销(logoff)
```
