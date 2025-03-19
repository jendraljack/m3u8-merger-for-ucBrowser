#!$SHELL
rid="$(dirname $(realpath $0))"
if [ -z "$1" ]
then
busybox echo -e "Salah\nGunakan $0 berkas m3u\n"
kill -9 $$
fi

cat $@|grep -v "#" > $rid/tes.log
cat $rid/tes.log|busybox tr '\x0d\x0a' '\x22\x0a' > $rid/tes2.log
cat $rid/tes2.log|busybox awk -v path=$rid '{print "curl --output " path "/\$(date +%s) " "\"" $0 "\nsleep 1"}' > $rid/00-$(basename $0)
$SHELL $rid/00-$(basename $0)
