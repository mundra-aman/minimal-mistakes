---
title: "Building real time data pipelines with AWS Kinesis"
layout: single
classes: wide
tags: [data-engineering, AWS, Kinesis]

excerpt: ""

header:
  image: /assets/images/feature_images/kinesis.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---


	Amazon Kinesis Data Streams is a fully managed and scalable AWS service which enables us to:

	1. ingest, buffer and process data in real time

	2. analyze real-time streaming data as it arrives 

	3. respond instantly instead of having to wait until all your data is collected before the processing can begin


<iframe width="560" height="315" src="https://www.youtube.com/embed/MbEfiX4sMXc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br/>

## Introduction

Kinesis enable architectures to evolve from batch to real-time data processing. It can ingest real-time data such as logs and IoT telemetry data for machine learning and analytics.
The producers continually push data to Kinesis Data Streams, and the consumers process the data in real time. The Consumers can store their results using an AWS service such as Amazon DynamoDB, Amazon Redshift, or S3.
Producers assign partition keys to the records and ingest to the corresponding shards. Consumers retrieve the most recent data in a shard. 

Kinesis data streams can be accessed privately with encryption enabled for better security. IT also provides enhanced fan-out feature that dedicatedly gives double throughput to the consumers.
Producer and consumer applications can be built using efficient AWS libraries and services.

The unit of data stored by Kinesis Data Streams is a data record. A data stream represents a group of data records. The data records in a data stream are distributed into shards.

1. [What is Streaming Data?](https://aws.amazon.com/streaming-data/)
2. [What Is Amazon Kinesis Data Streams?](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)



## Official AWS Links:

1. [Amazon Kinesis Data Streams (KDS) - AWS Home Page](https://aws.amazon.com/kinesis/data-streams/)
2. [Streaming Data Solutions on AWS with Amazon Kinesis](https://d0.awsstatic.com/whitepapers/whitepaper-streaming-data-solutions-on-aws-with-amazon-kinesis.pdf)
3. [Amazon Kinesis Data Streams - Developer Guide](https://docs.aws.amazon.com/streams/latest/dev/kinesis-dg.pdf)
4. [Amazon Kinesis Data Streams FAQs](https://www.amazonaws.cn/en/kinesis/data-streams/faqs/)




## Shards

A shard has a sequence of data records in a stream. When you create a stream, you specify the number of shards for the stream. The total capacity of a stream is the sum of the capacities of its shards. You can increase or decrease the number of shards in a stream as needed.
A producer puts data records into shards and a consumer gets data records from shards.
Shard is the base throughput unit of a Kinesis stream and supports maximum 1MB per second data rate.

•	200 records of 5kb each per second using 1 shard
•	1GB or 0.2 million records per minute with 15 shards

<figure> <a href="/assets/images/post_images/hashi_dojispin.png"><img src="/assets/images/post_images/kinesis_pricing.png"></a> </figure>



## AWS CLI Kinesis commands




## KCL and KPL Java libraries for building producers and consumers

The Kinesis Producer Library (KPL) aggregates small user-formatted records into larger records up to 1 MB to make better use of Amazon Kinesis Data Streams throughput. 
While the KCL for Java supports deaggregating these records.

1. [What is the Kinesis Client Library?](https://docs.aws.amazon.com/streams/latest/dev/shared-throughput-kcl-consumers.html)

One problem, the KCL and KPL are heavily focused on Java, but most of the data scientists love Python.
One can always create amazon-kinesis-client-python library on top of Java MultiLangDaemon for interprocess communication, but it is not recommended.



## Writing a python kinesis producer

1. [Kinesis Data Streams Producers](https://docs.amazonaws.cn/en_us/streams/latest/dev/amazon-kinesis-producers.html)
2. [Implementing Efficient and Reliable Producers with the Amazon Kinesis Producer Library](https://aws.amazon.com/blogs/big-data/implementing-efficient-and-reliable-producers-with-the-amazon-kinesis-producer-library/)



## Writing a python kinesis consumer

1. [Kinesis Data Streams Consumers](https://docs.amazonaws.cn/en_us/streams/latest/dev/amazon-kinesis-consumers.html)


## Python Boto3

	get the list of existing kinesis streams
	create a new kinesis stream
	get the details of a new stream
	publish to kinesis stream
	monitor kinesis stream
	consume records from the stream


