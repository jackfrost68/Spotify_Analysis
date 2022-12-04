# Spotify-Analysis

Last week Spotify sent out 
Shoutout to xxxx for being the genius behind it. Read my anaylsis of a spotify dataset 


Using data from the [Kaggle] (https://www.kaggle.com/datasets/mrmorj/dataset-of-songs-in-spotify?resource=download) I seek to uncover important attributes related all genres and those of Hip Hop & RnB in particular. 


<ins>*Managing the dataset:*</ins>

After importing different libraries (rpart.plot, gmodels and rpart) I loaded the data set to R-Studio. I then deleted some columns such as id, analysis_url and Unnamed..0 because they offered little significance to the model and predictions. Lastly, I checked for any missing values in the dataset using the is.na function. Fortunately, the dataset had none. 

<ins>*Partitioning the data:*</ins>

Before building the model, I split the data into two sets. 60% of it was used for training the model and 40% was reserved for testing the model. 

<ins>*Buidling a classfication tree model:*</ins>
Using the data from the training portion, I created a model that would predict the genre type relative to all other variables in the dataset such as tempo, danceability and energy. Using the rpart.plot function, I got the plot below. 


<p align="center">
  <img width="600" height="200" src="https://github.com/jackfrost68/Spotify_Analysis/blob/69576ed22747e9916ed78a6d6f4bacc70308b81e/Default%20Tree.jpeg">
</p>

Based on the plot above, based on the model, the most important attribute ofr selecting all genres is the duration_ms, followed by energy and tempo. 

To evaluate model performance, I calculated the benchmark error rate which came to 86%. This error rate is similar to blindly guessing the main attributes that would affect genre selection. 

I created another tree with stopping rules of 2000, 1000 and 0 for the minbucket, minsplit and cp values respectively. To control for overfitting I used the EasyPrune function to prune the tree and got the following plot. 

<p align="center">
  <img width="600" height="200" src="https://github.com/jackfrost68/Spotify_Analysis/blob/69576ed22747e9916ed78a6d6f4bacc70308b81e/Default%20Tree.jpeg">
</p>


Even after pruning, duration, tempo and energy remain important attributes for genre selection. 





Is it just me or have songs become shorter and shorter lately?  


Short attention spans cause music producers snippets 

Favorite artists like ahem! (Sir) Kid Cudi 

<ins>*Conclusion:*</ins>
According to the dataset and model, duration is a key attribute when selecting genres even for HipHop & RnB. 

The drawback to this dataset is the subjective nature of some of the variables. How we measure danceability and loudness of a song can vary by age, gender or nationality. For example, some people prefer faster or mellodramatic love or worship songs. Not mentioning any names but ahem! Sir. Please make longer songs. https://www.youtube.com/@sirvevo2080

Thank you! 
