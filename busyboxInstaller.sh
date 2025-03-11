#!$SHELL
curdir="$(dirname $(realpath $0))"
if [ ! -f "$curdir/busybox" ]
then
echo "Silahkan simpan busybox ke $curdir"
kill -9 $$
fi

jalursh="$(dirname $(readlink /proc/$$/exe))"
echo "Memasang Busybox pada $jalursh"
if [ ! -f "$jalursh/busybox" ]
then
cp $curdir/busybox $jalursh/busybox
chmod 0755 "$(dirname $(readlink /proc/$$/exe))/busybox"
fi
sleep 5
# echo "#!/system/bin/sh" > $curdir/02-$(basename $0)
#cat $curdir/install.log|busybox awk -v jalur=$jalursh '{print "if [ -f \"" jalur "/" $0 "\" ]\nthen\nbusybox rm " jalur "/" $0 "\nfi"}' >> $curdir/02-$(basename $0)
#echo "busybox --install -s $jalursh" >> $curdir/02-$(basename $0)
#$(readlink /proc/$$/exe) $curdir/02-$(basename $0)
echo "selesai sudah"
