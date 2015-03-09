xrdb ~/.Xresources &
xmodmap ~/.xmodmaprc &
nitrogen --restore &
redshift -l 44.7:75 &
compton --backend glx -b &
exec i3 -V >> /tmp/i3log 2>&1
