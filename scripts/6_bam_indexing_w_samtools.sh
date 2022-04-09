
#Indexing the sorted no duplicates bam file

#1/bin/bash

source ./PLUTON.config;

echo Start Indexing The Bam Files Using samtools

for i in $input_files;
	do
		samtools index $output_dir/$i.nodup.sorted.bam
	done

echo Done Indexing The Bam Files. The indexed filename is extended with .bai. You will find the .bai file in $output_dir.

echo Time Needed for Indexing Is...