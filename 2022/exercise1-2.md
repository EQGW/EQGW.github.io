
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2022 Workshop (Online)](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Resources](resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](previous.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/FHLimage2018b.jpg" alt="FHL waterfront in 2018">
</div>

<table><tr><td><a href="lecture2-1.html">&larr; Previous</a></td><td width="772">&nbsp;</td><td> <a href="lecture2-1.html">Next &rarr;</a></td></tr></table>


## Computational Exercise 2.2: Estimating and plotting a selection surface ##

### Josef Uyeda and Steve Arnold ###

© 2021 Stevan J Arnold, Josef C Uyeda & Monique N. Simon

In this exercise, we will use garter snake data on crawling speed and vertebral numbers to estimate and plot a selection surface, 
or – more accurately – a performance surface.  Crawling speed in the l meter dash was assessed for 174 newborn garter snakes (Thamnophis radix) using procedures described by Arnold & Bennett (1988).  We also have data on the body and tail vertebral counts for each snake 
(see the data file = radix5.txt). Since body and tail vertebrae are part of a functional complex used in snake locomotion, it’s natural 
to think that counts of these vertebral numbers might have a statistical effect on speed.  But, what kind of effect? To find out, we will
estimate selection gradients (directional and stabilizing) for these two traits using crawling speed as our fitness measure.  The estimation procedures that we will use are described by Lande & Arnold (1983) and Phillips & Arnold (1989). 

In addition to estimating a performance surface from the data, we will also explore the sensitivity of that surface to sampling: 
First, we’ll use a program that bootstraps over the sample, plotting a new version of the surface with each new boot sample.  Will the surface 
slightly jutter or will it wildly fluctuate in appearance?  Are some aspects of the surface stable during resampling while others are not? What 
can we conclude about our confidence in our visualization of this performance surface? We will also plot histograms of the bootstrap samples of 
first and second eigenvalues of the surface.  What can we conclude from these distributions? 

Second, we will use a program that computes a null distribution of selection surfaces based on our sample.  To construct this null distribution,
we will use a permutation routine to randomly assign performance values to each individual in the sample.  Then we will plot the surfaces based
on those permutation samples (in each sample, performance is randomly assigned to each individual) in rapid succession.  Does the surface jutter
more or less than in the bootstrap ‘animation’?  Finally, what conclusions can we draw from histograms of first and second eigenvalues in the 
permutation samples?

For additional perspective on the sampling properties of the eigenvalues of the gamma matrix see Reynolds et al. 2010, Chenoweth et al. 2012, 
and the notes for Lecture 2.2.

* [Download Entire Exercise Directory](https://drive.google.com/drive/folders/1-ACjX-ajjfNqcU3u2CQL5u9K_1U4RIBM?usp=sharing)

Individual files:
* [Download dataset only](https://drive.google.com/file/d/1p05Cl0Eo9e8fvZr-PUzfh4wQW9rcuJ7q/view?usp=sharing)
* [Download R script only](https://drive.google.com/file/d/1vGiHe6tN9Z-1NatzWrKE-bXikR_CKoV6/view?usp=sharing)

* [Answers](media/exercise_answers/Exercise_2.2_Estimating_a_selection_surface_2021_rev.html)
