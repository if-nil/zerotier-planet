#!/bin/bash

# 设置文件夹路径
file_path="/app/ip_address"

if [[ -f "$file_path" ]]; then
  echo "File exists."
else
  echo "File does not exist."
fi