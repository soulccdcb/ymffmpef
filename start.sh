#!/bin/bash
__run() {
  echo -e "123456\n123456" | (passwd)
  /usr/sbin/sshd -D
}

__start() {
  chmod -R 777 /var/www/ffmpeg-4.2.2-amd64-static
  #程序名
  RUN_NAME="$1"
  #jar 位置
  JAVA_OPTS=/var/www/"$1".jar
  source /etc/profile
   #java -jar $JAVA_OPTS   &
   pm2 start  "java -jar $JAVA_OPTS"
  echo "$RUN_NAME started success."
}

# Call all functions
__start $1
__run
