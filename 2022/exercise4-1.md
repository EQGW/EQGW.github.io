
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2022 Workshop (Online)](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Resources](resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](previous.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/FHLimage2018b.jpg" alt="FHL waterfront in 2018">
</div>

<table><tr><td><a href="lecture3-4.html">&larr; Previous</a></td><td width="772">&nbsp;</td><td> <a href="exercise4-1.html">Next &rarr;</a></td></tr></table>

## Exercise 4-1: OU Models and Methods ##

### Brian O'Meara and Samantha Price ###
  
Sam Price [Simulation Exercises](https://drive.google.com/drive/folders/1tlO2riQOHjCBQaD6GP6QXSnwW2nOOajW?usp=sharing) this is a bonus exercise and won't be covered in class (note the OUwie example is a little out of date given the new contour analyses Brian covered yesterday).

Brian O'Meara [MeasurementError.R](https://drive.google.com/file/d/1Y5YLuic8-rSrXBV1c8pI757CLs3gMgm9/view?usp=sharing)

```
library(OUwie)
library(plyr)
library(parallel)
library(knitr)
library(ggplot2)

## Measurement error

#Let's do some investigations to see how measurement error could matter.

# Get a tree and some data. In this case, stored in OUwie; you could use your own data and tree instead
data(sim.ex, package="OUwie")


#Set up the model parameters

alpha=rep(2,2)
sigma.sq=rep(.45, 2)
theta0=10
theta=rep(10,2)

stop("What model is this?")

#Next, make up the data

sim.data<-OUwie::OUwie.sim(tree, trait, simmap.tree=FALSE,
  scaleHeight=FALSE, alpha=alpha, sigma.sq=sigma.sq,
  theta0=theta0, theta=theta)

#Look to see if it's ok. 

print(sim.data)

#Including on the tree
sim.data.to.plot <- sim.data$X
names(sim.data.to.plot) <- sim.data$Genus_species
obj <- phytools::contMap(tree, sim.data.to.plot) #Note this is using Brownian motion for the reconstructions. Is that right?
n<-length(obj$cols)
obj$cols[1:n]<-colorRampPalette(c("blue","gray", "red"), space="Lab")(n)
plot(obj)

stop("Does this dataset have uncertainty at the tips? Is this obvious from looking at it?")

#Now, let's think about a range of combinations we could try.

mserr.vector <- seq(from=0, to=.25*max(sim.data$X), length.out=10)

stop("Are these ranges that you'd expect for your data? If not, change them (though do include zero).")


models.vector <- c("BM1", "OU1")
mserr.argument.vector <- c("none", "known")
all.analysis.combinations <- expand.grid(model=models.vector, mserr = mserr.argument.vector, stringsAsFactors = FALSE)
print(all.analysis.combinations)


#We're going to make some functions to make running this all easier. 


#' Do a single OUwie run for a model and summarize the results
#' @param model Model name, as for OUwie
#' @param mserr "known" or "none" as for OUwie
#' @param new.data OUwie-formatted data.frame
#' @param phy Phylo object with node labels
#' @return Data.frame summarizing this run
ouwie.single.run <- function(model, mserr, new.data, phy) {
  result <- OUwie::OUwie(phy, new.data, model=model, mserr=mserr)
  result.df <- data.frame(mserr=mserr, alpha=result$solution['alpha',1], sigma.sq=result$solution['sigma.sq',1], theta=result$theta[1,1] , AICc=result$AICc, model=model, stringsAsFactors = FALSE)
  return(result.df)
}

#' Compute everything for a given mserr.value. Note we use the same dataset for each combo
#' @param mserr.value The value of measurement error
#' @param all.combos The data.frame of all analysis combinations
#' @param new.data The simulated data
#' @param phy Phylo object with node labels
#' @return A data.frame of results for each element in the combinations
compute.w.error <- function(mserr.value, all.combos = all.analysis.combinations, new.data = sim.data, phy=tree) {
  #First add true measurement error to our data
  new.data$X <- stats::rnorm(length(new.data$X), mean=new.data$X, sd=mserr.value)
  new.data$mserr <- mserr.value
  all.result.df <- data.frame()
  for (i in sequence(nrow(all.combos))) {
    # Note that this is a slow way to write this: it has to keep adding to the object in memory. Look at plyr or dplyr for faster ways to do this
    all.result.df <- rbind(all.result.df, ouwie.single.run(model=all.combos$model[i], mserr=all.combos$mserr[i],  new.data=new.data, phy=phy))
  }
  rownames(all.result.df)<-NULL
  all.result.df$mserr.value = mserr.value
  all.result.df$delta.AICc = NA
  all.result.df$delta.AICc[which(all.result.df$mserr=="none")] <- all.result.df$AICc[which(all.result.df$mserr=="none")] - min(all.result.df$AICc[which(all.result.df$mserr=="none")])
  all.result.df$delta.AICc[which(all.result.df$mserr=="known")] <- all.result.df$AICc[which(all.result.df$mserr=="known")] - min(all.result.df$AICc[which(all.result.df$mserr=="known")]) 
  return(all.result.df)
}


#Now, we do a bunch of runs.

#This stip will take all your computer's cores by default. You can use lapply instead of parallel::mclapply to use one, or set within mclapply the mc.cores argument to some number to use that number of cores
all.results <- plyr::rbind.fill(parallel::mclapply(mserr.vector, 
compute.w.error, all.combos = all.analysis.combinations, new.data = sim.data, phy=tree))

all.results$mserr.fraction <- all.results$mserr.value / max(sim.data$X)
all.results$model_type <- paste(all.results$model, all.results$mserr, sep="_")

#Look at the results. First the ones with no error in the data.

#The *_none models assume there is zero measurement error. The *_known models are given the true measurement error and use that in their estimates.

View(subset(all.results, mserr.fraction==0))

stop("Why are there pairs of identical models?")

#Now let's look at the opposite extreme

View(subset(all.results, mserr.fraction==max(all.results$mserr.fraction))) #note: see how I'm not hardcoding here? I'm using max, not a particular value like 0.25

stop("What do you notice about the values that are similar or different?")

#Ok, now let's look at the whole thing

View(all.results)

## Plot the results

### AIC 

ggplot2::ggplot(data=all.results, aes(x=mserr.fraction, y=delta.AICc, colour=model_type)) + ggplot2::geom_line(alpha=0.9) + scale_colour_brewer(palette = "Set2")

stop("What does this plot mean? What's the generating model? Compare BM1 known and none; compare OU1 known and none")

## Sigma-squared

stop("Before you run this, which models should have the highest estimates?")

ggplot2::ggplot(data=all.results, aes(x=mserr.fraction, y=sigma.sq, colour=model_type)) + ggplot2::geom_line() + scale_colour_brewer(palette = "Set2")  + ggplot2::geom_hline(yintercept=sigma.sq[1], linetype="dotted", color="black")

stop("Were you right?")

## Alpha

ou1_data <- subset(all.results, model=="OU1")
ggplot2::ggplot(data=ou1_data, aes(x=mserr.fraction, y=alpha, colour=model_type)) + ggplot2::geom_line(alpha=0.5) + ggplot2::scale_color_viridis_d(end=0.8)

## Theta

ggplot2::ggplot(data=ou1_data, aes(x=mserr.fraction, y=theta, colour=model_type)) + ggplot2::geom_line(alpha=0.5) + ggplot2::scale_color_viridis_d(end=0.8)

stop("Which parameters are most sensitive to ignoring measurement error? Why?")
```
