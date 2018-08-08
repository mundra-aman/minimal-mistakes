---
title: "How Apache Spark works internally"
layout: single
classes: wide
tags: [apache spark, analysis, spark]

excerpt: "This post discusses about the working model of Apache Spark in detail."

header:
  image: /assets/images/spark_internals.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

# Apache Spark Q&A's

## How does the spark context read the user code and convert it to tasks?
The driver code generates job, stages and tasks. The entire driver code can be called as one application and each action constitutes a job.
When a job is submitted is to the driver, the job is divided into logical plan and physical plan.

During logical plan the transformations() build the computation chanin a series of RDD. Since each action() triggers a job, during the physical plan the complete dependency graph of transformations is divided in to stages. Unlike hadoop where the execution process is fixed map-shuffle-sort-aggregate, spark doesn't have fixed execution process. The data is computed when they are actually needed in a flow fashion. It starts from the final result of RDD and check backwards the RDD chain to find what RDDs and parititons are needed for computing the final result. During the backtracking if it encounters the ShuffleDependency it cuts the data flow and forms a new stage leaving the chaings of RDD by NarrowDepedency. So it the ShuffleDependency that break out for a new stage.

Within each stage the tasks are exectued and data is pipelined through the transformations. The number of tasks is equivalent to number of partitions number in the RDDs of each stage.
All the tasks are packaged in TaskSet and sent to the TaskScheduler.The Driver actor sends the serialized tasks to CoarseGrainedExecutorBackend Actor on worker node. Upon receiving , the executor deserializes the it to a normal task and runs to get the result. TaskScheduler will be notified that the task is finished, and its result will be processed

If the received task on driver is the last task in the stage, then next stage will be submitted. If the stage is already the last one, dagScheduler will be informed that the job is finished.

From spark 1.4 release, new visualization is added in the Spark UI. Where we can see the DAG visualization of different stages.

How spark driver serializes the task that is sent to executors?
RDD goes through series of transformations with user defined functions / method in object. And these functions are passed to the executors in the form of tasks. These tasks are instances of a Scala class defined in spark-core.


## How do the executors know what is the method that needs to be executed which is wrapped in the task class?
The executor receive a RPC msg with a task description


## How exactly is the serialization helpful here?
Yes, the task contains code that is serialized by a closureSerializer


## How does the spark context read the user code and convert it to tasks?
In a REPL envirenment, spark compile the user code to class files and put on a file server, the executor implements a custom classloader which load the class from the file server on the driver side; the class is actually a function to run against a iterator of records

Spark function passing fundamentally is based on Java Serialization. In Java you can pass any arbitrary code to other machine over network, in can be simple case class or any class with any behavior.

Only one requirement — serialized class needs to be in class path of target JVM.

On startup when you use spark-submit it distributes your jar file to all Spark worker node, it allows driver to pass serialized functions to worker node, and because serialized class is in class path any function that sent from driver can be deserialized.

Spark doesn't define any specific Task class for RDD transformation. If you use it from Scala for map operations you are sending serialized versions of scala Function1.

If you use aggregate/reduce by key etc, it can be Function2. Anyway, it's not anything Spark specific, it's just plain Scala (Java) class.


