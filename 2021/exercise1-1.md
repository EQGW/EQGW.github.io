
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2021 Workshop (Online)](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Resources](resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](previous.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/FHLimage2018b.jpg" alt="FHL waterfront in 2018">
</div>

## Exercise 1-1: Heritability estimation by parent-offspring regression in R ##

### Josef C Uyeda & Stevan J Arnold ###

In this computer exercise we will improve our intuition about heritability in a couple of
ways. First, we will use actual data from a natural population to obtain a point estimate
of heritability using the statistical procedure of regression. We will write and use a
program that can estimate heritability for any one of the 6 traits in our dataset. Second,
we will use bootstrapping to see how our point estimate of heritability is affected by the 
particular sample of mothers and daughters that we use.

We will use the data file, R_inland_snake_data.txt, which is a subset of the data from
these two papers: 

[Phillips, PC and SJ Arnold. 1999.](https://drive.google.com/file/d/1RoXyb4GCRkV7BZZLKPxRTjR7shhFz98y/view?usp=sharing) Hierarchical Comparison of Genetic Variance-Covariance Matrices. I.
	Using the Flury Hierarchy. Evolution, 53(5):1506-1515. 
	
[Arnold, SJ and PC Phillips. 1999.](https://drive.google.com/file/d/1nr2ZnStZ0jMLwlnLyD7g_i7O5Rc8bJc1/view?usp=sharing) Hierarchical Comparison of Genetic Variance-Covariance Matrices. II.
	Coastal-Inland Divergence in the Garter Snake, Thamnophis elegans. Evolution, 53(5):1516-1527.
	
The first step should be to download the Google Drive folder with the exercise.
[Download Google Drive Folder for Exercise 1.1](https://drive.google.com/drive/folders/1-KUgSenqGok_AZcX0oSeNs2OSyMxeLku?usp=sharing)
During the course, I will show you how to open the file in R and access the dataset. 

Your tutorial has two flavors, depending on your preferences. If you don't have the package
`dplyr` installed and/or find its notation completely foreign to you, choose option 2.

1. [dplyr-Version notebook](https://drive.google.com/file/d/11PF_NYRm89-Dz2KvuUy-ALp9jPmP5UTp/view?usp=sharing)
2. [base-Version R script](https://drive.google.com/file/d/1ifZUx_npsuuyfirEHgugN81bu4yd5h9V/view?usp=sharing)

Understanding the dataset in question is the first task. Here is the metadata:

The data are the values of 6 traits in a sample of mothers and their daughters from one
population of a garter snake, Thamnophis elegans. The first line is the header which 
lists the names of the variables (8 columns):
• local = the name of the population
• family = the name of the family (the first row with each family name is the
mother, the rows that follow with the same name are her daughters)
• body = the number of vertebrae in the body
• tail = the number of vertebrae in the tail
• mid = the number of scale rows around the snake, assessed at the middle point of
the body
• ilab = the number of scales on the lower lip (infralabials, sum of left and right
sides)
• slab = the number of scales on the upper lip (supralabials, sum of left and right
sides)
• post = the nmber of scales behind the eye (postoculars, sum of left and right sides)
Missing values are denoted by NA. More information on the traits and the sample can 
be found in Phillips & Arnold (1999) and Arnold & Phillips (1999).

