# vim: set ts=4 sw=4 et:
#!/bin/sh

. /etc/runit/functions

msg "Initializing swap..."
swapon -a || emergency_shell
