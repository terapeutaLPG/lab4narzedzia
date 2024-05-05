#!/bin/bash

function show_date() {
  echo "Today's date is: $(date)"
}

function create_logs() {
  local number=$1
  for i in $(seq 1 $number); do
    echo "Log for file $i, created on $(date)" > "log$i.txt"
  done
  echo "Created $number log files."
}

function create_errors() {
  local number=$1
  for i in $(seq 1 $number); do
    echo "Error in file $i" > "error$i.txt"
  done
  echo "Created $number error files."
}

function help_menu() {
  echo "Available options:"
  echo "-h, --help       display this help menu"
  echo "-d, --date       display today's date"
  echo "-l [number], --logs [number] create a specified number of log files"
  echo "--init           clone repository and add path to PATH"
  echo "-e [number], --error [number] create a specified number of error files"
}

case "$1" in
  -h|--help)
    help_menu
    ;;
  -d|--date)
    show_date
    ;;
  -l|--logs)
    create_logs "$2"
    ;;
  --init)
    git clone https://github.com/terapeutaLPG/lab4narzedzia
    cd lab4narzedzia || exit
    export PATH="$PATH:$(pwd)"
    ;;
  -e|--error)
    create_errors "$2"
    ;;
  *)
    echo "Invalid option. Try '-h' or '--help' for more information."
    ;;
esac
