# Spotify-Analysis


Last week Spotify sent out their yearly Spotify Wrapped feature. I noticed most of my songs were under 3 minutes. So using data from the [Kaggle], I built a classification tree model to analyze genre selection and song duration over the last few years.  (https://www.kaggle.com/datasets/mrmorj/dataset-of-songs-in-spotify?resource=download) 


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
  <img width="600" height="200" src="https://github.com/jackfrost68/Spotify_Analysis/blob/bc3e5b53bd1c80f377c7617ac00d4b93e98c7a5f/Tree%20after%20pruning.jpeg">
</p>


Even after pruning, duration, tempo and energy remain important attributes for genre selection. Additionally, after pruning, the error rate fell from 86% to 51%. 

To investigate further, I reduced the dataset to one that only had RnB and HipHop genres. After running the model, I got the plot below;

<p align="center">
  <img width="600" height="200" src="https://github.com/jackfrost68/Spotify_Analysis/blob/57f678bb30e428f3ee9d3c40a774d4d956048328/HipHop%20&%20RnB%20tree.jpeg">
</p>

In this case, speechiness, followed by duration were the defining attributes for RnB and HipHop genres. Speechiness is defined as the presence of spoken words in a track.

Lastly, using Excel, I analyzed the average duration of songs over the years. In the dataset, the duration is in milliseconds. So I converted each row to minutes and plotted it againt the last ten years and got the plot below. 

<p align="center">
  <img width="600" height="200" src="https://github.com/jackfrost68/Spotify_Analysis/blob/e1d554d1aeb205d79feb4d00499808b25c021caf/Avg%20Duration%20of%20songs%20over%20the%20years.png">
</p>



<ins>*Conclusion:*</ins>

According to the dataset and model, duration is a key attribute when selecting genres even for HipHop & RnB. This insight is useful to producers and artists when determining how to strucutre and sell their songs. With TikTok 


  Short attention spans cause music producers snippets 

Favorite artists like ahem! (Sir) Kid Cudi Not mentioning any names but ahem! Sir. Please make longer songs. https://www.youtube.com/@sirvevo2080

Thank you! 


The drawback to this dataset is the subjective nature of some of the variables. How we measure danceability and loudness of a song can vary by age, gender or nationality. For example, some people prefer an upbeat love songs while others more melodramatic. 
