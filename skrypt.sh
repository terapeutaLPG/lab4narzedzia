#!/bin/bash

show_date() {
  echo "Today's date is: $(date)"
}
create_logs() {
  local number_of_files=$1
  for i in $(seq 1 $number_of_files); do
    echo "Log for file $i, created on $(date)" > "log$i.txt"
  done
  echo "Created $number_of_files log files."
}
show_help() {
  echo "Available options:"
  echo "--date: Display today's date"
  echo "--logs [number]: Create a specified number of log files"
  echo "--help: Display this help"
}
case "$1" in
  --date)
    show_date
    ;;
  --logs)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      create_logs "$2"
    else
      echo "Provide the number of files to create as an argument."
    fi
    ;;
  --help)
    show_help
    ;;
  *)
    echo "Invalid option. Try '--help' for more information."
    ;;
esac
