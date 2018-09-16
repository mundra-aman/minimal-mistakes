---
title: "All about Data Shuffling in Apache Spark"
layout: single
classes: wide
tags: [data-engineering, shuffling, apache spark]

excerpt: ""

header:
  image: /assets/images/feature_images/shuffle.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

> Avoid shuffling at all cost. Think about ways to leverage existing partitions. Leverage partial aggregation to reduce data transfer.

Shuffling is a process of redistributing data across partitions (aka repartitioning) that may or may not cause moving data across JVM processes or even over the wire (between executors on separate machines).
Shuffling is the process of data transfer between stages. By default, shuffling doesn’t change the number of partitions, but their content.

RDD is created by loading a file from HDFS, or reading a file in local storage. Spark has no control over what bits of data are distributed in which partitions.

The data is read and partitioned in an RDD, and when an "action" function is called, Spark sends out tasks to the worker nodes. 
If the action is a reduction, data shuffling takes place.

This becomes a problem for key-value RDDs: these often require knowing where occurrences of a particular key are, for instance to perform a join. If the key can occur anywhere in the RDD, 
we have to look through every partition to find the key.

Avoid groupByKey and use reduceByKey or combineByKey instead.

- groupByKey shuffles all the data, which is slow.

- reduceByKey shuffles only the results of sub-aggregations in each partition of the data.

PairRDD offers join transformation that when called on datasets of type (K, V) and (K, W), returns a dataset of (K, (V, W)) pairs with all pairs of elements for each key

when shuffling is triggered on Spark?
Any join, cogroup, or ByKey operation involves holding objects in hashmaps or in-memory buffers to group or sort. 
join, cogroup, and groupByKey use these data structures in the tasks for the stages that are on the fetching side of the shuffles they trigger. 

distinct creates a shuffle

reduceByKey and aggregateByKey use data structures in the tasks for the stages on both sides of the shuffles they trigger.

## How to check for shuffle?
**toDebugString** returns "A description of this RDD and its recursive dependencies for debugging." 
So it will include possible shuffles from prior transformations if they exist, even if the most recent transformation does not incur shuffle.

    scala> val a  = sc.parallelize(Array(1,2,3)).distinct
    scala> a.toDebugString
    MappedRDD[5] at distinct at <console>:12 (1 partitions)
      MapPartitionsRDD[4] at distinct at <console>:12 (1 partitions)
        **ShuffledRDD[3] at distinct at <console>:12 (1 partitions)**
          MapPartitionsRDD[2] at distinct at <console>:12 (1 partitions)
            MappedRDD[1] at distinct at <console>:12 (1 partitions)
              ParallelCollectionRDD[0] at parallelize at <console>:12 (1 partitions)
              

There are situations where a shuffle will be required or not required for a certain function. For example join usually requires a shuffle but if you join two RDD's that branch from 
the same RDD, spark can sometimes elide the shuffle.



1. [When does shuffling occur in Apache Spark?](https://stackoverflow.com/questions/31386590/when-does-shuffling-occur-in-apache-spark)
2. [What are the Spark transformations that causes a Shuffle?](https://stackoverflow.com/questions/26273664/what-are-the-spark-transformations-that-causes-a-shuffle)
3. [How Spark realize which RDD operation need to be split into seperate Stage?](https://stackoverflow.com/questions/42799322/how-spark-realize-which-rdd-operation-need-to-be-split-into-seperate-stage?noredirect=1&lq=1)
4. [Does coalesce(numPartitions) in spark undergo shuffling or not?](https://stackoverflow.com/questions/42034314/does-coalescenumpartitions-in-spark-undergo-shuffling-or-not?rq=1)
5. [Shuffling in Spark](http://www.waitingforcode.com/apache-spark/shuffling-in-spark/read)
