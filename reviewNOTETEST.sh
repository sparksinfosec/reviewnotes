#!/usr/bin/env bash 

echo ""
echo "You are reviewing $1"
echo ""
target_file="$1" # might not need this 

# This works so far 
# with script file list (list all headers)
# and if its just script file (it will read the whole thing)
# Need to find a way to only read the specific header (script file read HEADER_word?)
# Might be tough (but two ways I see it either read everything up to that line then print until another header or EOF
# OR see if you can grab the file from there down and print everything until next header or EOF 


exec 3<"$1"
if [ "$2" == "list" ]
then 
	while IFS= read -r -u 3 line || [[ -n "$line" ]]; do
		case $line in
			\#*)
				read -p "Headers: $line"
			        ;;
		         *)
				:
				;;
		esac
	done
elif [ "$2" == "read" ]
then 
	awk -v var="$3" '/var/,0' $1 # Not working but the idea is good search for a word then print to EOF 
	# but we also want to print until another header or EOF 
	# awk or sed for this 

elif [ -f "$1" ]
then
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
else
	echo "else"
 fi

# TO DOs:
# Think about other markdown formatting like block quotes and such 
# IMPORTANT see if you can add a way to read from specific sections of the file such as # Review would just review the header section that is called review 
# Maybe list the headers if possible (maybe another case statment) 
