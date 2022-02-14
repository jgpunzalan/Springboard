HADOOP_STREAM_PATH="/usr/hdp/3.0.1.0-187/hadoop-mapreduce/hadoop-streaming.jar"

hadoop jar $HADOOP_STREAM_PATH \
-file autoinc_mapper01.py -mapper 'python autoinc_mapper01.py' \
-file autoinc_reducer01.py -reducer 'python autoinc_reducer01.py' \
-input input/data.csv -output output/all_accidents > execution_log.txt

hadoop jar $HADOOP_STREAM_PATH \
-file autoinc_mapper02.py -mapper 'python autoinc_mapper02.py' \
-file autoinc_reducer02.py -reducer 'python autoinc_reducer02.py' \
-input output/all_accidents -output output/make_year_count >> execution_log.txt
