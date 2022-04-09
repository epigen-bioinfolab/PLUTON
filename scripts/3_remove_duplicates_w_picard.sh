#Removing duplicates from sam file after aligning fastq files with hg38index

source ./nipt_analysis.config;

echo Step 3
echo Start Removing Duplicates with Picard
for i in $input_files;
	do
		java -jar $picard_path/picard.jar MarkDuplicates --REMOVE_DUPLICATES TRUE -I $output_dir/$i.result.sorted.sam -O $output_dir/$i.sorted.nodup.sam -M $output_dir/Metrics_file_required_for_duplicate_removing_sam.txt;
	done

echo Done Removing Duplicates with Picard. You will find the file in $output_dir with the files suffixed by .sorted.nodup.sam

echo Time Needed for Removing Duplicate Is...