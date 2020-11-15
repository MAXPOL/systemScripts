This part for published different scripts for work linux system (centos/ubuntu).
Scripts for testing or informing or speed work and etc.

SETTINGS:

Correct start monitorlAccessOnServerViaTelegram.sh
For work monitorlAccessOnServerViaTelegram.sh need change file /etc/pam.d/system-auth , add in end string: session     optional      pam_exec.so /scripts/logINFOviaTELEGRAM.sh (CentOS 7). END.


