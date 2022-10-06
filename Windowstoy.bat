@echo off
echo %~0 by alittlemc;
echo version 1.1;updatetime 2022-10-06 午
echo hostname %COMPUTERNAME%;user %USERNAME%
:0
@REM if %info%==y (
echo ----------====start====----------
echo    ID    NOTES
echo     0      显示提示
echo     00     退出
echo     1      切换到administrator执行
echo      a1    切换到指定用户执行
echo     2      重置网络设置
echo     3      修复输入法
echo     4      联网同步系统时间
::echo      4a    手动修改系统时间
echo     5      批量安装%~dp0目录下全部*.msu,*.msi,*.exe可执行文件
echo     6      重命计算机名字
echo     7      新电脑设置域
::echo      7a    老电脑修改域
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

echo         =其他=
echo     01     %dev%
echo     02     %reg%
echo     03     %dco%
echo     04     %com%
echo     05     %mst%
echo     06     %cle%
echo     07     %lus%
echo     08     %osk%
echo     09     %win%
echo     10     %fsm%
echo     11     %gpe%
echo     12     %uti%
echo     0a     %off%
echo     0b     %info%
::echo systemreset 重置Windows
::echo systemreset-cleanpc 更新并重置Windows
goto start

:start0
::echo 可以输入cmd命令也可以输入功能ID
set /p sr=%~dp0#
@REM 数字开头就是功能id,否则是cmd命令
echo %sr:~,1%|findstr /i "[a-z]" >nul 2>nul && goto docmd || goto dobat
pause>nul

:dobat
echo dobat
goto %sr% 2>nul||echo 未匹配到的ID&%~0%&pause>nul
pause>nul

:1
    echo get administrator
    net user administrator /active:yes
    echo administrator
goto start

:1a
    set /p user=输入用户名:
    echo change %user%
    net user  %user% /active:yes
    echo %user%
goto start

:00
    exit
goto start

:2
    echo 重置网络设置(netsh winsock reset)
    set y=<nul
    set /p y=确认重置网络?(y/n)
    if %y%==y (netsh winsock reset)
    set y=<nul
goto start

:3
    echo 修复输入法(ctfmon)
    ctfmon
goto start

:4
   echo 联网同步时间
   net time \\time.windows.com /set /y
goto start

:4a
   set y=<nul
   echo 当前时间%date% %time%
   set /p y=输入系统时间(如:2022-10-06)输入n取消
   if %y%==n (goto start) else (date %y%)
   echo %date% %time% 
   set y=<nul
goto start

:5
    setlocal enabledelayedexpansion
    echo 批量安装
    set y=<nul
    set /p "y=安装当前目录中可执行程序?(y/n)"
    for %%f in (*.msu,*.msi,*.exe) do ( start /wait %%f )
::子目录也安装/R 默认安装/s        
    set y=<nul
goto start

:6
    :rename
    set y=<nul
    echo 当前的主机名:%COMPUTERNAME%
    set /p id=请输入新主机名:
    set /p y=确认将%COMPUTERNAME%修改为%id%?(y/n/r)
    if %y%==r (goto rename)
    if %y%==y (netdom.exe renamecomputer %COMPUTERNAME% /newname: %id%)
    echo 当前的主机名:%COMPUTERNAME%
goto start

:7
    :redomain
    set /p domain=请输入AD域名:
    set /p y=确认将域更新为%domain%?(y/n/r)
    if %y%==r (goto redomain)
    if %y%==y (netdom join %COMPUTERNAME% /DOMAIN:%domain%)
::/UserD:%user%（用户帐号） /PasswordD:%passwd%（用户密码）
goto start

:0b
    hostname
    wmic baseboard list brief
    wmic bios get serialnumber
    ::wmic nic get macaddress 

    wmic cpu get caption, name, deviceid, numberofcores, maxclockspeed, status

    wmic memorychip get banklabel,devicelocator,capacity,speed
    wmic computersystem get totalphysicalmemory

    wmic computersystem get caption,dnshostname,model,systemtype

    wmic nic list brief

    wmic diskdrive get model,size
    wmic logicaldisk get name,size
    ::wmic partition get name,size,type

    wmic ntdomain get caption,dnsforestname,domaincontrolleraddress,domaincontrollername,status
goto start

::其他

:01
echo %dev%
devmgmt.msc
goto start

:02
echo %reg%
regedit
goto start

:03
echo %dco%
dcomcnfg
goto start

:04
echo %com%
compmgmt.msc
goto start

:05
echo %mst%
mstsc
goto start

:06
echo %cle%
fsmgmt.msc
goto start

:07
echo %lus%
lusrmgr.msc
goto start

:08
echo %osk%
osk
goto start

:09
echo %win%
winver
goto start

:10
echo %fsm%
fsmgmt.msc
goto start

:11
echo %gpe%
gpedit.msc
goto start

:12
echo %uti%
utilman
goto start

:0a
    set y=<nul
    set /p y=确认注销?(y/n):
    if %y%==y (logoff)
    set y=<nul
goto start

:start
echo -----------====end====-----------
goto start0

:docmd
echo CMD 命令
%sr%
@REM TIMEOUT /T 10
goto start

pause>nul
