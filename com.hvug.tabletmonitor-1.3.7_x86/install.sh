#! /bin/bash

# cd to current path
dirname=`dirname $0`
tmp="${dirname#?}"
if [ "${dirname%$tmp}" != "/" ]; then
	dirname=$PWD/$dirname
fi
echo $dirname
cd "$dirname"


#Copy rule
sysRuleDir="/lib/udev/rules.d"
sysRuleDir2="/etc/udev/rules.d"
appRuleDir=./App$sysRuleDir
appRuleDir2=./App$sysRuleDir2
ruleName="99-ugeeEvent.rules"

if [ ! -d "/lib/udev/rules.d" ]; then
	mkdir /lib/udev/rules.d
fi

if [ -f $appRuleDir/$ruleName ]; then
	str=`cp $appRuleDir/$ruleName $sysRuleDir/$ruleName`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
else
	echo "Cannot find driver's rules in package"
	exit
fi

if [ -f $appRuleDir2/$ruleName ]; then
	str=`cp $appRuleDir2/$ruleName $sysRuleDir2/$ruleName`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
else
	echo "Cannot find driver's rules in package"
	exit
fi

#install app
sysAppDir="/usr/lib"
appAppDir=./App$sysAppDir/com.hvug.tabletmonitor
exeShell="start.sh"

#echo $sysAppDir
#echo $appAppDir

if [ -d "$appAppDir" ]; then
	str=`cp -rf $appAppDir $sysAppDir`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
else
	echo "Cannot find driver's files in package"
	exit
fi

str=`chmod +0755 $sysAppDir/com.hvug.tabletmonitor/$exeShell`

cp ./App/usr/share/X11/xorg.conf.d/tabletmonitor.conf  /usr/share/X11/xorg.conf.d/

# install shortcut
sysDesktopDir=/usr/share/applications
sysAppIconDir=/usr/share/icons/

appDesktopDir=./App$sysDesktopDir
appAppIconDir=./App$sysAppIconDir

appDesktopName=com.hvug.tabletmonitor.desktop
appIconName=tabletmonitor.png


if [ -f $appDesktopDir/$appDesktopName ]; then
	str=`cp $appDesktopDir/$appDesktopName $sysDesktopDir/$appDesktopName`
	chmod +0444 $sysDesktopDir/$appDesktopName
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
else
	echo "Cannot find driver's shortcut in package"
	exit
fi

if [ -f $appAppIconDir/$appIconName ]; then
	str=`cp $appAppIconDir/$appIconName $sysAppIconDir/$appIconName`
	chmod +0555 $sysAppIconDir/$appIconName
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
else
	echo "Cannot find driver's icon in package"
	exit
fi

chmod +0555 /usr/lib/com.hvug.tabletmonitor/start.sh

echo "Installation successful!"
echo "If you are installing for the first time, please use it after restart."
