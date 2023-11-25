#!/bin/bash
echo "$(tput setaf 2)
   .~~.   .~~.
  '. \ ' ' / .'$(tput setaf 1)
   .~ .~~~..~.
  : .~.'~'.~. :
 ~ (   ) (   ) ~
( : '~'.~.'~' : )
 ~ .~ (   ) ~. ~
  (  : '~' :  ) $(tput sgr0)Raspberry Pi$(tput setaf 1)
   '~ .~~~. ~'
       '~'
$(tput sgr0)"



echo "$(tput setaf 2)
       .~~.   .~~.
      '. \ ' ' / .'$(tput setaf 1)
       .~ .~~~..~.    $(tput sgr0)                   _                          _ $(tput setaf 1)
      : .~.'~'.~. :   $(tput sgr0)   ___ ___ ___ ___| |_ ___ ___ ___ _ _    ___|_|$(tput setaf 1)
     ~ (   ) (   ) ~  $(tput sgr0)  |  _| .'|_ -| . | . | -_|  _|  _| | |  | . | |$(tput setaf 1)
    ( : '~'.~.'~' : ) $(tput sgr0)  |_| |__,|___|  _|___|___|_| |_| |_  |  |  _|_|$(tput setaf 1)
     ~ .~ (   ) ~. ~  $(tput sgr0)              |_|                 |___|  |_|    $(tput setaf 1)
      (  : '~' :  )
       '~ .~~~. ~'
           '~'
$(tput sgr0)"


ip=`ip addr show scope global | grep inet | cut -d' ' -f6 | cut -d/ -f1`
up=`uptime | awk -F"up " '{print $2}' | awk -F"," '{print $1}'`
used=`df -h | grep 'dev/root' | awk '{print $3}'`
avail=`df -h | grep 'dev/root' | awk '{print $4}'`

echo "\033[0;32m
    .~~.   .~~.
   '. \ ' ' / .'\033[0;31m
    .~ .~~~..~.    \033[0;37m                   _                          _ \033[0;31m
   : .~.'~'.~. :   \033[0;37m   ___ ___ ___ ___| |_ ___ ___ ___ _ _    ___|_|\033[0;31m
  ~ (   ) (   ) ~  \033[0;37m  |  _| .'|_ -| . | . | -_|  _|  _| | |  | . | |\033[0;31m
 ( : '~'.~.'~' : ) \033[0;37m  |_| |__,|___|  _|___|___|_| |_| |_  |  |  _|_|\033[0;31m
  ~ .~ (   ) ~. ~  \033[0;37m              |_|                 |___|  |_|    \033[0;31m
   (  : '~' :  )
    '~ .~~~. ~'
        '~'

    \033[0;34m`hostname -f`
    \033[1;30m$ip
    \033[1;34mUsed | Free
    $used | $avail
    \033[1;30mUp. : $up
    \033[0;30m" > $1
