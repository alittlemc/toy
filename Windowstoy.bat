@echo off
echo %~0 by alittlemc;version 1.0;updatetime 2022-10-04 ��
echo hostname %COMPUTERNAME%;user %USERNAME%
:start0
echo ----------====start====----------
echo		ID	NOTES
echo 	00	�˳�
echo 	0	�л���administratorִ��
echo 	 0a	�л���ָ���û�ִ��
echo 	1	������������
echo 	2	�޸����뷨
echo 	3	��ջ���վ
echo 	4	������װ%~dp0Ŀ¼��ȫ��*.msu,*.msi,*.exe��ִ���ļ�
echo 	5	�������������
echo 	6	�µ���������
echo 	 6a	�ϵ����޸���
echo.
set dev=�豸������(devmgmt.msc)
set reg=ע���(regedit)
set dco=ϵͳ���(dcomcnfg)
set com=���������(compmgmt.msc)
set mst=Զ������(mstsc)
set cle=��������(cleanmgr)
set lus=�����û�/��(lusrmgr.msc)
set osk=��Ļ����(osk)
set info=��ʾϵͳ��Ϣ
set win=���Windowsϵͳ(winver)
set fsm=�����ļ��й���(fsmgmt.msc)
set gpe=�����(gpedit.msc)
set uti=��������(utilman)
set off=ע��(logoff)

echo 		=����=
echo 	01	%dev%
echo 	02	%reg%
echo 	03	%dco%
echo 	04	%com%
echo 	05	%mst%
echo 	06	%cle%
echo 	07	%lus%
echo 	08	%osk%
echo 	09	%win%
echo 	10	%fsm%
echo 	11	%gpe%
echo 	12	%uti%
echo 	off	%off%
echo 	info	%info%
::echo systemreset ����Windows
::echo systemreset-cleanpc ���²�����Windows
echo.

set /p sr=��������Ҫ�Ĺ���ID:
goto %sr% 2>nul||echo δƥ�䵽��ID&%~0%&pause>nul

:0
	echo get administrator
	net user administrator /active:yes
	echo administrator
goto start

:0a
	set /p user=�����û���:
	echo change %user%
	net user  %user% /active:yes
	echo %user%
goto start

:00
	exit
goto start

:1
	echo ������������(netsh winsock reset)
	set y=<nul
	set /p y=ȷ����������?(y/n)
	if %y%==y (netsh winsock reset)
	set y=<nul
goto start

:2
	echo �޸����뷨(ctfmon)
	ctfmon
goto start

:3
	echo ��ջ���վ
	set y=<nul
	set /p y=ȷ����ջ���վ?(y/n):
if %y%==y (
::���Win7/Win8����վ
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
if exist %%a: (
del /f /s /q "%%a:$recycle.bin*.*" >nul 2>nul
)
)
::���XP����վ
del /f /s /q "%systemdrive%
ecycled*.*" >nul 2>nul
echo ��ջ���վ��ɣ�
) else (echo no)
set y=<nul
goto start

:4
	setlocal enabledelayedexpansion
	echo ������װ
	set y=<nul
	set /p "y=��װ��ǰĿ¼�п�ִ�г���?(y/n)"
	for %%f in (*.msu,*.msi,*.exe) do ( start /wait %%f )
::��Ŀ¼Ҳ��װ/R Ĭ�ϰ�װ/s		
	set y=<nul
goto start

:5
	:rename
	set y=<nul
	echo ��ǰ��������:%COMPUTERNAME%
	set /p id=��������������:
	set /p y=ȷ�Ͻ�%COMPUTERNAME%�޸�Ϊ%id%?(y/n/r)
	if %y%==r (goto rename)
	if %y%==y (netdom.exe renamecomputer %COMPUTERNAME% /newname: %id%)
	echo ��ǰ��������:%COMPUTERNAME%
goto start

:6
	:redomain
	set /p domain=������AD����:
	set /p y=ȷ�Ͻ������Ϊ%domain%?(y/n/r)
	if %y%==r (goto redomain)
	if %y%==y (netdom join %COMPUTERNAME% /DOMAIN:%domain%)
::/UserD:%user%���û��ʺţ� /PasswordD:%passwd%���û����룩

goto start

:info
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
	:wmic partition get name,size,type
	
	wmic ntdomain get caption,dnsforestname,domaincontrolleraddress,domaincontrollername,status
goto start

::����

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

:off
	set y=<nul
	set /p y=ȷ��ע��?(y/n):
	if %y%==y (logoff)
	set y=<nul
goto start

:start
echo -----------====end====-----------
echo.
goto start0
pause>nul