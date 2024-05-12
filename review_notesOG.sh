#!/usr/bin/env bash 

echo ""
echo "You are reviewing $1"
echo ""


exec 3<"$1"
while IFS= read -r -u 3 line || [[ -n "$line" ]]; do
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

# This is the OG case statment that started the reviewmarkdown script 
# has since expanded plus logic added for the read and list options/switches/arguments
