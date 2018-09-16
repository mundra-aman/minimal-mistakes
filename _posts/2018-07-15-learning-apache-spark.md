---
title: "Pointers for beginners to learn Apache Spark"
layout: single
classes: wide
tags: [apache spark, analysis, spark]

excerpt: "This post provides pointers to learn about apache spark, the architecture and concepts related to it."

header:
  image: /assets/images/apache_spark.PNG
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

I've tried to collect good links on Apache spark and it's architecture here.
I'll be regularly updating this list as and when I come across new articles on Apache Spark. 


# Distributed Systems
1. [A Thorough Introduction to Distributed Systems](https://hackernoon.com/a-thorough-introduction-to-distributed-systems-3b91562c9b3c)
2. [Why I love databases](https://medium.com/@jeeyoungk/why-i-love-databases-1d4cc433685f)
3. [How Sharding Works](https://medium.com/@jeeyoungk/how-sharding-works-b4dec46b3f6)



# Hadoop-Map Reduce paradigm
1. [Shuffle Operation in Hadoop and Spark](https://www.analyticsindiamag.com/shuffle-operation-hadoop-spark/)



# Official Apache Spark guide
1. [RDD Programming Guide](http://spark.apache.org/docs/latest/rdd-programming-guide.html)



# Web resources, gitbooks and tutorials for Apache Spark
1. **A nice brief gitbook on running spark from a USB stick in local mode: **[How to light your 'Spark on a stick'](https://blueplastic.gitbooks.io/how-to-light-your-spark-on-a-stick/content/index.html)
2. [SparkSQL Getting Started](https://pawanmishra.github.io/spark-sql-part-1/)
3. [Running Spark App In Standalone Cluster Mode](https://pawanmishra.github.io/spark-stand-alone-mode/)
4. [Spark Recipes](https://pawanmishra.github.io/spark-tips/)
5. [how to setup apache spark standalone cluster on multiple machine](http://paxcel.net/blog/how-to-setup-apache-spark-standalone-cluster-on-multiple-machine/)
6. [how spark internally executes a program](https://blog.knoldus.com/how-spark-internally-executes-a-program/)



# Papers published on Apache Spark
1. [Spark SQL: Relational Data Processing in Spark](http://people.csail.mit.edu/matei/papers/2015/sigmod_spark_sql.pdf)
2. [Resilient Distributed Datasets: A Fault-Tolerant Abstraction for In-Memory Cluster Computing](http://people.csail.mit.edu/matei/papers/2012/nsdi_spark.pdf)
3. [Optimizing Shuffle Performance in Spark](https://people.eecs.berkeley.edu/~kubitron/courses/cs262a-F13/projects/reports/project16_report.pdf)



# Spark Architecture
1. [Spark Architecture](https://0x0fff.com/spark-architecture/)
2. [Spark Misconceptions](https://0x0fff.com/spark-misconceptions/)
3. [Spark Architecture: Shuffle](https://0x0fff.com/spark-architecture-shuffle/)
4. [RDD’s : Building block of Spark](https://medium.com/@thejasbabu/rdds-building-block-of-spark-bf16136afbc6)
5. [Spark DataFrames](https://medium.com/@thejasbabu/spark-dataframes-10c349de04c)



# Spark Topics about which one needs to be aware of, for building efficient data pipelines

## Spark Execution
1. [Spark Execution - plans](http://balajireddyblog.blogspot.com/2017/01/spark-execution.html?_sm_au_=iVVJ2FZtkJMSQqVN)
2. [Spark on Yarn](https://medium.com/@wx.london.cun/spark-on-yarn-f74e82ab6070)
3. [Spark standalone cluster tutorial](https://mbonaci.github.io/mbo-spark/)
4. [Spark Master UI](https://blueplastic.gitbooks.io/how-to-light-your-spark-on-a-stick/content/spark_web_uis/spark_stages_ui.html)

## Spark dynamic allocation
1. [Smart Resource Utilization With Spark Dynamic Allocation](https://dzone.com/articles/spark-dynamic-allocation)

## Spark Speculative tasks
1. [Speculative execution in Spark](http://www.waitingforcode.com/apache-spark/speculative-execution-spark/read#speculative_task_example)

## Persisting and Checkpointing in Apache Spark
1. [Apache Spark Caching Vs Checkpointing](http://www.lifeisafile.com/Apache-Spark-Caching-Vs-Checkpointing/)

## Spark Serialization
1. [Serialization in Spark](http://www.lifeisafile.com/Serialization-in-spark/)



# Spark Partitioning
1. [An Intro to Apache Spark Partitioning: What You Need to Know](https://dzone.com/articles/an-intro-to-apache-spark-partitioning-what-you-nee)
2. [Spark Under The Hood : Partition](https://medium.com/@thejasbabu/spark-under-the-hood-partition-d386aaaa26b7)



# Shuffling in Apche Spark
1. [All about Shuffling](http://www.lifeisafile.com/All-about-Shuffling/)
2. **Another good article on shuffle by Cloudera** : [Working with Apache Spark: Or, How I Learned to Stop Worrying and Love the Shuffle](http://blog.cloudera.com/blog/2015/05/working-with-apache-spark-or-how-i-learned-to-stop-worrying-and-love-the-shuffle/)
3. **In-depth explanation on Spark shuffle** : [Apache Spark Shuffles Explained In Depth](http://hydronitrogen.com/apache-spark-shuffles-explained-in-depth.html)
4. [You Won’t Believe How Spark Shuffling Will Probably Bite You (Also Windowing)](https://medium.com/@foundev/you-won-t-believe-how-spark-shuffling-will-probably-bite-you-also-windowing-e39d07bf754e)
5. **A video on shuffle by Yandex on coursera**[Shuffle. Where to send data?](https://www.coursera.org/lecture/big-data-analysis/shuffle-where-to-send-data-qUmiz)
6. **A brief coursera lecture on shuffling in Apache Spark** : [Shuffling: What it is and why it's important](https://www.coursera.org/lecture/scala-spark-big-data/shuffling-what-it-is-and-why-its-important-bT1YR)



# Tuning Apache Spark for performance
1. **Official Spark configuration page - version 2.3.x**[Spark Configuration](http://spark.apache.org/docs/latest/configuration.html#compression-and-serialization)
1. [How-to: Tune Your Apache Spark Jobs (Part 1)](http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-1/)
2. [How-to: Tune Your Apache Spark Jobs (Part 2)](http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-2/)
3. [Spark performance tuning from the trenches](https://medium.com/teads-engineering/spark-performance-tuning-from-the-trenches-7cbde521cf60)
4. [Tune your Spark (Part 2) jobs](https://www.linkedin.com/pulse/tune-spark-jobs-2-chaaranpall-lambba/)
5. [One operation and maintenance](http://bigdatatn.blogspot.com/2017/06/spark-optimization.html?_sm_au_=iVVWqPTfRq1MfR7H)



# Commonly occuring errors and issues in Apache Spark
1. [Some Lessons of Spark and Memory Issues on EMR](http://top-performance.blogspot.com/2018/03/some-lessons-of-spark-and-memory-issues.html?_sm_au_=iVVTLJSkSst0fqqF)



# Most common Apache Spark mistakes and gotcha's
1. [Top 5 Mistakes to Avoid When Writing Apache Spark Applications](https://www.slideshare.net/cloudera/top-5-mistakes-to-avoid-when-writing-apache-spark-applications)
<iframe src="//www.slideshare.net/slideshow/embed_code/key/jwiwqfaY4CKI1N" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; 
border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> 
<div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/cloudera/top-5-mistakes-to-avoid-when-writing-apache-spark-applications" 
title="Top 5 Mistakes to Avoid When Writing Apache Spark Applications" target="_blank"> Top 5 Mistakes to Avoid When Writing Apache Spark Applications</a> </strong> from <strong>
<a href="//www.slideshare.net/cloudera" target="_blank">Cloudera, Inc.</a></strong> </div>


> Spark input splits works same way as Hadoop input splits, it uses same underlining hadoop InputFormat API's. When it comes to the spark partitions, by default it will create one partition for each hdfs blocks, For example: if you have file with 1GB size and your hdfs block size is 128 MB then you will have total 8 HDFS blocks and spark will create 8 partitions by default . But incase if you want further split within partition then it would be done on line split.

> On ingest, Spark relies on HDFS settings to determine the splits based on block size which maps 1:1 to RDD partition. However, Spark then gives you fine grain control over the number of partitions at run time. Spark provides transformation like repartition, coalesce, and repartitionAndSortWithinPartition give you direct control over the number of partitions being computed. When these transformations are used correctly, they can greatly improve the efficiency of the Spark job.

> when reading compressed file formats from disk, Spark partitioning depends on whether the format is splittable. For instance, these formats are splittable: bzip2, snappy, LZO (if indexed), while gzip is not splittable.



# Running Apache Spark on EMR
Apache Spark on EMR with S3 as the storage is a best combination for executing your ETL tasks in cloud these days. 
Running Spark on EMR takes away the hassle of setting up a spark/hadoop cluster and it's administration. Also it comes with auto scaling feature.

So a regular spark execution on EMR looks like this: 

Spawn a new EMR cluster considering the resources required for your job. Select the latest Spark version and other tools like Hive, Zeppelin, Ganglia. 
Pass the necessary configurations for spark and yarn which need to be loaded during the bootstrap process. 
Once the cluster is up, simply run your spark applications using Step execution, AWS lambda or spark-submit. 

1. **Discusses about shuffle, task memory spill in EMR**[Tuning My Apache Spark Data Processing Cluster on Amazon EMR](https://aranair.github.io/posts/2017/03/10/tuning-my-apache-spark-cluster-on-aws-emr/)
2. [Tuning Spark Jobs on EMR with YARN - Lessons Learnt](https://www.richakhandelwal.com/tuning-your-spark-jobs/)
3. [Setting spark.speculation in Spark 2.1.0 while writing to s3](https://stackoverflow.com/questions/46375631/setting-spark-speculation-in-spark-2-1-0-while-writing-to-s3)
4. [Submitting User Applications with spark-submit](https://aws.amazon.com/blogs/big-data/submitting-user-applications-with-spark-submit/)

# Apache Spark best practices
1. [Spark Best Practices](https://docs.qubole.com/en/latest/user-guide/spark/spark-best-practices.html)
2. [Lessons From the Field: Applying Best Practices to Your Apache Spark Applications](https://databricks.com/session/lessons-from-the-field-applying-best-practices-to-your-apache-spark-applications)
3. [Spark Best Practices](https://github.com/beeva/beeva-best-practices/blob/master/big_data/spark/README.md)
4. [](https://robertovitillo.com/2015/06/30/spark-best-practices/)
5. [Best Practices for Spark Programming - Part I](https://community.hortonworks.com/articles/75022/optimizing-your-first-spark-program.html)
6. [Apache Spark - Best Practices and Tuning](https://legacy.gitbook.com/book/umbertogriffo/apache-spark-best-practices-and-tuning/details)


# StackOverflow questions on Apache Spark
1. [Spark: driver/worker configuration. Does driver run on Master node?](https://stackoverflow.com/questions/34930108/spark-driver-worker-configuration-does-driver-run-on-master-node)
2. [Resolving dependency problems in Apache Spark](https://stackoverflow.com/questions/41383460/resolving-dependency-problems-in-apache-spark)