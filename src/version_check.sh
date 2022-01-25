#!/usr/bin/env bash

#TODO: check if g{cc,++} is working

num_lines=$(wc -l < tools.txt)

for (( lines=1; lines<="$num_lines"; lines++ )); do
	cmd=$(sed -n "${lines}p" tools.txt)
	data=$(eval "${cmd} --version" 2>&-)
	tool=$(tr ' ' '\n' <<< "$data")

	tool_version=$(grep -Eo -m 1 \
		"^[0-9]+\.([0-9]+)(\.([0-9]+)|)" <<< "$tool")

	cmd=$(sed -En '/(([[:alnum:]])+)(.*)/{s//\1/p;q}' <<< "$cmd")
	echo "${cmd}: ${tool_version}"

	sleep 0.2
done
