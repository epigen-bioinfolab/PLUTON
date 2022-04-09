source ./PLUTON.config;

for a in *.fastq;
	do 
		$bowtie_path./bowtie2 -x $idx/hg38index -U $input_dir/$a -t -S $output_dir/$a.sam;
	done

echo "Alignment is completed"

echo "Alignment is completed" >> progress.txt

##############################################################################################

for b in *.fastq.sam;
	do 
		samtools sort $output_dir/$b > $output_dir/$b.sorted.sam;
	done

echo "Sorting of SAM file is completed"

echo "Sorting of SAM file is completed" >> progress.txt

##############################################################################################

for c in *.fastq.sam.sorted.sam;
	do
		java -jar $picard_path/picard.jar MarkDuplicates --REMOVE_DUPLICATES TRUE -I $output_dir/$c -O $output_dir/$c.nodup.sam -M $output_dir/Metrics_file_required_for_duplicate_removing_sam.txt;
	
	done

echo "Duplicates are removed from sorted SAM file"

echo "Duplicates are removed from sorted SAM file" >> progress.txt

##############################################################################################

for d in *.fastq.sam.sorted.sam.nodup.sam;
	do 
		samtools view -b $output_dir/$d > $output_dir/$d.bam;
	done

echo "Conversion of SAM file into BAM file is completed"

echo "Conversion of SAM file into BAM file is completed" >> progress.txt

##############################################################################################

for e in *.fastq.sam.sorted.sam.nodup.sam.bam;
	do 
		samtools index $output_dir/$e;
	done

echo "Indexing of BAM file is completed"

echo "Indexing of BAM file is completed" >> progress.txt

##############################################################################################

for f in *.fastq.sam.sorted.sam.nodup.sam.bam;
	do 
		WisecondorX convert $output_dir/$f $output_dir/$f.npz;
	done

echo "Conversion of BAM file into .npz file is completed"

echo "Conversion of BAM file into .npz file is completed" >> progress.txt

##############################################################################################

WisecondorX newref $output_dir/*.npz final_reference_dnasolution.npz --nipt

echo "Reference is successfully created for WisecondorX"

echo "Reference is successfully created for WisecondorX" >> progress.txt

##############################################################################################

