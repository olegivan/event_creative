#!/bin/bash
git pull origin master
if ! [ -e '/etc/uwsgi/apps-enabled/event_creative.ini' ]; then
	cp -f conf/event_creative.ini /etc/uwsgi/apps-available/
	ln -sf /etc/uwsgi/apps-available/event_creative.ini /etc/uwsgi/apps-enabled/event_creative.ini
fi
uwsgi --ini /etc/uwsgi/apps-enabled/event_creative.ini
service nginx restart