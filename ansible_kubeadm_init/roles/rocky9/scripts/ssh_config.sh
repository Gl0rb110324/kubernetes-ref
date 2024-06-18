#[SSH-7408]
echo "Configuring SSH"
upgrade_path=/etc/ssh/sshd_config
cp ${upgrade_path} $AUDITDIR/sshd_config_$TIME.bak
# "PermitRootLogin no" \
# "IgnoreRhosts yes" \
# "HostbasedAuthentication no" \
# "PermitUserEnvironment no" \
# "Compression no" \

for i in \
"LogLevel VERBOSE" \
"X11Forwarding no" \
"MaxAuthTries 3" \
"PermitEmptyPasswords no" \
"ClientAliveInterval 300" \
"ClientAliveCountMax 2" \
"AllowTcpForwarding no" \
"AllowAgentForwarding no" \
"TCPKeepAlive no" \
"MaxSessions 2" \
; do
  [[ `egrep -q "^${i}" ${upgrade_path}` ]] && continue #search for line containing the contents as above
  option=${i%% *} #%% trims everything to just the first word
  grep -q ${option} ${upgrade_path} && sed -i "s/.*${option}.*/$i/g" ${upgrade_path} || echo "$i" >> ${upgrade_path}
  #"s/.*${option}.*/$i/g": This is the substitution command (indicated by s/. with ). It uses a regular expression to match any line in the file that contains ${option} and replaces the entire line with the value of ${i}. Here's what each part of the regular expression means

done