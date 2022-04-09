source ./PLUTON.config;


##Quality_control

echo Starting Quality Control.

echo =============================================
#make the file executable

chmod a+x $fastqc_path/fastqc;
cd $fastqc_path;

echo Lets do FASTQC First....

./fastqc $input_dir/*.fastq;

echo FASTQC DONE ..

echo =============================================

read -p "Do you want to do the MultiQC? (Y/N) " m
if [[ "$m" == "Y" ]]
then
	echo Preparing MultiQC

	multiqc $input_dir/

	echo MultiQC DONE ..
	echo =============================================
fi


echo Time Needed for The Quality Check Is...