rm -r generated
mkdir generated
cd generated
adb shell "ls sdcard/pictures/Office\ Lens/$1*.jpg" | tr -d '\r' | xargs -d '\n' -n1 adb pull
convert *.jpg temp.pdf
cd ../
pdfjam --paper a4paper exam_cover.pdf generated/temp.pdf -o timed_cw.pdf --no-tidy
echo -n "/home/daniel/Downloads/timed_cw.pdf" | xclip -sel clip
echo "Copied to clipboard! "