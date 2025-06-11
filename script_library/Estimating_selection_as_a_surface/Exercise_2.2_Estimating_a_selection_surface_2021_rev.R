##Computational Exercise 2.2: Estimating and plotting a selection surface
##Copyright 2021 Stevan J. Arnold, Josef C. Uyeda & Monique N. Simon

##I. Get your data into R using the following steps.
#Save the file Radix5_2012.txt to your desktop or folder of choice
#Now, set your working directory by
#putting your windows username or specifying the folder you created in the following 	statement.
#Be sure and use the / not the \ spacing convention!

setwd("./")
#Install the following package if necessary:
#install.packages('plyr')
library(plyr)

#Now read in your data
thamnophis = read.table('Radix5_2012.txt',header=TRUE)

#Print out the data frame to make sure it looks OK. Make sure you understand what these data are
#and how they were collected. 
View(thamnophis)

##II. Estimating the selection gradients
#Use the following statements to create standardized versions of BODY, TAIL, and TIME
#We want to standardize BODY and TAIL so that their means are zero and their sds are 1
#We want to standardize SPEED so that it's mean is 1
#These standardizations will simplify the interpretations of the coefficients that we will estimate
new.body=(thamnophis$BODY-mean(thamnophis$BODY))/sd(thamnophis$BODY)
new.tail=(thamnophis$TAIL-mean(thamnophis$TAIL))/sd(thamnophis$TAIL)
new.speed=thamnophis$SPEED/mean(thamnophis$SPEED)

#Do these transformations achieve the right means and standard deviations for the new variables?
#Find out by using statements like mean(new.body), sd(new.body).

#Let us begin by fitting a plane to the transformed data
model.dir <-lm(new.speed~new.body + new.tail)
#print out the coefficients and statistics of the fit
#this output will give us our best estimates of the directional selection gradients for 
#new.body and new.tail. How do we interpret these results?
summary(model.dir)

#Now, fit a full quadratic model to the data, remembering to use the factor of 0.5 for the 
#stabilizing selection gradients. This model will give us estimates of the nonlinear selection gradients, 
#gamma. Create a new variable called prod which is the product of new.body and new.tail
prod = new.body*new.tail
#Then fit the quadratic model
model.quad <- lm(new.speed ~ new.body + new.tail + I(0.5*new.body^2) + I(0.5*new.tail^2) + prod ) #I() allows us to create a new variable using these equations in a single step
summary(model.quad)

#In summary, using z1 for body and z2 for tail,
#Using results for beta from the linear fit and the results for gamma from the quadratic fit, we have

beta1= 0.031408  #model.dir$coef[2]
beta2= 0.001504  #model.dir$coef[3]
gamma11 = -0.010578 #model.quad$coef[4]
gamma22 = -0.005914 #model.quad$coef[5]
gamma12 =  0.079017 #model.quad$coef[6]

#Interpret the coefficients biologically in terms of their meaning on the standardized scale. 
#"beta1 tells us that if we increase the value of new.body by _______, 
#we will increase new.speed by _____."

##III. Plotting the selection surface, an ISS

##First, make an exploratory plot where you plot new.body and new.tail as a scatter plot, 
#and make the size of the points proportional to the variable new.speed.
???

#Now let's actually plot our Individual Selection Surface from our model fits with a contour plot.
#Set the parameters for a full quadratic fitness surface for two traits
z1 = new.body
z2 = new.tail
#Set the value for the intercept of the surface when z1=z2=0
alpha=1
#Define a function called fit that will compute the value of fitness as a function of z1 and z2
surface.fit <-  function(z1,z2, a0=alpha, b1=beta1, b2=beta2, g11=gamma11, g22=gamma22, g12=gamma12)  a0 + (b1*z1) + (b2*z2) + (g11*0.5*(z1^2)) + (g22*0.5*(z2^2)) + (g12*(z1 * z2)) 
#Define a series of values for z1 and z2 that will be used to compute the value of relative fitness on the surface
x <- seq(-2, 2, length = 30)
y <- seq(-2, 2, length = 30)

#Compute the surface values of relative fitness using the x-y grid of values for z1 and 
#z2 for later use by the surface plotting function called persp
#We could use the fit function to compute values of fitness but instead we will use a #function, called outer, that is more compatible with persp
#The function outer has some specific requirements so we oblige by writing our fitness 
#function in the following form

z <- outer(x, y, surface.fit)

#Define two variables that give the number of rows and cols in z
nrz <- nrow(z)
ncz <- ncol(z)

# Create a function interpolating colors in the range of specified colors
jet.colors <- colorRampPalette( c("yellow", "orange") )

# Generate the desired number of colors from this palette
nbcol <- 100
color <- jet.colors(nbcol)

# Compute the z-value at the facet centres
zfacet <- z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz]

