---
title: "Serialization in Spark"
layout: single
classes: wide
tags: [data-engineering]

excerpt: ""

header:
  image: /assets/images/feature_images/serialization.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

Serialization is implemented in most distributed applications for performance. 
A serialization framework helps you convert objects into a stream of bytes and vice versa in new computing environment. 
This is very helpful when you try to save objects to disk or send them through networks. Those situations happen in Spark when things are shuffled around. 
RDDs can be stored in serialized form, to decrease memory usage, reduce network bottleneck and performance tuning.

- Java serialization

- Kryo serialization

Under the hood, a dataset is an RDD. 
Store RDD as serialized Java objects (one byte array per partition). 
This is generally more space-efficient than deserialized objects, especially when using a fast serializer, but more CPU-intensive to read.
By default, Java serialization is used.
To enable Kryo, initialize the job with a SparkConf and set spark.serializer to org.apache.spark.serializer.KryoSerializer

    val conf = new SparkConf()
    .set("spark.serializer", "org.apache.spark.serializer.KryoSerializer")
    .set("spark.kryoserializer.buffer.mb","24")
    
    val sc = new SparkContext(conf)

- Every task run from Driver to Worker gets serialized : Closure serialization

- Every result from every task gets serialized at some point : Result serialization

And what’s implied is that during all closure serializations all the values used inside will get serialized as well, for the record, 
this is also one of the main reasons to use Broadcast variables when closures might get serialized with big values.


There are three considerations in tuning memory usage: 
- the amount of memory used by your objects (you may want your entire dataset to fit in memory)
- the cost of accessing those objects, 
- the overhead of garbage collection (if you have high turnover in terms of objects).

In apache spark, it’s advised to use the kryo serialization over java serialization for big data applications. 
Kryo has less memory footprint compared to java serialization which becomes very important when you are shuffling and caching large amount of data.

### Eradication the most common serialization issue:

This happens whenever Spark tries to transmit the scheduled tasks to remote machines. 
Tasks are just pieces of application code that are sent from the driver to the workers.
The classpath of the driver and worker nodes are controlled by the user that is launching the application.
    
    org.apache.spark.SparkException: Task not serializable
            at org.apache.spark.util.ClosureCleaner$.ensureSerializable(ClosureCleaner.scala:304)
            at org.apache.spark.util.ClosureCleaner$.org$apache$spark$util$ClosureCleaner$$clean(ClosureCleaner.scala:294)
            at org.apache.spark.util.ClosureCleaner$.clean(ClosureCleaner.scala:122)
            at org.apache.spark.SparkContext.clean(SparkContext.scala:2055)
            at org.apache.spark.rdd.RDD$$anonfun$map$1.apply(RDD.scala:324)
            at org.apache.spark.rdd.RDD$$anonfun$map$1.apply(RDD.scala:323)
            at org.apache.spark.rdd.RDDOperationScope$.withScope(RDDOperationScope.scala:150)
            at org.apache.spark.rdd.RDDOperationScope$.withScope(RDDOperationScope.scala:111)
            at org.apache.spark.rdd.RDD.withScope(RDD.scala:316)
            at org.apache.spark.rdd.RDD.map(RDD.scala:323)

Ideally something is not Serializable and that threw the issue. Some basic Guidelines made by Databricks to avoid the scenario -

- Make the object/class serializable 

- declare the instance within the lambda function.

- Declare functions inside an Object as much as possible

- If you need to use SparkContext or SQLContext inside closures (e.g. inside foreachRDD), then use SparkContext.get() and SQLContext.getActiveOrCreate() instead

- Redefine variables provided to class constructors inside functions


## Pointers to follow:

1. [Data Serialization](https://spark.apache.org/docs/latest/tuning.html)
2. [How spark handles object?](https://stackoverflow.com/questions/40596871/how-spark-handles-object)
3. [When to use Kryo serialization in Spark?](https://stackoverflow.com/questions/40261987/when-to-use-kryo-serialization-in-spark)
4. [Serialization in Spark](http://www.waitingforcode.com/apache-spark/serialization-in-spark/read)