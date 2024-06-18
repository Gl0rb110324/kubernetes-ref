echo "change Banner"
sed -i "s/\#Banner none/Banner \/etc\/issue\.net/" /etc/ssh/sshd_config #replace Banner none with Banner /etc/issue/.net. bashslashes escape the .
cat > /etc/issue.net << 'EOF'
/------------------------------------------------------------------------\
|                *** WARNING - NOTICE TO USERS ***                       |
|       Attention, by continuing to connect to this system,              |
|       you consent to the owner storing a log of all activity.          |
|       Unauthorized access is prohibited.                               |
\------------------------------------------------------------------------/
EOF
cat > /etc/motd << 'EOF'
LOCAL Group. Authorized Use Only
EOF
rm -rf /etc/issue
ln -s /etc/issue.net /etc/issue