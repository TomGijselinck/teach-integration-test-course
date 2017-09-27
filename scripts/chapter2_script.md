--- video_exercise_key:8da6f042a7

## Measuring model performance or error

Hi there! By now, you got be acquainted with the basics of machine learning. Next up is finding out whether the machine learning you did was any good or not. In other words, how can you assess the quality of a model after you learned it? Well, it depends. First of all, you have to define performance. This definition depends on the context in which you want to use the model. In some cases, the accuracy of a model can be the most important thing. In other cases, the computation time is a good indicator of performance, and in even other cases the interpretability of the model is essential. Next, there are also these three different tasks in machine learning: classification, regression and clustering. Each of these have different performance measures. I'll discuss every one of these in some more detail in this video.

In classification systems, accuracy and error are the basic measures of performance. Basically, they reflect the number of times the system is right or wrong. If accuracy goes up, the error goes down. Typically, accuracy is simply the number of correctly classified instances over the total amount of classified instances. The error is 1 minus the accuracy. 

Remember the classification of squares we discussed before? Each square had a set of features. For example, a square could be small and have dotted lines. Suppose each square has a label as well. This time, it can be colored or not colored, positive or negative, so we're dealing with a binary classification problem. Suppose you develop a classification system that labels 2 squares as positive and 3 as negative, like this. In reality, however, the model only classified 3 squares correctly. 1 positive square was wrongly classified as negative and 1 negative square was wrongly classified as positive. The accuracy of this model is calculated as 3 divided by 5: 60%. These are the number of correctly classified squares divided by the total number of squares, as you can see here. 

However, accuracy does not always tell the whole story. Think of a classifier that has to predict whether patients have a very rare heart disease or not. A classifier that simply predicts that every patient is not sick will still have a high accuracy. Misclassifying one patient who has the disease and classifying 999 other patients correctly as not having the disease, results in an accuracy of 99.9%. However, you can intuitively feel that this classifier is bogus and should not be used as a predictor. This is why it is always interesting to calculate the confusion matrix.

A confusion matrix consists of rows and columns both containing all available labels. Each cell in the confusion matrix contains the frequency of instances which are classified in a certain way. For now we will focus on binary classifiers; we call one class positive and the other negative. 

The upper left corner of the matrix contains the frequency of true positives: instances which are correctly classified as positive. 

The lower right corner contains the frequency of true negatives: the instances which are correctly classified as negative. 

The upper right corner contains the frequency of false negatives: these are instances which are classified as negative, but are in fact positive. 

Finally, the lower left corner contains the frequency of false positives: instances which are classified as positive, but are in fact negative. 

Through these measures, the accuracy as well as new ratios, like precision and recall, can be calculated. 

The precision is the rate you get when dividing the true positives by the true positives plus the false positives. The recall is the rate you get when dividing the true positives divided by the true positives plus the false negatives.

Specifically for the problem of classifying squares, we can create the following confusion matrix. We said that 1 positive square was correctly classified as positive, a true positive. 

2 negative squares were correctly classified as negative, these are true negatives. 

One positive square was wrongly classified as negative, a false negative, and one negative square was wrongly classified as a positive, a false positive.

In this matrix the accuracy can be calculated as the sum of the diagonal numbers divided by the sum of all the numbers. The precision will be calculated like this and the recall can be measured as follows.

You can also build a confusion matrix for the disease classifier. Out of 1000 people, there are 999 healthy persons and 1 sick person. Our classifier, however, labels all of them as not sick. The confusion matrix thus looks like this.

Altough the accuracy is 99.9%, the recall is 0%. The precision is not defined because there are no positive predictions.

Now for regression. To compare the performance of regression algorithms you can use the root mean squared error, or RMSE. This term is calculated by first taking the sum of the squared difference between the predicted and the real values. Next, you divide this value by the number of values and you wrap up by taking the square root. In the following plot you can see that term is strongly related to the mean distance between the points and the regression line. If these distances are small, the RMSE will be small. If they are large, the RMSE will be large. In the chapter about regression, you will learn more about the RMSE and other measures in regression.

