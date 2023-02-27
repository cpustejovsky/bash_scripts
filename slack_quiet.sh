sudo -i
cd /usr/lib/slack/resources/app.asar.unpacked/src/static || exit
mv slack-taskbar-highlight.png slack-taskbar-highlight-backup.png
mv slack-taskbar-unread.png slack-taskbar-unread-backup.png
cp slack-taskbar-rest.png slack-taskbar-highlight.png
cp slack-taskbar-rest.png slack-taskbar-unread.png
