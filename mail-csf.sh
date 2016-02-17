#! /bin/bash
sed -i 's/TESTING = "1"/TESTING = "0"/g' /etc/csf/csf.conf
sed -i 's/RESTRICT_SYSLOG = "0"/RESTRICT_SYSLOG = "3"/g' /etc/csf/csf.conf
sed -i 's/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995,2077,2078,2079,2080,2082,2083,2086,2087,2095,2096"/TCP_IN = "25,26,80,443,465,587,993,995,2083,2087,2095,2096,2222,24441"/g' /etc/csf/csf.conf
sed -i 's/TCP_OUT = "20,21,22,25,37,43,53,80,110,113,443,587,873,993,995,2086,2087,2089,2703"/TCP_OUT = "25,80,443,465,587,2073,2089,24441"/g' /etc/csf/csf.conf
sed -i 's/UDP_IN = "20,21,53"/UDP_IN = "465,587,6277,24441"/g' /etc/csf/csf.conf
sed -i 's/UDP_OUT = "20,21,53,113,123,873,6277,24441"/UDP_OUT = "465,587,783,6277,24441"/g' /etc/csf/csf.conf
sed -i 's/IPV6_SPI = "1"/IPV6_SPI = "0"/g' /etc/csf/csf.conf
sed -i 's/SYSLOG_CHECK = "0"/SYSLOG_CHECK = "3600"/g' /etc/csf/csf.conf
sed -i 's/IGNORE_ALLOW = "0"/IGNORE_ALLOW = "1"/g' /etc/csf/csf.conf
sed -i 's/UDPFLOOD = "0"/UDPFLOOD = "1"/g' /etc/csf/csf.conf
sed -i 's/LF_PERMBLOCK_COUNT = "5"/LF_PERMBLOCK_COUNT = "4"/g' /etc/csf/csf.conf
sed -i 's/LF_PERMBLOCK_ALERT = "0"/LF_PERMBLOCK_ALERT = "1"/g' /etc/csf/csf.conf
sed -i 's/LF_NETBLOCK_ALERT = "1"/LF_NETBLOCK_ALERT = "0"/g' /etc/csf/csf.conf
sed -i 's/LF_TRIGGER_PERM = "1"/LF_TRIGGER_PERM = "1800"/g' /etc/csf/csf.conf
sed -i 's/LF_EMAIL_ALERT = "1"/LF_EMAIL_ALERT = "0"/g' /etc/csf/csf.conf
sed -i 's/LF_SSHD = "5"/LF_SSHD = "10"/g' /etc/csf/csf.conf
sed -i 's/LF_SSHD_PERM = "1"/LF_SSHD_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_FTPD_PERM = "1"/LF_FTPD_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_SMTPAUTH = "5"/LF_SMTPAUTH = "20"/g' /etc/csf/csf.conf
sed -i 's/LF_SMTPAUTH_PERM = "1"/LF_SMTPAUTH_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_EXIMSYNTAX_PERM = "1"/LF_EXIMSYNTAX_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_POP3D = "10"/LF_POP3D = "20"/g' /etc/csf/csf.conf
sed -i 's/LF_POP3D_PERM = "1"/LF_POP3D_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_IMAPD = "10"/LF_IMAPD = "20"/g' /etc/csf/csf.conf
sed -i 's/LF_IMAPD_PERM = "1"/LF_IMAPD_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_CPANEL = "5"/LF_CPANEL = "10"/g' /etc/csf/csf.conf
sed -i 's/LF_CPANEL_PERM = "1"/LF_CPANEL_PERM = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_SSH_EMAIL_ALERT = "1"/LF_SSH_EMAIL_ALERT = "0"/g' /etc/csf/csf.conf
sed -i 's/LF_CONSOLE_EMAIL_ALERT = "1"/LF_CONSOLE_EMAIL_ALERT = "0"/g' /etc/csf/csf.conf
sed -i 's/LF_EXPLOIT = "300"/LF_EXPLOIT = "900"/g' /etc/csf/csf.conf
sed -i 's/LF_DIRWATCH = "300"/LF_DIRWATCH = "7200"/g' /etc/csf/csf.conf
sed -i 's/LT_EMAIL_ALERT = "1"/LT_EMAIL_ALERT = "0"/g' /etc/csf/csf.conf
sed -i 's/RT_RELAY_LIMIT = "100"/RT_RELAY_LIMIT = "400"/g' /etc/csf/csf.conf
sed -i 's/PT_LIMIT = "60"/PT_LIMIT = "0"/g' /etc/csf/csf.conf
sed -i 's/AT_ALERT = "2"/AT_ALERT = "0"/g' /etc/csf/csf.conf
csf -r
