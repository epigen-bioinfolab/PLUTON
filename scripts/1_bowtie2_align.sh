# This script is used to align data using bowtie2 tool.
# The script will take the file sample.fastq from the pat

source ./PLUTON.config;

echo Step 1
echo Starting Alignment with bowtie2....

for i in $input_files; do
	echo "Current File : $i";
	$bowtie_path/bowtie2 -x $ref_index_path/hg38index -U $input_dir/$i -t -S $output_dir/${i}.result.sam; 
	echo "Done Aligining :" $i;
done

echo Alignment with bowtie2 Done. You will find the  .sam files in "$output_dir".

echo Time Needed for Alignment Is...