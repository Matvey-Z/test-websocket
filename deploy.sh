#!/bin/bash

/usr/bin/git clone git://github.com/disconnect/apache-websocket.git
cd apache-websocket

### install websocket

if [ $(basename $(pwd)) != "apache-websocket" ];
	then  echo -e "\n#####################################################\n#  Please put this file into  .../apache-websocket/ #\n#####################################################\n" ; exit 0;
fi

/usr/bin/scons
/usr/bin/scons install

echo "LoadModule websocket_draft76_module /usr/lib/apache2/modules/mod_websocket_draft76.so" > /etc/apache2/mods-available/websocket_draft76.load
echo "LoadModule websocket_module   /usr/lib/apache2/modules/mod_websocket.so" > /etc/apache2/mods-available/websocket.load
ln -s ../mods-available/websocket_draft76.load /etc/apache2/mods-enabled/websocket_draft76.load
ln -s ../mods-available/websocket.load /etc/apache2/mods-enabled/websocket.load

### install examples
cd examples
/usr/bin/scons
/usr/bin/scons install


echo "<IfModule mod_websocket.c>
  <Location /echo>
    SetHandler websocket-handler
    WebSocketHandler /usr/lib/apache2/modules/mod_websocket_echo.so echo_init
  </Location>
  <Location /dumb-increment>
    SetHandler websocket-handler
    WebSocketHandler /usr/lib/apache2/modules/mod_websocket_dumb_increment.so dumb_increment_init
  </Location>

</IfModule>

<IfModule mod_websocket_draft76.c>
  <Location /echo>
    SetHandler websocket-handler
    WebSocketHandler /usr/lib/apache2/modules/mod_websocket_echo.so echo_init
    SupportDraft75 On
  </Location>
 <Location /dumb-increment>
    SetHandler websocket-handler
    WebSocketHandler /usr/lib/apache2/modules/mod_websocket_dumb_increment.so dumb_increment_init
    SupportDraft75 On
  </Location>

</IfModule> " >> /etc/apache2/conf-enabled/ws2.conf

cp client.html /var/www/html/
cp increment.html /var/www/html/


