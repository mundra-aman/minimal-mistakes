---
title: "Apache Spark Caching Vs Checkpointing"
layout: single
classes: wide
tags: [data-engineering, Apache-spark]

excerpt: "Persist, Cache, Checkpoint in Apache Spark"

header:
  image: /assets/images/feature_images/caching_checkpointing.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---
As an Apache Spark application developer, memory management is one of the most essential tasks, but the difference between caching and checkpointing can cause confusion. 
Both operations are essential in preventing Spark from having to lazily recompute a resilient distributed dataset (RDD) every time it is referenced, but there are also key differences 
between the two.

Caching computes and materializes an RDD in memory while keeping track of its lineage (dependencies). There are many levels of persistence supported that allow you to make space and compute 
cost tradeoffs, and specify the behavior of the RDD when it runs out of memory. Since caching remembers an RDD’s lineage, Spark can recompute loss partitions in the event of node failures. 
Lastly, an RDD that is cached lives within the context of the running application, and once the application terminates, cached RDDs are deleted as well.

Each action generate a separate job in Spark.
To reuse the RDD (Resilient Distributed Dataset) Apache Spark provides many options including:

- Persisting

- Caching

- Checkpointing

>Reusing means storing the computations and data in memory and reuse it multiple times in different operations.  
Usually you need multiple passes through same data set while processing data.

### Persist means keeping the computed RDD in RAM and reuse it when required. Now there are different levels of persistence

    textFile.persist(StorageLevel.MEMORY_ONLY)

**MEMORY_ONLY** 
This level defines that all objects in RDD are serialized as JAVA objects and store entirely in memory. If any partitions cannot be stored in memory those partitions will be recalculated when needed. Use this options if you know the size of data can fit in available memory otherwise if some partitions need to be re-calculated it will significantly degrade the performance of overall job

**MEMORY_AND_DISK** 
This level is same as above but partitions that cannot be store in RAM are save on disk. Access from disk is expensive in terms of duration but it will be much less as compared to re-computations of the partitions that cannot fit in memory

**MEMORY_ONLY_SER** 
This level is exactly same as MEMORY_ONLY but it will serialize the objects before storing in memory. It will save RAM storage requirements but will need de-serialization when partitions are required which is CPU intensive. So you save RAM but CPU processing time is increased

**MEMORY_AND_DISK_SER** 
Objects are serialized and stored in RAM as well as disk

**DISK_ONLY RAM** 
is not used to store RDD, instead all partitions are on disk

**OFF_HEAP** 
Partitions may store off heap memory. Off heap memory needs to be enabled for this storage level to work. Off heap is another topic but for summary this is the memory outside of RAM allocated to Spark worker JVM. It's a bit slow to access data from off heap as compared to on heap but still much better than disk access


### Caching is the same as persist with MEMORY_ONLY storage level as shown in the following code

    textFile.cache()
    // is same as MEMORY_ONLY storage level in persist 
    textFile.persist(StorageLevel.MEMORY_ONLY)


### checkpointing is a sort of reuse of RDD partitions when failures occur during job execution
Checkpoints freeze the content of your data frames before you do something else. They're essential to keeping track of your data frames.
When operating in cluster environment with hundreds of nodes, failure of nodes is the most likely scenario. Even during normal computations JVM processes may fail because of multiple reason. Whatever is the case of failure, re-calculating the lost partitions is the most expensive operation. Best strategy is to start from some checkpoint in case of failure. Checkpointing save some stage of the RDD on disk and breaks the linage of execution in DAG. DAG is the sequence of transformations applied on RDD and in each transformation some computation is performed. Sometimes these computations are expensive and if there is failure then lost partitions needs to be re-computed from beginning. But if we save the state of RDD at some point in DAG on disk then re-computations need not be done all the way from beginning, instead the checkpoint is used as the beginning of re-calculation. Although Spark is resilient and recover from failure by re-calculating the lost partitions but sometime re-execution of very long sequence of transformations is very expensive and performance can be improved if we checkpoint the RDD at some point and use that checkpoint as base to re-calculate lost partitions.

Let's suppose job starts in Spark and goes through stage 1 to 5. Stage 1 is reading data file from disk and then stage 2 through 5 perform some expensive and complicated computations on RDD. Now let's suppose we did not made a checkpoint at stage 3 and some failure occurs in stage 4 or 5. As Spark is resilient and it recovers from failures but because we did not made a checkpoint at stage 3, partitions needs to be re-calculated all the way from stage 1 to point of failure. This is expensive in terms of performance of overall job. Now let's suppose we checkpoint at stage 3. What Spark does is it save the state of stage 3 RDD on some reliable medium like HDFS. Checkpoint will also break the linage of DAG execution and will treat the checkpoint as new base line. That means if any node or partition failure occurs in stage 4 or 5 then instead of computing the lost partitions all the way back from stage 1, checkpoint is used as base line. This strategy will greatly improve the performance of the Spark job in environment where failure may occur due to any reasons. Consider checkpoint as new base line from where all calculations are performed when a partition or stage fails

    Before checkpointing is used, a Spark developer has to set the checkpoint directory using below method
    SparkContext.setCheckpointDir(directory: String)
    
There are two types of checkpointing:

reliable - in Spark (core), RDD checkpointing that saves the actual intermediate RDD data to a reliable distributed file system, e.g. HDFS.

local - in Spark Streaming or GraphX - RDD checkpointing that truncates RDD lineage graph.

*Eager vs Non Eager Checkpointing - Follow the link below for more details

> Persisting or caching with StorageLevel.DISK_ONLY cause the generation of RDD to be computed and stored in a location such that subsequent use of that RDD will not go beyond that points in recomputing the linage.
After persist is called, Spark still remembers the lineage of the RDD even though it doesn't call it.
Secondly, after the application terminates, the cache is cleared or file destroyed

> Checkpointing stores the rdd physically to hdfs and destroys the lineage that created it.
The checkpoint file won't be deleted even after the Spark application terminated.
Checkpoint files can be used in subsequent job run or driver program
Checkpointing an RDD causes double computation because the operation will first call a cache before doing the actual job of computing and writing to the checkpoint directory.

1. [JerryLead/SparkInternals - cache and checkpoint](https://github.com/JerryLead/SparkInternals/blob/master/markdown/english/6-CacheAndCheckpoint.md)
2. [Spark Streaming Checkpoint in Apache Spark](https://data-flair.training/blogs/apache-spark-streaming-checkpoint/)
3. [What Are Spark Checkpoints on Data Frames?](https://dzone.com/articles/what-are-spark-checkpoints-on-dataframes)

