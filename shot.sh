sudo rm -f /dev/video0
sudo modprobe -r v4l2loopback 2>/dev/null
sudo modprobe v4l2loopback exclusive_caps=1 card_label="Virtual Webcam"
nohup scrcpy -s adb-805KPYR1862090-6XnzR5._adb-tls-connect._tcp --v4l2-sink=/dev/video0 --no-audio >/dev/null 2>&1 &
sleep 2
ffmpeg -i /dev/video0 -vf "crop=iw:ih-800:0:400" -frames:v 1 a.png

