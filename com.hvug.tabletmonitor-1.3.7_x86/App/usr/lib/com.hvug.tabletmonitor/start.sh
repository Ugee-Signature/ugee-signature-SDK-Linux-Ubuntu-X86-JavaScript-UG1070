#! /bin/bash
#判断CPU架构
cpu_structure=`arch`

amd64="x86_64"
arm64="aarch64"
mips64="mips64"
loongson64="loongarch64"


if [ "$cpu_structure" = "$amd64" ];then   
    cpu_structure=$amd64
elif [ "$cpu_structure" = "$arm64" ]; then
    cpu_structure=$arm64
elif [ "$cpu_structure" = "$mips64" ]; then
    cpu_structure=$mips64
elif [ "$cpu_structure" = "$loongson64" ]; then
    cpu_structure=$loongson64
fi

#执行操作
appName="TabletPanel_$cpu_structure"
appPath="/usr/lib/com.hvug.tabletmonitor"
chmod +x "$appPath/$appName"
$appPath/$appName
