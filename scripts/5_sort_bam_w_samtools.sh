#Converting the bam file into bam file

#1/bin/bash

source ./PLUTON.config;

echo Step 5
echo Start Sorting Bam Files Again to Make Sure the Quality of the Data
for i in $input_files;
	do
		samtools sort $output_dir/$i.sorted.nodup.bam > $output_dir/$i.nodup.sorted.bam
	done
	
echo Done Sorting Bam files to Bam. You will find the file in $output_dir with the files suffixed by .nodup.sorted.bam

echo Time Needed for Sorting Bam Is...