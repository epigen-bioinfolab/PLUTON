source ./PLUTON.config;

echo Starting WisecondorX

for i in $input_files;
	do
		WisecondorX convert $output_dir/$i.nodup.sorted.bam $output_dir/$i.outout.npz
	done

echo Done Indexing The Bam Files. The indexed filename is extended with .bai. You will find the .bai file in $output_dir.

echo ==============================================
echo ============================--- 90/100 Done  =
echo ==============================================


for i in $input_files;
	do
		WisecondorX predict $output_dir/$i.outout.npz $input_dir/reference_dnasolution.npz outid "--bed" "--plot"
	done

echo Done Prediction!!!

echo ===============================================
echo ==============================-- 95/100 Done  =
echo ===============================================


for i in $input_files;
	do
		WisecondorX gender $output_dir/$i.outout.npz $input_dir/reference_dnasolution.npz
	done

echo Done Prediction!!!

echo Time Needed for WisecondorX Prediction Is...
