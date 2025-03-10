#!/bin/sh

help(){
	echo "Usage: vr [FOLDER]"
	echo ""
	echo "Open a list of filenames from FOLDER in vim for mass renaming."
	echo "When FOLDER is not given the current directory is used."
	echo ""
	echo "Upon exiting vim the files will be renamed as needed."
	echo "Files can also be removed by replacing the filename with and empty line."
	echo "Exit vim without saving or save an empty file to cancel."
	echo ""
	echo "WARNING: DO NOT reorder the filenames or remove lines, as the algorithm depends"
	echo "on the line number to identify the original file. To aid the user the 'dd'"
	echo "command is remapped to clear the current line, which results in the file being"
	echo "deleted."
}

if [ "$1" = "--help" ] || [ "$1" = '-h' ]
then
	help
	exit
fi

# If FOLDER is given first navigate to this filder
if [ -n "$1" ]
then
	cd "$1" || return
fi

# Temporary files
ORIG_NAMES='/tmp/orig_names'
NEW_NAMES='/tmp/new_names'
COMMANDS='/tmp/rename_commands'
touch "$COMMANDS"
chmod 700 "$COMMANDS"	# For security, so noone can make us execute arbitrary commands

# Create a list of filenames
\ls > "$ORIG_NAMES"

cp "$ORIG_NAMES" "$NEW_NAMES"

# Allow the user to edit the filenames
nvim +1 -c "nnoremap dd ^D" "$NEW_NAMES"

# Check if the edited file has the correct number of lines
if [ "$(wc -l < $ORIG_NAMES)" != "$(wc -l < "$NEW_NAMES")" ]
then
	echo "Number of filenames changed, to delete a file leave an empty line."
	echo "Quiting now."
	exit
fi

# Quote all filenames
sed -i 's/^/"/' "$ORIG_NAMES"
sed -i 's/$/"/' "$ORIG_NAMES"
sed -i 's/^/"/' "$NEW_NAMES"
sed -i 's/$/"/' "$NEW_NAMES"

# Create the commands to rename or delete files
paste -d' ' "$ORIG_NAMES" "$NEW_NAMES" | sed 's/^/mv /' | grep -E -v 'mv (".*") \1' | sed 's/mv \("[^"]*"\) "\s*"*$/rm -rf \1/' > "$COMMANDS"

# Exectute the commands
bash -x "$COMMANDS"

# Remove temporary files
rm -f "$COMMANDS" "$ORIG_NAMES" "$NEW_NAMES"
