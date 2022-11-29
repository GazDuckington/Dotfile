#!/usr/bin/env python
import sys
from subprocess import check_output, run, Popen, PIPE

cmds = {
    " lock": "$HOME/bin/i3lock-color.sh",
    " logout" : "dkcmd exit",
    "⏾ suspend": "systemctl suspend",
    "⏾ scheduled suspend (30min)": "sleep 1800 && systemctl suspend",
    " reboot": "systemctl reboot",
    " shutdown": "systemctl poweroff",
}

cmd_keys = "\n".join(list(cmds.keys()))
options1 = Popen(['echo', '-e', cmd_keys], stdout=PIPE)
options2 = check_output(["rofi", "-dmenu", "-i", "-no-show-icons", "-p", " ⏼ power "], stdin=options1.stdout)

output = options2.decode(sys.stdout.encoding).strip()
run(cmds[output], shell=True)