# Recode facet z-values into color indices
facetcol <- cut(zfacet, nbcol)

#Finally, plot the ISS
par(bg = "white")
for(i in seq(0,360, 20)){
  persp(x, y, z, col=color[facetcol], xlab="Number of body vertebrae", ylab="Number tail vertebrae", zlab="Crawling speed",phi=30, theta=i)
}

#How do you interpret this surface? Is selection favoring high tail/body vertebrae? Low tail/body vertebrae?

##IV. Plotting eigenvectors on the surface
#For another view of the surface, do a simple contour plot

par(pty ="s")
contour(x, y, z,lwd=2, labcex=1.5,xlab="Number of body vertebrae", ylab="Number tail vertebrae")

#Lets plot the eigenvectors of the gamma-matrix on this contour plot
#First, define the matrix. 
gamma = matrix(c(gamma11, gamma12, gamma12, gamma22), nrow=2, ncol=2)
gamma
eigen(gamma)
#Next, setup the beta vector and check to see if its values are correct
beta = matrix(c(beta1, beta2), nrow=2, ncol=1)
beta
#Using gamma and beta, we can solve for the stationary point on the surface using
#expression(11) from Phillips & Arnold 1989
z.zero = -(solve(gamma)) %*% beta
#Plot the stationary point on the surface
points(z.zero[1,1], z.zero[2,1],pch=8,col='red',cex=2)
#Finally, plot the eigenvectors on the surface
#First plot the first eigenvector
delx1 = z.zero[1]  + 6*eigen(gamma)$vectors[1,1]
delx2 = z.zero[2]  + 6*eigen(gamma)$vectors[2,1]
delx11 = z.zero[1]  - 6*eigen(gamma)$vectors[1,1]
delx22 = z.zero[2]  - 6*eigen(gamma)$vectors[2,1]
x.values=c (delx1, z.zero[1], delx11)
y.values=c(delx2, z.zero[2], delx22)
lines(x.values, y.values, lty=2, lwd=2,col='red')
#then plot the other
delx1 = z.zero[1] + 6*eigen(gamma)$vectors[1,2]
delx2 = z.zero[2] + 6*eigen(gamma)$vectors[2,2]
delx11 =  z.zero[1] - 6*eigen(gamma)$vectors[1,2]
delx22 =  z.zero[2]  - 6*eigen(gamma)$vectors[2,2]
x.values=c(delx1, z.zero[1], delx11)
y.values=c(delx2, z.zero[2], delx22)
lines(x.values, y.values, lty=2,lwd=2,col='red')
#Which of these eigenvectors is gamma max?

#Now, let?s estimate the omega-matrix (What does this represent?). 
#We can approximate it as the negative inverse of the gamma-matrix
omega=-(solve(gamma))
omega

#Its eigenvectors should be opposite those of the gamma matrix.
#Lets check
eigen(omega)
eigen(gamma)

#What is the interpretation of the eigenvalues on the contour plot?

#V. Can you build a loop that will show the surface plot while bootstrapping 
#over the snake sample? We will set you up to do so.

#We begin by writing a function that we will use during bootstrapping to estimate the coefficients that describe the surface for a particular boot sample
#y is the speed
#x1 is the body vertebrae
#x2 is the tail vertebrae
est.coeff=function(y,x1,x2){
  prod=x1*x2
  m1=lm(y~x1+x2)
  m2=lm(y~x1+x2+I(0.5*x1^2)+I(0.5*x2^2)+prod)
  c(m1$coeff[2],m1$coeff[3],m2$coeff[4],m2$coeff[5],m2$coeff[6])
}
#Let's test it out to see if it's what we got before.
est.coeff(new.speed, new.body, new.tail)
#Should be good!

##Next, we program a perspective plot function
x <- seq(-2, 2, length = 30)
y <- seq(-2, 2, length = 30)

# Compute the surface values of relative fitness using the x-y grid of values for z1 and 
# z2 for later use by the surface plotting function called persp
#We could use the fit function to compute values of fitness but instead we will use a #function, called outer, that is more compatible with persp
# The function outer has some specific requirements so we oblige by writing our fitness 
# function in the following form
##Write a function that plots the perspective plot for each bootstrap
persp.boot=function(b1,b2,y1,y2,y12,x=seq(-10,10,length=30),y=seq(-10,10,length=30)){
  z <- outer(x, y, surface.fit, a0=1, b1=b1, b2=b2, g11=y1, g22=y2, g12=y12)
  nrz <- nrow(z)
  ncz <- ncol(z)
  jet.colors <- colorRampPalette( c("yellow", "orange") )
  nbcol <- 100
  color <- jet.colors(nbcol)
  zfacet <- z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz]
  facetcol <- cut(zfacet, nbcol)
  par(bg = "white")
  persp(x, y, z, xlab="Number of body vertebrae", ylab="No. tail vertebrae", zlab="Crawling speed", col=color[facetcol],phi=30,theta=-30)
}

