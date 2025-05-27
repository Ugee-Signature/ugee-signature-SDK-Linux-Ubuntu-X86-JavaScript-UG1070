

#uninstall app
sysAppDir=/usr/lib/com.hvug.tabletmonitor
if [ -d "$sysAppDir" ]; then
	str=`rm -rf $sysAppDir`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
fi


#uninstall shortcut
sysDesktopDir=/usr/share/applications
sysAppIconDir=/usr/share/icons

appDesktopName=com.hvug.tabletmonitor.desktop
appIconName=tabletmonitor.png
if [ -f "$sysDesktopDir/$appDesktopName" ]; then
	str=`rm $sysDesktopDir/$appDesktopName`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
fi

if [ -f $sysAppIconDir/$appIconName ]; then
	str=`rm $sysAppIconDir/$appIconName`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
fi

#uninstall hid permission
sysRuleFile=/lib/udev/rules.d/99-ugeeEvent.rules
if [ -f $sysRuleFile ]; then
	str=`rm $sysRuleFile`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
fi

sysRuleFile=/lib/udev/rules.d/99-ugeeEvent.rules
if [ -f $sysRuleFile ]; then
	str=`rm $sysRuleFile`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
fi

sysX11File=/usr/share/X11/xorg.conf.d/tabletmonitor.conf
if [ -f $sysX11File ]; then
	str=`rm $sysX11File`
	if [ "$str" !=  "" ]; then 
		echo "$str";
	fi
fi
echo "Uninstall succeeded."

