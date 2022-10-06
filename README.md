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
* v1.0->2022年10月4日15:33:18
  * 基础的完成大致框架的功能
    * 重置网络
    * 修复输入法
    * 清空回收站
    * 批量安装可执行文件
    * 修改计算机名
    * 修改AD域
    * administrator算法运行
  * **后面打算更新终端颜色的美化、拓展更多的功能*
* v1.1->2022年10月6日16:23:03
  * 移除
    * 清理回收站的功能，怕出现意外（感谢大佬[uid0913](https://home.cnblogs.com/u/810453/)的提醒）
  * 新增
    * 同步时间的功能
  * **现在可以在批处理的终端上也输入cmd命令**

## 目前的功能
现在还是有蛮多的bug，欢迎各位大佬一起来交流！
``` bash
E:\Project\bat\WindowsToy.bat by alittlemc;
version 1.1;updatetime 2022-10-06 午
hostname ALITTLEMC;user alittlemc
----------====start====----------
   ID    NOTES
    0      显示提示
    00     退出
    1      切换到administrator执行
     a1    切换到指定用户执行
    2      重置网络设置
    3      修复输入法
    4      联网同步系统时间
    5      批量安装E:\Project\bat\目录下全部*.msu,*.msi,*.exe可执行文件
    6      重命计算机名字
    7      新电脑设置域

        =其他=
    01     设备管理器(devmgmt.msc)
    02     注册表(regedit)
    03     系统组件(dcomcnfg)
    04     计算机管理(compmgmt.msc)
    05     远程桌面(mstsc)
    06     磁盘清理(cleanmgr)
    07     本机用户/组(lusrmgr.msc)
    08     屏幕键盘(osk)
    09     检查Windows系统(winver)
    10     共享文件夹管理(fsmgmt.msc)
    11     组策略(gpedit.msc)
    12     辅助功能(utilman)
    0a     注销(logoff)
    0b     显示系统信息
-----------====end====-----------
```
