---
title: "Pointers for beginners to learn Apache Spark"
layout: single
classes: wide
tags: [apache spark, analysis, spark]

excerpt: "This post provides pointers to learn apache spark, the architecture of spark and concepts related to it."

header:
  image: /assets/images/apache_spark.PNG
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

# Distributed Systems
1. [A Thorough Introduction to Distributed Systems](https://hackernoon.com/a-thorough-introduction-to-distributed-systems-3b91562c9b3c)



# Official Apache Spark guide
1. [RDD Programming Guide](http://spark.apache.org/docs/latest/rdd-programming-guide.html)



# Papers published on Apache Spark
1. [Spark SQL: Relational Data Processing in Spark](http://people.csail.mit.edu/matei/papers/2015/sigmod_spark_sql.pdf)
2. [Resilient Distributed Datasets: A Fault-Tolerant Abstraction for In-Memory Cluster Computing](http://people.csail.mit.edu/matei/papers/2012/nsdi_spark.pdf)



# Spark Architecture
1. [Spark Architecture](https://0x0fff.com/spark-architecture/)
2. [Spark Misconceptions](https://0x0fff.com/spark-misconceptions/)
3. [Spark Architecture: Shuffle](https://0x0fff.com/spark-architecture-shuffle/)
4. [RDD’s : Building block of Spark](https://medium.com/@thejasbabu/rdds-building-block-of-spark-bf16136afbc6)
5. [Spark DataFrames](https://medium.com/@thejasbabu/spark-dataframes-10c349de04c)



# Spark Partitioning
1. [An Intro to Apache Spark Partitioning: What You Need to Know](https://dzone.com/articles/an-intro-to-apache-spark-partitioning-what-you-nee)
2. [Spark Under The Hood : Partition](https://medium.com/@thejasbabu/spark-under-the-hood-partition-d386aaaa26b7)



# Shuffling in Apche Spark
1. **A brief coursera lecture on shuffling in Apache Spark** : [Shuffling: What it is and why it's important](https://www.coursera.org/lecture/scala-spark-big-data/shuffling-what-it-is-and-why-its-important-bT1YR)
2. **Another good article on shuffle by Cloudera** : [Working with Apache Spark: Or, How I Learned to Stop Worrying and Love the Shuffle](http://blog.cloudera.com/blog/2015/05/working-with-apache-spark-or-how-i-learned-to-stop-worrying-and-love-the-shuffle/)
3. **In-depth explanation on Spark shuffle** : [Apache Spark Shuffles Explained In Depth](http://hydronitrogen.com/apache-spark-shuffles-explained-in-depth.html)
4. [You Won’t Believe How Spark Shuffling Will Probably Bite You (Also Windowing)](https://medium.com/@foundev/you-won-t-believe-how-spark-shuffling-will-probably-bite-you-also-windowing-e39d07bf754e)
5. **A video on shuffle by Yandex on coursera**[Shuffle. Where to send data?](https://www.coursera.org/lecture/big-data-analysis/shuffle-where-to-send-data-qUmiz)



# Tuning Apache Spark for performance
1. **Official Spark configuration page - version 2.3.x**[Spark Configuration](http://spark.apache.org/docs/latest/configuration.html#compression-and-serialization)
1. [How-to: Tune Your Apache Spark Jobs (Part 1)](http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-1/)
2. [How-to: Tune Your Apache Spark Jobs (Part 2)](http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-2/)
3. [Spark performance tuning from the trenches](https://medium.com/teads-engineering/spark-performance-tuning-from-the-trenches-7cbde521cf60)
4. [Tune your Spark (Part 2) jobs](https://www.linkedin.com/pulse/tune-spark-jobs-2-chaaranpall-lambba/)
5. [One operation and maintenance](http://bigdatatn.blogspot.com/2017/06/spark-optimization.html?_sm_au_=iVVWqPTfRq1MfR7H)



# Commonly occuring errors and issues in Apache Spark
1. [Some Lessons of Spark and Memory Issues on EMR](http://top-performance.blogspot.com/2018/03/some-lessons-of-spark-and-memory-issues.html?_sm_au_=iVVTLJSkSst0fqqF)



# Running Apache Spark on EMR
Apache Spark on EMR with S3 as the storage is a best combination for executing your ETL tasks in cloud these days. 
Running Spark on EMR takes away the hassle of setting up a spark/hadoop cluster and it's administration. Also it comes with auto scaling feature.

So a regular spark execution on EMR looks like this: 

Spawn a new EMR cluster considering the resources required for your job. Select the latest Spark version and other tools like Hive, Zeppelin, Ganglia. 
Pass the necessary configurations for spark and yarn which need to be loaded during the bootstrap process. 
Once the cluster is up, simply run your spark applications using Step execution, AWS lambda or spark-submit. 

1. **Discusses about shuffle, task memory spill in EMR**[Tuning My Apache Spark Data Processing Cluster on Amazon EMR](https://aranair.github.io/posts/2017/03/10/tuning-my-apache-spark-cluster-on-aws-emr/)
2. [Tuning Spark Jobs on EMR with YARN - Lessons Learnt](https://www.richakhandelwal.com/tuning-your-spark-jobs/)

