#!/system/bin/sh
black="$(dirname $(realpath $0))"
if [ -z "$1" ]
then
busybox echo -e "\nGunakan: bash $0 berkas.m3u8\n"
kill -9 $$
fi

if [ ! -z "$2" ]
then
busybox echo -e "\nNama berkas m3u8 berisi spasi\nHarus diApit nama berkas dengan tanda kutip (\").\nContoh: bash $0 \"nama berkas.m3u8\"\n"
kill -9 $$
fi

if [ ! -d "$black/ts" ]
then
mkdir $black/ts
fi

if [ ! -f "$black/$(basename $1)" ]
then
cat "$(dirname $1)/$(basename $1)"|grep -v "#" > $black/ts.log
fi

if [ -f "$black/$(basename $1)" ]
then
cat "$black/$(basename $1)"|grep -v "#" > $black/ts.log
fi

busybox sed -i "s|file://||g" $black/ts.log
busybox echo -e "\nTunggu menggabungkan video agak lama yah\n"
sleep 3
echo "#!$(readlink /proc/$$/exe)" > $black/00-$(basename $0)
cat $black/ts.log|busybox awk -v curent=$black '{print "nomor" NR+0 "=\"" NR+0 "\"\nstring" NR+0 "=\"" $0 "\"\nfile" NR+0 "=\"\$(busybox printf \x27%08d.%s\\n\x27 \"\$nomor" NR+0 "\" \"ts\")\"\nmv \"\$string" NR+0 "\" \"" curent "/ts/\$file" NR+0 "\"\n##"}' >> $black/00-$(basename $0)
$(readlink /proc/$$/exe) $black/00-$(basename $0)
#workfold="$(cat $black/ts.log|busybox head -n 1)"
echo "Memulai menggabungkan..."
busybox echo -e "#!$(readlink /proc/$$/exe)\ncurdur=\"\$(dirname \$(realpath \$0))\"\nbusybox ls \$curdur/ts/*.ts > \$curdur/allts.log\necho \"Running \$(basename \$0)....\"\nblackskullAuVid ()\n{\necho \"M3U8 to mkv\"\n}\nblackskullAuVid\nsleep 4\ncat \$curdur/allts.log|busybox awk '{print \"file \\\x27\" \$0 \"\\\x27\"}' > \$curdur/myFile.txt\nffmpeg -f concat -safe 0 -i \$curdur/myFile.txt -c copy \"\$curdur/$(basename $1).mkv\"\nsleep 2\nrm \$curdur/ts/*.ts" > $black/01-$(basename $0)
sleep 1
$(readlink /proc/$$/exe) $black/01-$(basename $0)
sleep 3