##Test it out
persp.boot(-2,2,1,1,1)

##Now bootstrap over individuals. Note the code below won't work! Fix it so it resamples the data with 
#bootstrap replicates over individuals.

plots = TRUE #Do you want every bootstrap to generate a plot? Set to FALSE if you want to skip (much faster)
n=length(trait1)
gamma.boot <- list()
library(plyr)
for (i in 1:100){
  ??? #resampling individuals with replacment
  boot.speed = ???
  boot.body = ???
  boot.tail =???
    
  boot.coeff =est.coeff(boot.speed ,boot.body ,boot.tail)
  gamma.boot[[i]] = matrix(c(boot.coeff [3], boot.coeff [5], boot.coeff [5], boot.coeff [4]), nrow=2, ncol=2)
 
  eigenvalue1.boot = laply(gamma.boot, function(x) eigen(x)$value[1])
  eigenvalue2.boot = laply(gamma.boot, function(x) eigen(x)$value[2])
  
  if(plots){
    persp.boot(boot.coeff[1],boot.coeff[2],boot.coeff[3],boot.coeff[4],boot.coeff[5],x=seq(-10,10,length=10),y=seq(-10,10,length=10))
    Sys.sleep(0.1)
  }
}

##As you watched the plots go by, what was variable about the individual selection surface? What was invariant?
#Let's save all the results:
boot.results <- list('egv1.boot'= eigenvalue1.boot, 'egv2.boot' = eigenvalue2.boot)


#Plotting the eigenvalue distributions for all the bootstraped gammas:
par(mfrow=c(1,2))
hist(boot.results$egv1.boot,main='Bootstrap of selection surface',xlab='Eigenvalue 1 of the gamma matrix')
x.values =  c(0.0,0.0)
y.values = c(0,50)
lines(x.values, y.values, lty = 2, lwd=2)
hist(boot.results$egv2.boot,main='Bootstrap of selection surface',xlab='Eigenvalue 2 of the gamma matrix')
x.values =  c(0.0,0.0)
y.values = c(0,50)
lines(x.values, y.values, lty = 2, lwd=2)
par(mfrow=c(1,1))
#What do these distributions mean?

#VI. We want now to compare our sampling error distribution of the eigenvalues with a random distribution 
#of eigenvalues (What will this tell us?).
#To do that, we will reshuffle relative speed across individuals and recalculate gamma

perm <- function(performance,trait1,trait2, plots=TRUE){
  par(ask=FALSE)
  n=length(trait1)
  gamma.perm <- list()
  library(plyr)
  for (i in 1:100){
    permfit <-sample(performance) #reshuffling relative speed across individuals
    perm.coeff =est.coeff(permfit ,trait1 ,trait2 )
    
    gamma.perm[[i]] = matrix(c(perm.coeff [3], perm.coeff [5], perm.coeff [5], perm.coeff [4]), nrow=2, ncol=2)
    
    eigenvalue1.perm = laply(gamma.perm, function(x) eigen(x)$value[1])
    eigenvalue2.perm = laply(gamma.perm, function(x) eigen(x)$value[2])
    if(plots){
      persp.boot(perm.coeff[1],perm.coeff[2],perm.coeff[3],perm.coeff[4],perm.coeff[5],x=seq(-10,10,length=10),y=seq(-10,10,length=10))
      Sys.sleep(0.1)
    }
  }
  return(list('egv1.perm'= eigenvalue1.perm, 'egv2.perm' = eigenvalue2.perm))
}

perm.results <- perm(new.speed,new.body,new.tail)

par(mfrow=c(2,1))
hist(perm.results$egv1.perm,main='Permutation of selection surface',xlim=c(-0.1,0.2),xlab='Eigenvalue 1 of gamma matrix')
abline(v = eigen(gamma)$value[1],col='red',lwd=2)
x.values =  c(0.0,0.0)
y.values = c(0,50)
lines(x.values, y.values, lty = 2, lwd=2)
arrows(quantile(boot.results$egv1.boot,0.025),2,quantile(boot.results$egv1.boot,0.975),2,code=3)
hist(perm.results$egv2.perm,main='Permutation of selection surface',xlim=c(-0.2,0.1), xlab='Eigenvalue 2 of gamma matrix')
x.values =  c(0.0,0.0)
y.values = c(0,50)
lines(x.values, y.values, lty = 2, lwd=2)
abline(v = eigen(gamma)$value[2],col='red',lwd=2)
arrows(quantile(boot.results$egv2.boot,0.025),2,quantile(boot.results$egv2.boot,0.975),2,code=3)
par(mfrow=c(1,1))
#What do these distributions mean? What does the red line indicate? What does the arrow indicate?





