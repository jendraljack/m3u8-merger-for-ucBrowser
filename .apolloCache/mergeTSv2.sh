#!$SHELL
curdur="$(dirname $(realpath $0))"
#workfold="$(cat $curdur/allts.log|busybox head -n 1)"
#tsfolder="$(dirname $workfold)"
busybox ls $curdur/ts/*.ts > $curdur/allts.log

echo "Running $(basename $0)...."
blackskullAuVid ()
{
echo "M3U8 to mkv"
}
blackskullAuVid
sleep 4
cat $curdur/allts.log|busybox awk '{print "file \x27" $0 "\x27"}' > $curdur/myFile.txt
ffmpeg -f concat -safe 0 -i $curdur/myFile.txt -c copy $curdur/output-$(date +%s).mkv
sleep 2
rm $curdur/ts/*.ts
