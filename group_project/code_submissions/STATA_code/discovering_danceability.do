#Spotify API Project#
#####################

#Goal: find out how Spotify generates their "danceability" variable

#Step 1: Check for multicolinearity
corr popularity loudness tempo duration_ms energy key instrumentalness speechiness valence danceability

#Step 2: Build a model based on Spotify website's description
reg energy tempo loudness

#Step 3: Multicolinearity issue -> check for this
corr energy tempo loudness

#Step 4: Build a better model
reg danceability tempo loudness

#Step 5: Test plausible quadratic relationship
###generate variables
gen loudness_sq = loudness^2
gen tempo_sq=tempo^2
###test new model
reg danceability loudness_sq tempo_sq

#Step 6: Check if linear element still adds explanatory power
reg danceability tempo_sq loudness_sq loudness

#Step 7: Check if both linear elements add explanatory power
reg danceability tempo_sq tempo loudness_sq loudness

#Step 8: check competeing model
#This model produces the best fit for danceability, but I wonder
#if perhaps we have the wrong dependent variable. Let's test energy as the DV.

reg energy tempo_sq loudness_sq loudness
#This model has superior model fit. over 60% of the variance in energy is 
#explained by the independent variables. All t values are statistically 
#significant, as well as F. We did not discover the answer to our 
#original research question, but we discovered something else equally
#interesting

