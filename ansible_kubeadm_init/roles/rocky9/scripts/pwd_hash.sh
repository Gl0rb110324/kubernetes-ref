echo "Set login.defs (effect with new user)"
upgrade_path=/etc/login.defs
for i in \
"PASS_MAX_DAYS 365" \
"PASS_MIN_DAYS 7" \
"PASS_WARN_AGE 7" \
"SHA_CRYPT_MAX_ROUNDS 5000" \
; do
  [[ `egrep "^${i}" ${upgrade_path}` ]] && continue
  option=${i%% *}
  grep -q "^${option}" ${upgrade_path} && sed -i "s/^${option}.*/$i/g" ${upgrade_path} || echo "$i" >> ${upgrade_path}
done