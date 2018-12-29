#!/usr/bin/env bash

indent=0
DONE=false
read -n1 newChar || DONE=true

until $DONE; do
    oldChar=$newChar
    read -n1 newChar || DONE=true
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