Finally, there are also different ways to see whether a clustering algorithm did a good job. Here, you have no label information whatsoever, so you'll have to go with distance metrics between points. More specifically, the performance measure for a clustering is always comprised of two elements: on the one hand, there's the similarity within each cluster, so how points in the same cluster are alike, and on the other hand, there's similarity between clusters, so how the points in two different clusters are similar. You'll want the first metric, the within cluster similarity, to be high, while the second metric, the between cluster similarity, should be low. 

There are many different techniques to measure these two concepts. For within cluster similarity, there is the within cluster sum of squares, or the cluster diameter, among many others. The smaller the sum of squares and the smaller the diameter, the more your points inside the same cluster are similar. For between cluster similarity, you can use things like the between cluster sum of squares or the intercluster distance. The higher they are, the less similar the clusters are, so the better the clustering did its job. These are pretty technical measures that involve some fancy equations; you'll learn all about them in the interactive exercises.

A popular performance index to compare clustering algorithms is the Dunn index. Specifically, the Dunn index is the ratio of the minimum intercluster distance between two clusters divided by the maximum diameter found in the clustering.

There are tons of performance measures out there, and these were just a few of them. The most important thing is to think critically about the models you're training and also to interpret the performance measures correctly. This is something you'll get good at with experience. For now, let's practice what you learned in the exercises.

--- video_exercise_key:2a627665a3

## Training set and test test

In this video, I'll take you a step closer to the root of the difference between supervised learning in machine learning and classical statistics: it's all about predictive versus descriptive power. With supervised learning, it is essential that your learned model will have a strong predictive power. If a model has strong predictive power, it is able to make good predictions about new, unseen observations. Classical statistics on the other hand, is typically more concerned about how good your model fits your complete dataset, to explain or describe the data. 

When learning a predictive model, you do not use the complete dataset to train your model. You only use the so called training set for this. The other part of your dataset is called the test set. This part, that you're not using to train your model, can be used to evaluate the actual performance of the model. It's very important to realize that the training set and the test set are disjoint sets, they don't have any observations in common. This clear separation makes it possible to test your model on new, unseen data. In other words, the test set can assess whether the model you learned generalizes well to unseen data.

Take a classification problem for example. Assume you have a dataset with N observations, K features and a class label for each observation, y. For the training set, you will use the first r observations. In the training set, you will use the features and the class label to train a model. For the test set, you use the observations starting from r+1, until the end of the dataset. In the test set, you use the features to classify the observations, and compare the prediction with the actual class y. The confusion matrix that results gives you a clear idea of the actual predictive performance of the classifier. 

It is important to understand that the concept of these two sets is only important in a supervised learning setting. For unsupervised learning techniques, like clustering, it is not relevant to talk about training or test set. There's no notion of 'training' your model, because you're data is not labeled.

The following diagram gives a nice workflow of how to assess the predictive power of a model. You can use all performance measures explained in the previous exercises on the test set. I can't stress enough that measuring predictive power should not influenced in any way by the instances in the training set. Before you can do some more exercises, there are three more things I want to discuss.

First, there's the problem of which instances go in the training set and which go in the test set. Typically, you should choose a training set which is larger than your test set. You don't want to waste too much of your precious training examples just to test your model, right? You'll typically see a ratio 3/1 for the training set over the test set, but this number is quite arbritary. Just keep in mind that most of the time, the more data you use to train, the better your model. However, make sure your test set is not too small; you still want your performance measures to be a good estimate of the overall performance of your model.

Second, it is important that you choose wisely which elements you put in your training and which ones you put in your test set. For classification, the classes inside your training and test set should be have similar distributions. You want to avoid that a class is not available in one of the sets. For regression, you want to make sure that you have instances that span the entire feature space in both sets.

Finally, be aware of the fact that sampling the data in a certain way to compose the test set, can influence the performance measures on the test set. To fix this, you can use cross validation. Cross validation means that you will use your learning algorithm to train a model multiple times, each time with a different seperation of the training and test set. 

