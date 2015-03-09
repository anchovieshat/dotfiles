from i3pystatus import Status
from subprocess import call
from threading import Thread
import sys
import time

status = Status(standalone=True)

status.register("clock",
        format="%a. %D %-I:%M %p")

status.register("battery",
                format="{status}/{consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
                alert=True,
                alert_percentage=5,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "=",
                },)


status.register("temp",
		format="{temp:.0f}°C")

status.register("network",
		interface="enp0s25",
                format_up="E: {v4cidr}",
                format_down="")

status.register("network",
                interface="wlp3s0",
                format_up="W: {v4cidr}",
                format_down="")

status.register("pianobar",
                format="{songtitle} -- {songartist}",
                ctlfile="/home/colin/.config/pianobar/ctl",
                songfile="/home/colin/.config/i3/lastsong")

status.register("alsa")

status.run()
