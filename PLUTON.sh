echo Welcome to Nipt Analysis...

read -p "Reference Creation or Query Analysis (r/q) " m

if [[ "$m" == "r" ]]
then
	./scripts/reference_creation.sh;
else
	read -p "Do you want to do the quality check phase? (Y/N) " x

	if [[ "$x" == "Y" ]]
	then
		time ./scripts/quality_check.sh
		echo =============================================
		echo ===--------------------------- 10/100 Done  =
		echo =============================================
	else
		echo Starting Without Quality Checking
	fi

	time ./scripts/1_bowtie2_align.sh;

	echo =============================================
	echo ============------------------ 40/100 Done  =
	echo =============================================

	time ./scripts/2_sort_sams_w_samtools.sh;

	echo ==============================================
	echo ===============---------------- 50/100 Done  =
	echo ==============================================

	time ./scripts/3_remove_duplicates_w_picard.sh;

	echo ==============================================
	echo ====================----------- 65/100 Done  =
	echo ==============================================

	time ./scripts/4_sam_to_bam_w_samtools.sh;

	echo ==============================================
	echo ======================--------- 75/100 Done  =
	echo ==============================================

	time ./scripts/5_sort_bam_w_samtools.sh;

	echo ==============================================
	echo ========================------- 80/100 Done  =
	echo ==============================================

	time ./scripts/6_bam_indexing_w_samtools.sh;

	echo ==============================================
	echo ==========================----- 85/100 Done  =
	echo ==============================================

	time ./scripts/7_wiseconderx.sh;

	echo ===============================================
	echo =============================== 100/100 Done  =
	echo ===============================================

	echo congratulations!!! The Analysis is Done. Please find all your results in the result directory
fi	