Have a look at this example, where we test a model using 4-fold cross validation. This means the first time the model is trained, the first 3/4 of the dataset is used as a training set, and the last 1/4 will be used as a test set. The next step, the test set shifts and the training set shifts as well. The model is trained again, using the new training set, and tested on the new test set. This is done four times, for each fold, and the performance measures on the 4 test sets are aggregated to form a robust measure. 

An n-fold cross-validation means the dataset is folded n times with the test set each time being 1/nth of the total dataset.

Now that you've learned about the training and test set, let's see how you do on the exercises!

--- video_exercise_key:8bd35cbf98

## Bias and Variance

Hello again! In the previous videos of this chapter you've learned about accuracy and other performance measures, as well as the difference between the training and test set. 

In this video, I'll knit everything together. I'll explain how splitting the data affects the accuracy and what over and -underfitting are.

Let's begin by introducing two essential elements in machine learning: bias and variance. 

These concepts reveal the key challenge of machine learning, so it's important that you understand them. You already know that prediction is the main goal of supervised learning techniques. Basically, the prediction error of a model can be split into two components: the reducible and the irreducible error. 

The irreducible error can be seen as noise, or irregularities in the data. It should not be minimized when training a model. 

We are more interested in the other kind of error, the reducible error. The lower it is, the better our learning algorithm. It can be split in an error due to bias and an error due to variance. 

Error due to bias is error because of assumptions you make when you specify the learning algorithm. It's the difference between predictions, made by models using _this_ learning algorithm, and the true values. 

An example. Suppose you have these points in two-dimensinoal space.

In reality, you can see that it can be fit by a quadratic curve, it's quadratic data.

Now suppose you're assuming the data is linear. You decide to use a linear regression algorithm to fit the data. 

The error due to bias here will be high, because you're restricting your model; it's not able to fit to the more complex quadratic shape of your data. In general, a high bias restricts a learning algorithm to incorperate complex behavior of variables. Basically, the more you restrict the model that can be built by your learning algorithm, the higher your bias. 

The other element of the reducible error is the error due to variance. This is the prediction error that is caused by the sampling of the dataset. A model with high variance fits the training set very closely.

Suppose you have the same quadratic data as before.

This time, you're fitting a polynomial perfectly on the training set. This algorithm has a very low bias, it has few restrictions. However, it will have a very high variance.

Between the training points, the fitted polynomial is all over the place. If you slightly change the values of the training set, the fit changes completely, and so will the predictions for a subsequent testing stage. In general, a model with a high variance will fit the training set points very closely, also fitting on the noise in the training set. This leads to models which are less good at generalizing to unseen data, like the test set. 

Also, it's clear now that low bias, so not restricting your learning model and allowing it to fit perfectly, leads to high variance. On the contrary, if the bias is high, the model is more restricted, and the variance is lower, because it is less sensitive to changes in the training set. This is called the bias-variance tradeoff.

So what do overfitting and underfitting mean? Well, when splitting the data, the accuracy of a model with high variance will depend heavily on which data is in the training set. Basically, with high variance you fit the training set too good. This is called overfitting. Overfitting means the model is perfect to describe the training set, but it generalizes bad to the test set. You could say that the model is too specific.

Underfitting means that you restrict the model too much, its bias is too high. You could say that the model is too general.

Lets look at an example. Suppose where deciding whether an email is spam or not. You have a training set with a lot of emails and extract two features out of each email: the number of capital letters and the number of exclamation marks. 

Suppose emails with a lot of capital letters and a lot of exclamation marks are usually spam, others are no spam, like this. 

However, there's one email with a 50 capital letters and 30 exclamation marks that is not spam, it's an exception. 

Now you use this data to train a model. 

An overfit model would mark emails with a lot of capital letters and exclamation marks as spam, but would make an exception for emails with 50 capital letters and 30 exclamation marks. The model is too specific, as it incorporates the one exception in the model. 

An underfit model could be a model which just marks all emails with more than 10 capital letters as spam and others as no spam, like this. It is too general.

That was all very theoretical. Let's develop an intuitive feeling with these concepts in the exercises!
