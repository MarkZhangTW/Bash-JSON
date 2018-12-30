#!/usr/bin/env bash

input=`cat /dev/stdin`
echo ${input//[[:space:]]/} >/dev/stdin

indent=0
DONE=false
read -n1 newChar || DONE=true

until $DONE; do
    oldChar=$newChar
    read -n1 newChar || DONE=true
    if [[ -z "${oldChar// }" ]]; then
        echo
    fi
    printf "%s" $oldChar
    case $oldChar in
        '{'|'[')
            if [ ! $newChar = '}' ] && [ ! $newChar = ']' ]; then
                echo
                ((indent+=2))
                printf '%*s' $indent
            fi
            ;;
        '}'|']')
            if [ "$newChar" = '}' ] || [ "$newChar" = ']' ]; then
                ((indent-=2))
                echo
                printf '%*s' $indent
            fi
            ;;
        ',')
            echo
            printf '%*s' $indent
            ;;
        *)
            if [ "$newChar" = '}' ] || [ "$newChar" = ']' ]; then
                ((indent-=2))
                echo
                printf '%*s' $indent
            fi
            ;;
    esac
done
