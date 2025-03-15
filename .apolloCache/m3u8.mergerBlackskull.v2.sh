#!/system/bin/sh
black="$(dirname $(realpath $0))"
if [ -z "$1" ]
then
busybox echo -e "\nGunakan: bash $0 folder_contents\n"
kill -9 $$
fi

if [ ! -d "$black/ts" ]
then
mkdir $black/ts
fi

ls -a "$1" > $black/1.log
exception="$(cat $black/1.log|grep "[a-z]")"
#busybox sed -i "s|file://||g" $black/ts.log
busybox echo -e "#!$SHELL\ncat $black/1.log|grep -v \"$exception\" > $black/2.log" > $black/exception.sh
$SHELL $black/exception.sh
cat $black/2.log|grep -v "\." > $black/3.log
cat $black/3.log|busybox sort -n > $black/ts.log
busybox echo -e "\nTunggu menggabungkan video agak lama yah\n"
sleep 3
echo "#!$SHELL" > $black/00-$(basename $0)
cat $black/ts.log|busybox awk -v curent=$black/$1 '{print "nomor" NR+0 "=\"" NR+0 "\"\nstring" NR+0 "=\"" curent "/" $0 "\"\nfile" NR+0 "=\"\$(busybox printf \x27%08d.%s\\n\x27 \"\$nomor" NR+0 "\" \"ts\")\"\nmv \"\$string" NR+0 "\" \"\$(dirname \$(realpath \$0))/ts/\$file" NR+0 "\"\n##"}' >> $black/00-$(basename $0)
$SHELL $black/00-$(basename $0)
#workfold="$(cat $black/ts.log|busybox head -n 1)"
echo "Memulai menggabungkan..."
busybox echo -e "#!$SHELL\ncurdur=\"\$(dirname \$(realpath \$0))\"\nbusybox ls \$curdur/ts/*.ts > \$curdur/allts.log\necho \"Running \$(basename \$0)....\"\nblackskullAuVid ()\n{\necho \"M3U8 to mkv\"\n}\nblackskullAuVid\nsleep 4\ncat \$curdur/allts.log|busybox awk '{print \"file \\\x27\" \$0 \"\\\x27\"}' > \$curdur/myFile.txt\nffmpeg -f concat -safe 0 -i \$curdur/myFile.txt -c copy \$curdur/$1.mkv\nsleep 2\nrm \$curdur/ts/*.ts" > $black/01-$(basename $0)
$SHELL $black/01-$(basename $0)
sleep 3
