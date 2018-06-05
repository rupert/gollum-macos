LAUNCH_AGENTS = ${HOME}/Library/LaunchAgents

install:
	cp com.rupertb.gollum.plist ${LAUNCH_AGENTS}
	cp com.rupertb.gollum.sync.plist ${LAUNCH_AGENTS}
	launchctl load ${LAUNCH_AGENTS}/com.rupertb.gollum.plist
	launchctl load ${LAUNCH_AGENTS}/com.rupertb.gollum.sync.plist

uninstall:
	launchctl unload ${LAUNCH_AGENTS}/com.rupertb.gollum.plist
	launchctl unload ${LAUNCH_AGENTS}/com.rupertb.gollum.sync.plist
	rm -f ${LAUNCH_AGENTS}/com.rupertb.gollum.plist
	rm -f ${LAUNCH_AGENTS}/com.rupertb.gollum.sync.plist
