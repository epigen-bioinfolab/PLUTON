#Converting the sam file into bam file

#1/bin/bash


source ./PLUTON.config;

echo Step 4
echo Start Converting Sam files to Bam
for i in $input_files;
	do
		samtools view -b $output_dir/$i.sorted.nodup.sam > $output_dir/$i.sorted.nodup.bam

	done
echo Done Converting Sam files to Bam. You will find the file in $output_dir with the files suffixed by .sorted.nodup.bam
echo ========================================================================================================================

echo Time Needed for Converting Sam to Bam Is...