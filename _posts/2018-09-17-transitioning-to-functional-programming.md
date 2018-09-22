---
title: "Transitioning to functional programming"
layout: single
classes: wide
tags: [scala, functional programming]

excerpt: "Here's I'll be sharing my points to transition from imperative to functional style of programming"

header:
  image: /assets/images/feature_images/functional_programming.jpg
  image_description: ""
  caption: "Photo credit: [**Aman Mundra**](/about/)"

permalink:
published: true
categories: 
---

# Common difference points in functional style of coding

**Pure functions with no side effects** - Given the same inputs, always returns the same output. This makes function calls completely independent of other function calls, 
which can radically simplify changes and refactoring. With impure functions, it’s impossible to fully understand what a function does unless you know the entire history of 
every variable that the function uses or affects.
All useful Pure Functions must take at least one parameter and must return something. 
A pure function will always produce the same output given the same inputs with no side effects.
    
    var z = 10;
    function add(x, y) {
        return x + y;
    }
    console.log(add(1, 2)); // prints 3

All of the below function have what are called Side Effects and hence impure functions. When you call them, they change files and database tables, send data to a server or 
call the OS to get a socket. They do more than just operate on their inputs and return outputs. Therefore, you can never predict what these functions will return.

    writeFile(fileName);
    updateDatabaseTable(sqlCmd);
    sendAjaxRequest(ajaxRequest);
    openSocket(ipAddress);

**Declarative rather than imperative** - Functional programming is a declarative paradigm, meaning that the program logic is expressed without explicitly describing the flow control.
Declarative programs abstract the flow control process, and instead spend lines of code describing the data flow: What to do. The how gets abstracted away.

**Referential transparency** - you can replace a function call with its resulting value without changing the meaning of the program

**Function composition** - process of combining two or more functions in order to produce a new function or perform some computation. For example, f.g or f(g(x))

**Avoid shared state** -  relies on immutable data structures and pure calculations to derive new data from existing data hence eliminating the race condition. 
When you avoid shared state, the timing and order of function calls don’t change the result of calling the function.
  
A change in one function, or the timing of a function call won’t ripple out and break other parts of the program.

**Immutability** - An immutable object is an object that can’t be modified after it’s created. FP have special immutable data structures called trie data structures
which are effectively deep frozen —, meaning that no property can change, regardless of the level of the property in the object hierarchy.
There are no variables in Functional Programming. Stored values are still called variables because of history but they are constants, i.e. once x takes on a value, it’s that value for life.

    // This is illegal in FP
    var x = 1;
    x = x + 1;
 
**Side Effects** - Any application state change that is observable outside the called function other than its return value

**First class functions** - allows us to treat functions as data — assign them to variables, pass them to other functions, return them from functions, etc

**Higher order functions** - any function which takes a function as an argument, returns a function, or both.
The same map() utility can map over objects, strings, numbers, or any other data type because it takes a function as an argument which appropriately handles the given data type.

## Functional programming favors:

- Pure functions instead of shared state & side effects

- Immutability over mutable data

- Function composition over imperative flow control

- Lots of generic, reusable utilities that use higher order functions to act on many data types instead of methods that only operate on their colocated data

- Declarative rather than imperative code (what to do, rather than how to do it)

- Expressions over statements

- Containers & higher order functions over ad-hoc polymorphism


## More Information pointers:

[Functional Programming — A new paradigm](https://www.hackerearth.com/practice/notes/functional-programming-a-new-paradigm/)
[Master the JavaScript Interview: What is Functional Programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)
[Master the JavaScript Interview: What is a Pure Function?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-pure-function-d1c076bec976)
[So You Want to be a Functional Programmer (Part 1)](https://medium.com/@cscalfani/so-you-want-to-be-a-functional-programmer-part-1-1f15e387e536)