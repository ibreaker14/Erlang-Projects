# CECS-424-Sp2017---Assignment-3
## Erlang Projects

#### Mingtau Li
#### 011110539

---
## Part One: candy.erl
There are 3 students. Each student starts of with an even number of candies. At the blow of a whistle, each student is to simultaneously pass on half of his/her candies to the person on the right. If a student ends up with an odd number of candies, he/she will receive an extra piece. Passing will continue until all students have the same number of candies. 

---

## Part Two: custom_hashmap.erl
This program reads in a text file and separates all the words into tuples that will eventually be inputted in a hashmap.
There are 4 functions:

````
read_file(File_Name)
````
Reads in a text file and converts all words into tokens.

````
tuples(String,List)
````
Generates a list of tuples that contain a word and frequency of said word.

````
hash(List)
````
Generates hashmap with the words as keys and frequencies as the values

````
sort(File_Name)
````
Users functions 1 and 3 to generate hashmap of words and its frequencies based on text file. Sorts hashmap from highest to lowest according to frequency count.