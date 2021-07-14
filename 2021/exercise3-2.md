
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2021 Workshop (Online)](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Resources](resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](previous.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/FHLimage2018b.jpg" alt="FHL waterfront in 2018">
</div>

## Exercise 3-2: OU Models ##

### Michelle Lawing and Brian O'Meara ###
  
Download the [exercise](https://drive.google.com/file/d/16BI3JwLPJFeWym6rf2smT9Az_L9DCm1T/view?usp=sharing). We will do this together through class, don't rush ahead.

Here's the code we'll be running in a different format.

```
#Here is a basic exercise for OUwie, along with more advanced topics
#Brian O'Meara, July 14, 2021
require('OUwie')
require('geiger')

?OUwie #gives help on OUwie. You can also look at some of the recent changes: https://github.com/thej022214/OUwie/blob/master/vignettes/OUwie_2.1_adds.pdf

#Let's get some data

#First, a tree
phy <- geiger::drop.extinct(geiger::sim.bdtree(b=1, d=.9, stop="taxa", n=80, seed=round(runif(1, 1, 1000)), extinct=FALSE))

#Look at it
plot(phy)

#Now, a discrete state on the tree
q <- list(rbind(c(-.5, .5), c(.2, -.2)))
discrete <- geiger::sim.char(phy, q, model="discrete", n=1)[,,1]

#It is possible that by chance our tips end up in only one state. This is an important result to consider, but for our exercise, it makes later steps hard. So we will instead simulate until we get data we "like". This can create a bias, something we'll talk about more tomorrow.
while (length(unique(discrete))==1 | min(table(discrete))<5) {
	discrete <- geiger::sim.char(phy, q, model="discrete", n=1)[,,1]
}

#With many OU models, there's a "painting" of regimes on the tree (but not all, including the original Hansen (1997) model). This is nontrivial. How do you know where a regime should be, given all the problems of ancestral state reconstruction? We're going to fix the discrete states at their maximum likelihood estimates; a different way would be to do stochastic character mapping, and even better ways (see Boyko et al., in development) fit the regime and OU model jointly.
recons <- ape::ace(discrete, phy, type="discrete")$lik.anc
recons_better <- apply(recons, 1, which.max)
phy$node.label <- recons_better

#Plot the tree and the internal nodes to highlight the selective regimes:
select.reg<-character(length(phy$node.label)) 
select.reg[phy$node.label == 1] <- "black"
select.reg[phy$node.label == 2] <- "red"

tip.reg<-character(ape::Ntip(phy)) 
tip.reg[discrete == 1] <- "black"
tip.reg[discrete == 2] <- "red"

plot(phy, show.tip.label = FALSE, type="fan") 
nodelabels(pch=21, bg=select.reg)
tiplabels(pch=21, bg=tip.reg)


stop("look at the tree!")

#Get the discrete data into OUwie format
discrete_OUwie <- data.frame(taxon=names(discrete), regime=discrete, trait=NA)


#Simulate an Ornstein-Uhlenbeck model with different state means
#and sigma^2 per selective regime, but same alpha
alpha=c(1.0, 1.0)
sigma.sq=c(0.45,0.9)
theta0=1.0
theta=c(1.0,2.0)

stop("what parameters should you use?")

sim.data<-OUwie.sim(phy,discrete_OUwie,simmap.tree=FALSE,scaleHeight=FALSE,
alpha=alpha,sigma.sq=sigma.sq,theta0=theta0,theta=theta)

#Always look at your data:
print(sim.data)

stop("look at the data")

#And look on a tree:
sim.data.to.plot <- sim.data$X
names(sim.data.to.plot) <- sim.data$Genus_species
phytools::dotTree(phy, sim.data.to.plot)
nodelabels(pch=21, bg=select.reg)
tiplabels(pch=21, bg=tip.reg)

stop("look at the data on the tree")

#Now estimate parameters
sim.results <- OUwie(phy, sim.data, model="OUMV", algorithm = "three.point")

#Look at the results
print(sim.results)

#What do these mean?

stop("let's talk")

#Compare true values to estimated:
comparison <- data.frame(true=c(alpha, sigma.sq, theta), est=c(sim.results$solution[1,], sim.results$solution[2,], sim.results$theta[,1]))
rownames(comparison) <- c("alpha1", "alpha2", "sigma.sq1", "sigma.sq2", "theta1", "theta2")
print(comparison)

stop("what do you see?")

#we can repeat this a few times 
nreps=5
all.results <- matrix(nrow=6, ncol=nreps)
for (rep.index in sequence(nreps)) {
	sim.data.loop<-OUwie.sim(phy,discrete_OUwie,simmap.tree=FALSE,scaleHeight=FALSE,alpha=alpha,sigma.sq=sigma.sq,theta0=theta0,theta=theta)
		sim.results <- OUwie(phy, sim.data.loop, model="OUMV", algorithm = "three.point")
		all.results[,rep.index] <- c(sim.results$solution[1,], sim.results$solution[2,], sim.results$theta[,1])
}
all.results <- cbind(comparison, all.results)
colnames(all.results) <- c("true", paste("sim", sequence(nreps+1), sep="_"))
print(all.results)

#What does this tell you?

stop("what does this tell you?")


#Let's try other models, too
#The models are "BM1","BMS","OU1","OUM","OUMV","OUMA","OUMVA" (and you've already done "OUMV")

#We can loop over the models. A faster way to analyze it would be to use mclapply rather than lapply (see the parallel package)
OUwie.model<-function(model, phy, data) {
	print(paste("Now starting model",model))
	return(OUwie(phy, data, model, simmap.tree=FALSE, diagn=FALSE, algorithm="three.point"))	
}
models <- c("BM1","BMS","OU1","OUM","OUMV","OUMA","OUMVA")
results <- lapply(models, OUwie.model, phy=phy, data=sim.data)

#Get the AICc values, put in a vector
AICc.values<-sapply(results, "[[", "AICc")
names(AICc.values)<-models
AICc.values<-AICc.values-min(AICc.values)


print(AICc.values) #The best model is the one with smallest AICc score

best<-results[[which.min(AICc.values)]] #store for later

print(best) #prints info on best model

#Is the best model the generating model? Should it be?

stop("should the best be the true generating model?")

#It is often good to look at uncertainty in the parameter estimates. Let's look at sigma and alpha from the generating model

contour.results <- OUwie::OUwie.contour(sim.results, focal.params=c("alpha_1", "sigma.sq_1"), nreps=100)
plot(contour.results)
```