#!/usr/bin/env bash 

echo ""
echo "You are reviewing $1"
echo ""


exec 3<"$1"
while IFS='' read -r -u 3 line || [[ -n "$line" ]]; do
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
			read -p ">> $line"
			;;
		"    1"*)
			read -p ">>> $line"
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

# Also look at when you might want to clear (are you really wanting to clear tho)
# Might be important to format and Make it easier to read so you can view the full file at the end 
# TO DOs:
# go over the formatting and make it nice
# Think about clears but might not be needed:
