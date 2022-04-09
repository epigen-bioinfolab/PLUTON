#Soring the aligned sam files using samtools after aligning fastq file with hg38index
#Preparing these sorted sam files for picard (to remove dupliucates)

source ./PLUTON.config;

echo Step 2
echo Start Sorting with sam files using samtools....

for i in $input_files; do
	echo "Current File : ${output_dir}/${i}.result.sam";
	samtools sort ${output_dir}/${i}.result.sam > ${output_dir}/${i}.result.sorted.sam
	echo "Done Sorting :" ${output_dir}/${i}.result.sam;
	echo "New Sorted Sam File Is : " ${output_dir}/${i}.result.sorted.sam;
done

echo Sorting sam files with samtools Done. You will find the  sorted .sam files in "$output_dir". with the suffix .result.sam

echo Time Needed for Sorting Is...