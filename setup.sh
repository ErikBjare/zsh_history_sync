
# Should be homedir, can be something else in testing
ZSH_HISTORY_PATH=~
ZSH_HISTORY=$ZSH_HISTORY_PATH/.zsh_history

# TODO: Figure out dynamically depending on script location
SYNCED_FOLDER_PATH=~/synced_history
SYNCED_ZSH_HISTORY=$SYNCED_FOLDER_PATH/.zsh_history_$(hostname)

# NOTE: Don't fuckup twice!
# ...apparently I already did, better fix this. Thank fsm for backintime.
cp -bLf $ZSH_HISTORY_PATH/.zsh_history ${SYNCED_ZSH_HISTORY}.bak

touch $SYNCED_ZSH_HISTORY
rm $ZSH_HISTORY
ln -s $SYNCED_ZSH_HISTORY $ZSH_HISTORY
chmod 600 .zsh_history*
