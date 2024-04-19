#!/usr/bin/env bash 

echo ""
echo "You are reviewing $1"
echo ""


exec 3<"$1"
while IFS= read -r -u 3 line || [[ -n "$line" ]]; do
	#read -p "> $line"
	#test=$line
	header_prefix="##"
	case $line in
		\#*)
			read -p "> $line"
			;;

		\**)
			read -p ">> $line"
			;;
		"    *"*)
			read -p ">>> $line"
			;;
		1*)
			read -p "># $line"
			;;
		"    1"*)
			read -p ">># $line"
			;;
		-*)
			read -p "---"
			;;
		''*)
			read -p "~~~"
			;;
		*)
			echo "*Error Case*: $line"
			;;
	esac
done 

# TO DOs:
# Think about other markdown formatting like block quotes and such 
# IMPORTANT see if you can add a way to read from specific sections of the file such as # Review would just review the header section that is called review 
# Maybe list the headers if possible (maybe another case statment) 
