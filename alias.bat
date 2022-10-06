@echo off
echo alittlemc
doskey ls=dir /b $*
doskey ll=dir /ONE $*
doskey cat=type $*
doskey rm=del $*
doskey mv=move $*
doskey cd=cd /d $*
doskey pwd=cd
doskey mkdir=md $*
doskey traceroute=tracert $*
doskey tracepath=pathping $*
doskey ifconfig=ipconfig $*
::doskey findstr=grep $*
doskey shell=PowerShell $*
doskey history=doskey  /history
doskey alias=doskey /macros
::git相关
doskey g=git
doskey ga=git add
doskey gaa=git add --all
doskey gc=git commit
doskey gr=git remove
doskey gup=git pull
echo 别名完成载入，键入alias查看
