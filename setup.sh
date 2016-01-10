
# Should be homedir, can be something else in testing
ZSH_HISTORY_PATH=~
ZSH_HISTORY=$ZSH_HISTORY_PATH/.zsh_history

# TODO: Figure out dynamically depending on script location
SYNCED_FOLDER_PATH=~/synced_history
SYNCED_ZSH_HISTORY_FILENAME=.zsh_history_$(hostname)
SYNCED_ZSH_HISTORY=$SYNCED_FOLDER_PATH/$SYNCED_ZSH_HISTORY_FILENAME

# Do a backup, just in case...
cp --backup=numbered -L $ZSH_HISTORY ${SYNCED_FOLDER_PATH}/backups/${SYNCED_ZSH_HISTORY_FILENAME}.bak

# history now backed up, now copy it to the synced folder
# Will be the same file on the second run (`cp` will complain about it), which is okay
cp -fL $ZSH_HISTORY $SYNCED_ZSH_HISTORY
rm $ZSH_HISTORY

ln -s $SYNCED_ZSH_HISTORY $ZSH_HISTORY
chmod 600 .zsh_history*
