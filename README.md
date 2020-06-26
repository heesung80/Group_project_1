# What Makes a Genre?
When people discuss the "kind" of music they like, a common way to interpret this is by genre. But what does that say about the quality of music within those genres? Our team sought to explore this question by looking at the Spotify API and comparing the qualities of a sampling of songs from each genre. By examining how the traits of songs, like popularity and various "audio features", differ between genres, people can gain a better understanding of how a genre can suit specific tastes.

## Do song audio features of different genres have an effect on each other?
Spotify provides scores of several different "audio features" about every song through their API. These features include measures for how likely someone can dance to a song, how likely the presence of spoken word is, how instrumental it is, and whether it sounds more positive or negative. In order to determine if any of these audio features had an effect on each other, we looked at regression models of all audio features to determine if any of the relationships seemed interesting.

<img src="/group_project/Final_project/outputs/all_scatters.png">

## Which variables in this dataset seem to have a relationship?
<h3> Energy and Danceability</h3>
I regressed the energy variable against the danceability variable to see if a song's danceability were determined in part by a song's energy (or rather, if Spotify might use one variable to artificially define the other). It looks like they have a quadratic relationship, with a high level of overall variation.
<img src="/group_project/Final_project/outputs/scatterDanceability_Energy.png">

There is a problem however. Even though danceability should be the dependent variable in this analysis (the idea being that engergy is a causal factor in a song's danceability) We cannot express the data visually this way because the fit line would not express a function. In order for one variable to be a function of the other, there must be exactly one value of Y for every value of X. Here, there appears to be two. We must flip the IV and the DV, understanding that the underlying relationship would ultimately be the same.
<img src="/group_project/Final_project/outputs/scatterDanceability_Energy.png">
We can see here visually that the relationship is quadratic: a linear regression line does not fit the data.
<img src="/group_project/Final_project/outputs/regressEnergy_Danceability.png">
A parabola fits the data nicely.
(Note: seaborn does not provide slope and intercept. I am still working on figuring out how to collect these and to establish statistical significance using Python. Later though, I will demonstrate that the relationship is significant using different methods).
<img src="/group_project/Final_project/outputs/snsenergy_dance_parabola.png">

<h2> Q3: Does the relationship between energy and danceability vary by genre?</h2>
First, I created a list of substantively interesting genres based on my own discretion as a researcher. I chose a handful of genres that I thought most people could identify easily. Next, I created a scatter plot fitting the quadratic relationship for each of these genres. As you can see, the relationship between each genre visually differs in a very visible way. Some of these scatterplots are too close to each other to discern a unique relationship clearly, but others are very distinct in terms of their overall levels of danceability and the strength of the curve.

In order to know for certain that these are unique relationships, we would need two things (besides measures of overall model robustness) that are not provided here:
1. an analysis of the difference between means in terms of danceability for each of these variables, in order to determine that the genres represent unique musical populations.
2. An analysis of the difference between beta values, to determine if the slopes in each relationship were significantly different from one another.
<img src="/group_project/Final_project/outputs/snsgenrelist_parabolas.png">

## How does song duration vary by genre?
There is a great deal of variation in song length between genres. In our examination of genres, we found that 'minimal-techno' had the longest average song length, while 'grindcore' had the shortest.

<img src="/group_project/Final_project/outputs/Average_duration_bar_graph.png">

## Which genres are most and least popular?
Spotify's popularity rating is based on a the total number of plays compared to other tracks, as well as how recents those plays are. The value will be between 0 and 100, with 100 being the most popular.

Among 122  genres queried, Pop was the most popular and holidays was the least popular. It would be interesting to explore if there is overlap between the genres and how much exists between Pop and other genres that score similarly high. Are there popular genres out there that aren't included in Pop music?

<img src="outputs/Average_popularity_bar_graph.png">

## Are there clear correlations in the audio qualities of genres, that derive from different continents?
All Genres have Energy levels that spiked well above their respective other Audio Features. Speechiness, Danceability and Valence all had similar profiles throughout all the genres, so perhaps in the production of music, these influences each other. In conclusion - energy seems uninfluenced by other Audio Attributes, although all other Attribues are within a similar range.<br><br>
<img src="/group_project/Final_project/outputs/Asian_Genre_Audio_Attributes.png">
<img src="/group_project/Final_project/outputs/European_Genre_Audio_Attributes.png">

## Does genre have an affect on song key?
There does appear to be a relationship between genre and key. When looking at the percentages of all songs from the sample ignoring genre, the distribution of keys is relatively equitable between keys A, G, C, D, and C#/Db, again between keys F, B, and E, and again between F#/Gb, G#/Ab, and A#/Bb. D#/Eb is the least used key in songs across genres by a wide margin.

<img src="/group_project/Final_project/outputs/spotify_keys.png">

Looking at individual genres, however, songs tend to concentrate in just a few keys, in some genres more than others. In "hip-hop" the predominant key is C#/Db, with 20% of songs falling within this key and the second most used key being G at 14%. However, classical music is split, with keys D and G being the most popular keys with 16% shares each.

<img src="/group_project/Final_project/outputs/classical_keys.png">
<img src="/group_project/Final_project/outputs/death-metal_keys.png">
<img src="/group_project/Final_project/outputs/hip-hop_keys.png">
