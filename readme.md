# PLUTON (cross-PLatform aUtomated TOol for Nipt)
### An integrative and flexible framework for NIPT Analysis

PLUTON is an integrative and flexible framework including several methods for quality control analysis, align-reads pre-processing, chromosomal aneuploidies prediction and accurate gender prediction.

## Dependencies

Multiple dependencies are needed to do the analysis properly. We have listed the dependencies below phase by phase.

---
### In General

- R (v3.4) packages
    - jsonlite (v1.5)
- R Bioconductor (v3.5) packages
    - DNAcopy (v1.50.1)
- Python (v3.6) libraries
    - scipy (v1.1.0)
    - scikit-learn (v0.20.0)
    - pysam (v0.15.1)
    - numpy (v1.15.2)
    - matplotlib (v2.2.3)

---

### For Quality Check
For FastQC : 

- java-1.8.0-openjdk. See the link to know how to install it in your system [How to Install OpenJdk](https://openjdk.java.net/install/)

- You will also need the "fastqc_v0.11.9" tool.
- Go to the "PLUTON/tools" folder and find the **"fastqc_v0.11.9.zip"** file and extract.

For MultiQC : 

- You will need the "MultiQC" tool.
- Go to the "PLUTON/tools" folder and find the **"MultiQC.zip"** file and extract.
- Enter the folder and use one of the three commands below to install "MultiQC"
```bash
pip3 install multiqc
```
or
```bash
pip install multiqc
```
or Go to the MultiQC Directory and 
```bash
sudo python3 setup.py install
```

*Note: We have provided both the "fastqc_v0.11.9" & "MultiQC" tool with the package. Check tools directory.*

---

### Alignment Phase

**You will need the bowtie2 for this step.**
- Go to the "PLUTON/tools" folder. 
- You will find the compressed **"bowtie2-2.4.4-linux-x86_64.zip"** there. Extract the zip file.

*Note: We have provided the tool with the package*

---
### Sorting, Converting and Indexing SAM Files

**You will need the SAMtools  for this step.**
- Go to the "PLUTON/tools" folder. 
- You will find the compressed **"samtools-1.14.zip"** there. Extract the zip file.
```
#installing SAMtools dependencies
sudo dnf install make
sudo dnf install gcc
sudo dnf install autoheader
sudo dnf install autoconf

chmod a+x ~PLUTON/tools/samtools-1.14./configure
cd ~PLUTON/tools/samtools-1.14
make
make install
```

*Note: We have provided the **"samtools-1.14.zip"** tool with the package*

---
### Removing Duplicates

**You will need the picard and java for this step.**
- If you dont have java already, you can install java following this link [How to install Java](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04) 
- Download the picard(v2.26.10) from [here](https://github.com/broadinstitute/picard/releases/tag/2.26.10)
- Go to the "PLUTON/tools" folder and put the downloaded file here and extract it.

---

### WisecondorX

**You will need the WisecondorX for this step.**
- Go to the "PLUTON/tools" folder. 
- You will find the compressed **"WisecondorX-master.zip"** there. Extract the zip file.
- Enter the directory.
- See WisecondorX doc [here](https://github.com/CenterForMedicalGeneticsGhent/WisecondorX)

```
sudo python3 setup.py install
```

*Note: We have provided the tool with the package*

---

## Folder Structure

- Root : PLUTON
- Tools : PLUTON/tools
- Fastq Data File Path : PLUTON/data
- Sh Scripts : PLUTON/scripts
- Config File : PLUTON/PLUTON.config

## Workflow

### Prerequisite
- Check if all the dependencies are installed. Check the "Dependencies" section to know about the dependencies.
- Give "755" or "777" permission to the project directory.
  - Go to the directory where you have kept the project. 
  - Open terminal and type in the command below. Give password and the permission will be done.
```
sudo chmod -R 755 PLUTON
```

### Creating Config File

We have devided the config file in several parts for better understanding.

1. General Configuration
2. For Quality Check
3. For Alignment Phase
4. For removing duplicate phase

---

[1] General Configuration :
- input_files : Put the all your files names as a list in this variable.
- input_dir  : This is where all you should put all your fastq data files.
- output_dir : This is where the results will be generated.

Example:
```bash
input_files=("sample.fastq")
input_dir=/home/enumbin/Desktop/friends/nibir/PLUTON/data;
output_dir=[PATH_TO_THE_FOLDER]/PLUTON/results;
```
---

[2] For Quality Check : 
- fastqc_path : Put the path of the directory where FastQC tool is located. It will be in  **"[PATH_TO_THE_FOLDER]/PLUTON/tools"**

Example:
```bash
fastqc_path=/home/enumbin/Desktop/friends/nibir/PLUTON/tools/fastqc_v0.11.9/FastQC/;
```
---

[3] Alignment Phase : 
- bowtie_path : Go to the "PLUTON/tools/bowtie2-2.4.4-linux-x86_64" and get the path. The path will be in  **"[PATH_TO_THE_FOLDER]/PLUTON/tools/bowtie2-2.4.4-linux-x86_64"**
- ref_index_path : We have provided a reference index file with the project. You will find it in  **"[PATH_TO_THE_FOLDER]/PLUTON/data/bowtie2_reference_index;"** 

Example:
```bash
bowtie_path=/home/enumbin/Desktop/friends/nibir/PLUTON/tools/bowtie2-2.4.4-linux-x86_64;
ref_index_path=/home/enumbin/Desktop/friends/nibir/PLUTON/data/bowtie2_reference_index;
```
---

[4] Removing Duplicates Phase : 
- picard_path: Go to the "PLUTON/tools/picard-2.26.10/picard/build/libs" and get the path. The path will be in  **"[PATH_TO_THE_FOLDER]/PLUTON/tools/picard-2.26.10/picard/build/libs"**

Example:
```bash
picard_path=/home/enumbin/Desktop/friends/nibir/PLUTON/tools/picard-2.26.10/picard/build/libs;
```
---

### Run The Project

- Go to the root directory of the package e.g. "PLUTON".
- Open terminal. Run the command below.
```
./PLUTON.sh
```

- **For reference creation type r or q otherwise.**

- You should see the welcoming message on the terminal screen. The the terminal will ask you for Quality Check phase. **Type Y to do the Quality Check Phase and N Otherwise.** 
- If you choose to run the Quality Check phase, the FastQC will run automatically. **For MultiQC you will be asked to type "Y/N" again.** Do as you want.
- After the quality checking phase the alignment phase will start. If you have written the config file correctly from the instructions above, the analysis will be done automatically from this phase.
- After each step there will be a section like below which will indicate the time consumed for the step.
```
real	0m0.000s 
user	0m0.000s 
sys	0m0.000s
```

## Conclusion
Here will be conclusion
