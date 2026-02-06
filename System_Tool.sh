#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color (resets the terminal to default)

OS=$(uname)

if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
  echo "Linux or macOS Detected!"
  sleep 2

  while true; do
  sleep 0.8;
    echo
    echo -e "~) ${GREEN} Choose an option: ${NC}"
    echo -e "0) ${RED} Exit ${NC}"
    echo -e "1) ${BLUE} List files ${NC}"
    echo -e "2) ${BLUE} Show IP address ${NC}"
    echo -e "3) ${BLUE} Ping a website ${NC}"


    read -r -p "Enter your choice (1, 2, 3, etc): " slct

    case "$slct" in
      1)
        ls -l
        ;;
      2)
        if [[ "$OS" == "Linux" ]]; then
          hostname -I
        else
          ipconfig getifaddr en0
        fi
        ;;
      3)
        read -r -p "Enter site name with domain: " site
        ping -c 4 "$site" &> /dev/null;
        if [ $? -eq 0 ]; then
         echo -e "${GREEN} Ping Successful ${NC}"
         else 
            echo -e "${RED} Ping Unsuccessful ${NC}"
        fi
        ;;
      0)
        echo -e "${RED} Exiting... ${NC}"
        exit 0
        ;;
      *)
        echo "Invalid option. Please choose 1, 2, or 3."
        ;;
    esac
  done

else
  echo "Windows or unknown OS detected."
  echo "Please use the PowerShell version for Windows."
sleep 2
fi
