# Springboard Data Engineer Career Track
## 17.11 Hadoop Mini Project

## Summary
Utilizing Hadoop, execute a MapReduce to process data source to analyze the data set.


## Instructions
### Step 1:
Copy the project files to the local machine:
<ul>
    <li>data.csv</li>
    <li>autoinc_mapper01.py</li>
    <li>autoinc_mapper02.py</li>
    <li>autoinc_reducer01.py</li>
    <li>autoinc_reducer02.py</li>
    <li>map_reduce.sh</li>
</ul>  
<br />

### Step 2:
Open the 'map_reduce.sh' file and edit the HADOOP_STREAM_PATH variable with the path to hadoop-streaming.jar on your local machine.

> `HADOOP_STREAM_PATH="/usr/hdp/3.0.1.0-187/hadoop-mapreduce/hadoop-streaming.jar"`  

### Step 3:
Execute the following command to put the data file into the input folder on HDFS.

> `hadoop fs -put data.csv input`  

### Step 4:
Run the shell script to process the data.

> `bash map_reduce.sh`  

### Step 5:
Verify the output of the generated output files.  
> `hadoop fs -cat output/all_accidents/part-00000`  
> `hadoop fs -cat output/make_year_count/part-00000`  

### Step 6: 
If the shell script needs to be rerun, first delete the output folder and its contents before rerunning.  
> `hadoop fs -rm -r output`
