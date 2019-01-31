#--- Disable profile
a2dissite 000-mana-toolkit; a2ensite 000-default
#--- Setup alias
file=~/.bash_aliases
grep -q '^## mana-toolkit' "${file}" 2>/dev/null \
  || (echo '## mana-toolkit\nalias mana-toolkit-start="a2ensite 000-mana-toolkit;a2dissite 000-default; systemctl restart apache2"' >> "${file}" \
    && echo 'alias mana-toolkit-stop="a2dissite 000-mana-toolkit; a2ensite 000-default; systemctl restart apache2"\n' >> "${file}" )
#--- Apply new alias
source "${file}" || source ~/.zshrc
