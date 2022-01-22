#!/usr/bin/env bash

export LC_ALL='C'

#TODO: bzip2 output '--version' to stderr

common_cmds=$(more tools.txt)

for cmds in ${common_cmds[*]}; do
	tool=$(eval "${cmds} --version | tr ' ' '\n'")

	tool_version=$(grep -Eo -m 1 \
		"^[0-9]+\.([0-9]+)(\.([0-9]+)|)" <<< "$tool")

	echo -e "${cmds}: ${tool_version}"

	sleep 0.2
done
