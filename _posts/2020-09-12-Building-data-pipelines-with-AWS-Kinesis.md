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

The unit of data stored by Kinesis Data Streams is a data record. A data stream represents a group of data records. The data records in a data stream are distributed into shards.

A shard has a sequence of data records in a stream. When you create a stream, you specify the number of shards for the stream. The total capacity of a stream is the sum of the capacities of its shards. You can increase or decrease the number of shards in a stream as needed.
A producer puts data records into shards and a consumer gets data records from shards.

1. [What is Streaming Data?](https://aws.amazon.com/streaming-data/)

2. [What Is Amazon Kinesis Data Streams?](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)



## Official AWS Links:

1. [Amazon Kinesis Data Streams (KDS) - AWS Home Page](https://aws.amazon.com/kinesis/data-streams/)
2. [Amazon Kinesis Data Streams - Developer Guide](https://docs.aws.amazon.com/streams/latest/dev/kinesis-dg.pdf)



## Writing a python kinesis producer


## Writing a python kinesis consumer
