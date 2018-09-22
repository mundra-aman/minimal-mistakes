---
title: "Common ETL transformation scenarios"
layout: single
classes: wide
tags: [data-engineer, ETL]

excerpt: "Most common scenarios and situations a Data Engineer comes across, while building data pipelines and working with big data"

header:
  image: /assets/images/feature_images/ETL.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

ETL include any change that you do to your source data before storing in your target, including conforming different source systems, 
filtering data, adding new custom derived columns etc.

> Parsing and Validation

This is done in a series of map(), flatMap(), filter(), groupByKey(), reduceByKey() and leftOuterJoin() transformations which gets reused across Streaming and Batch jobs

>Data Enrichment and state maintenance

Data enrichment and state maintenance is done under updateStateByKey() in Streaming and mapPartitions() in case of batch processing with the business logic for merging the sessions and enriching the session with additional information getting reused across batch and streaming jobs.

> Data cleaning

> Mapping NULL to 0 

> "Male" to "M" and "Female" to "F"

> Date formats consistency

> Running aggregates

> You have two points (X1,Y1) and (X2,Y2) and you need to store the distance between them in your target

> Data enrichment 

> Feature generation

> Corroboration

> Deduplication

> Data increment, updation, delta delivery 

> Data skewness

> Salting and hashing

> Metric Generation and Save to DB
 
Metrics are generated using flatMap() and reduceByKey() after the Sessionization and data enrichment and are saved to DB