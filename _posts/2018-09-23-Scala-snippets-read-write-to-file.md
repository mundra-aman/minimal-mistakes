---
title: "Scala Snippets - Read/Write to a file"
layout: single
classes: wide
tags: [scala, functional programming]

excerpt: "Ways to read and write to a file using scala"

header:
  image: /assets/images/feature_images/scala_write.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

# Reading/Writing to a file - Scala I/O

Open, read and write files in Scala
Scala doesn't provide any native class/library support when it comes to writing output to a file or reading a file.
So we borrow java I/O class in scala, create a new instance of PrintWriter and pass a new File object to it:
    
    import java.io._        // to write to the file
    
    //create a new file
    val writer = new PrintWriter(new File("demo1.txt"))
    
    //call the method write() on the object we created 
    writer.write("This is a demo")
    
    //close it
    writer.close()
    
**concise way of writing a file in scala**
    
    import java.io.PrintWriter
    new PrintWriter("filename") { write("file contents"); close }
    
while this is a one liner, it is unsafe. The approach looks nice, it is neither exception-safe nor encoding-safe. 
If an exception happens in write(), close will never be called, and the file won't be closed.
    
PrintWriter also uses the default system encoding, which is very bad for portability. 
And finally, this approach generates a separate class specifically for this line.
Scala already generates tons of classes even for a simple code.

    
    
**Consuming a file in scala**
 
    //Read a file
    //to read a file, call the fromFile() method of class Source, with the filename as argument
    import scala.io.Source  // to read a file
    Source.fromFile("demo1.txt").mkString   // reads into a single line
    scala.io.Source.fromPath("file.txt").getLines.reduceLeft(_+_)
    
The above leaves the file open, however. To avoid problems, you should close it like this:

    val source = scala.io.Source.fromFile("file.txt")
    val lines = try source.mkString finally source.close()
    
Another problem with the code above is that it is horrible slow due to its implementation nature. For larger files one should use:
    
    source.getLines mkString "\n"
    
Refrain from reading an entire file into a single String. The getLines method returns a value of type Iterator[String]. 
It's effectively a lazy cursor into the file, allowing you to examine just the data you need without risking memory glut.
    
    //to read individual lines instead of the whole file at once, use the getLines() method
    Source.fromFile("demo1.txt").getLines.foreach{x=>println(x)}
    
    //iterator can also be used to get one line at a time
    val it = Source.fromFile("demo1.txt").getLines()
    it.next()
    it.next()
    
    //method take(n) to return the first n values from the iterator
    it.take(2)
    
    //print all the lines using while loop
    while(it.hasNext){ print(it.next()) }
    
    //method slice(start,until) returns an iterator over lines start to until-1.
    it.slice(1,5)
    
    