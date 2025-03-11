#!$SHELL
curdur="$(dirname $(realpath $0))"
#workfold="$(cat $curdur/allts.log|busybox head -n 1)"
#tsfolder="$(dirname $workfold)"
busybox ls $curdur/ts/*.mp4 > $curdur/allts.log

echo "Running $(basename $0)...."
blackskullAuVid ()
{
echo "mp4 to mkv"
}
blackskullAuVid
sleep 4
cat $curdur/allts.log|busybox awk '{print "file \x27" $0 "\x27"}' > $curdur/myFile.txt
ffmpeg -f concat -safe 0 -i $curdur/myFile.txt -c copy $curdur/output-$(date +%s).mkv
sleep 2
rm $curdur/ts/*.mp4
busybox echo -e "\nMerge mp4 selesai\n#### Author: blackskull ####\n"
