#!/bin/bash

total_lines=3848330
nombre_parties=100
lines_per_part=$((total_lines / nombre_parties + 1))

for i in $(seq 0 $((nombre_parties-1))); do
	start_line=$((i * lines_per_part + 1))
	end_line=$((start_line + lines_per_part - 1))

	# Si c'est la dernière partie, on ajuste la fin au total des lignes
	if [ $i -eq $((nombre_parties - 1)) ]; then
		end_line=$total_lines
	fi

	output_file="chunk_$((i+1)).json"
	sed -n "${start_line},${end_line}p" corpus-webis-tldr-17.json > "$output_file"
	echo "Created $output_file with lines $start_line to $end_line"
done

