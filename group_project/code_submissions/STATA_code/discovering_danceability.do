#Spotify API Project#
#####################

#Goal: find out how Spotify generates their "danceability" variable

#Step 1: Check for multicolinearity
corr popularity loudness tempo duration_ms energy key instrumentalness speechiness valence danceability

#Step 2: Build a model based on Spotify website's description
reg energy tempo loudness

#Step 3: Multicolinearity issue -> check for this
corr energy tempo loudness

#Step 4: 
reg danceability tempo loudness
gen loudness_sq = loudness^2
gen tempo_sq=tempo^2
reg danceability loudness_sq tempo_sq
reg danceability tempo_sq loudness_sq loudness
reg energy tempo_sq loudness_sq loudness
