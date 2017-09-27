--- video_exercise_key:bcc46f3ba5

## Machine Learning: What's the challenge?

Hello! Welcome to the first video of the Introduction to Machine Learning course. My name is Gilles, I'm a content creator at DataCamp and in this course, me and my collegue Vincent will explain some general concepts about machine learning. After this course, you'll be able to tell what machine learning is and what it isn't, how to solve some basic machine learning problems and how to think critically about your data and your results.

But first things first: What on earth _is_ Machine Learning?

At a very basic level, Machine Learning explores the construction and usage of algorithms that can learn from data. But when does a machine actually learn? We can say that a machine has the ability to learn if it is able to improve its performance in solving certain tasks when it receives more information. This 'experience' typically comes in the form of observations on how particular instances of a problem were solved before. 

Maybe an example will clarify. A possible task for a computer could be to label squares with a color, based on the square's size and edge. Initially, the computer has no idea how to do this. However, suppose that a number of squares were labeled earlier by humans. For example, a small dotted square was labelled green, a big striped square was said to be yellow, a medium sized square with a normal edge was labeled green as well and lastly a small striped one was labeled yellow. A machine learning algorithm can use these observations, or instances, to do an informed guess about how to label an unseen square. An example could be a medium striped square. The computer can be right or wrong in doing so. 

This specific example was a classification problem. There are many types of machine learning problems; some are related and others are pretty exotic. A concept that keeps popping up is the presence of input knowledge, or simply data. In our example, it was the set of human-labelled squares. In other examples, it can be something totally different. Typically, this data is a data set, containing a number observations that each have a well-defined number of variables, often called features. Each square and its corresponding color is an observation, the features in this case are the size and edge. The color is the label of the square. 

As you are well aware, in R, a data set is typically represented by a data frame. Have a look at this code that builds the `squares` data frame for our example.


In a data frame, the observations correspond to the rows and the columns correspond to the variables. To find out the dimensions of your data set, you can use the `dim()` function: we see that we are dealing with 4 observations, and 3 features. The `str()` function gives a more structured overview of our data, also showing how many observations and variables the data set comprises. Another function you can use to observe your data, is the `summary()` function. This function will also give you information on the distribution of each feature. Of course, data sets are typically much larger than this, but we're only dealing with a toy problem here. 

Ok! Let's dig into a more theoretical formulation of our example. The problem here is labeling a square. This is actually applying some function on the inputs to generate an output. The size and edge variables of a square go in and the label variable, color, comes out. A machine learning algorithm tries to come up with a way of labeling the square, so you're actually trying to estimate the function here. This function, could be estimated based on the previous observations of how the problem was solved. Ideally, the function you're building is generally applicable, and can handle all kinds of reasonable inputs. If we put in the unseen example, the medium striped square, with an unknown label, the function will guess a label for us.

It's very important to see when you're actually dealing with a machine learning problem. When you are simply calculating for example the most occuring color of squares in your data set, or calculating the average size of your squares, you're not doing machine learning. The entire point about machine learning is trying to build a model that can help make predictions about your data or future instances of similar problems. 

Don't let these general formulations of machine learning confuse you. Some very common problems can actually be thought of as machine learning. Do you know about linear regression? You can actually use it to make predictions on your data. Suppose you've got some data about a group of people: their height and their weight. You can use linear regression to make a function which can predict the height of a new person, given their weight. You do this by using the given data about the known height and weight of the first group of people. 

There are so many other examples to machine learning, such as shopping basket analysis, movie recommendation systems, decision-making for self-driving cars and what not. But let's take this step by step. 

In the next set of exercises, you'll consolidate the main ideas about machine learning and take your first gentle steps in this exciting field!

--- video_exercise_key:fd29eec2d2

## Classification, Regression and Clustering Problems

Well done! If you got this far, you already have an idea about some machine learning problems. Let's get a bit more specific and discuss three common types of machine learning problems: Classification, Regression, and Clustering. These are very broad topics, so I'll stick to a brief introduction in this video to get you familiar with these techniques. The three last chapters of this course go into more detail.

First up is Classification. A *classification problem* involves predicting whether a given observation belongs to one of two or more categories. The simplest case of classification is called binary classification. It has to decide between two categories, or classes. Remember how I compared machine learning to the estimation of a function? Well, based on earlier observations of how the input maps to the output, classification tries to estimate a classifier that can generate an output for an arbitrary input, the observations. We say that the classifier labels an unseen example with a class.

The possible applications of classification are very broad. For example, after a set of clinical examinations that relate vital signals to a disease, you could predict whether a new patient with an unseen set of vital signals suffers that disease and needs further treatment. Another totally different example is classifying a set of animal images into cats, dogs and horses, given that you have trained your model on a bunch of images for which you know what animal they depict. Can you think of a possible classification problem yourself? 

What's important here is that first off, the output is qualitative, and second, that the classes to which new observations can belong, are known beforehand. In the first example I mentioned, the classes are "sick" and "not sick". In the second examples, the classes are "cat", "dog" and "horse". In chapter 3 we will do a deeper analysis of classification and you'll get to work with some fancy classifiers!

Moving on ... A  **Regression problem** is a kind of Machine Learning problem that tries to predict a continuous or quantitative value for an input, based on previous information. The input variables, are called the predictors and the output the response.

In some sense, regression is pretty similar to classification. You're also trying to estimate a function that maps input to output based on earlier observations, but this time you're trying to estimate an actual value, not just the class of an observation. 

Do you remember the example from last video? There we had a dataset on a group of people's height and weight. A valid question could be: is there a linear relationship between these two? That is, will a change in height correlate linearly with a change in weight, if so can you describe it and if we know the weight, can you predict the height of a new person given their weight? These questions can be answered with linear regression!

Here, you're trying to fit a linear function between the predictor, the weight, and the response, the height. 

$$ Height \approx \beta_0 + \beta_1*Weight $$

Together, \beta_0 and \beta_1 are known as the model coefficients or parameters. As soon as you know the coefficients beta 0 and beta 1 the function is able to convert any new input to output. This means that solving your machine learning problem is actually finding good values for beta 0 and beta 1. These are estimated based on previous input to output observations. I will not go into detail on how to compute these coefficients; the function `lm()` does this for you in R.

Now, I hear you asking: what can regression be useful for apart from some silly weight and height problems? Well, there are many different applications of regression, going from modeling credit scores based on past payements, finding the trend in your youtube subscriptions over time, or even estimating your chances of landing a job at your favorite company based on your college grades. 

All these problems have two things in common. First off, the response, or the thing you're trying to predict, is always quantitative. Second, you will always need input knowledge of previous input-output observations, in order to build your model. The fourth chapter of this course will be devoted to a more comprehensive overview of regression. 

So... Classification: check. Regression: check. Last but not least, there is clustering. In clustering, you're trying to group objects that are similar, while making sure the clusters themselves are dissimilar.

You can think of it as classification, but without saying to which classes the observations have to belong or how many classes there are.  

Take the animal photos for example. In the case of classification, you had information about the actual animals that were depicted. In the case of clustering, you don't know what animals are depicted, you would simply get a set of pictures. The clustering algorithm then simply groups similar photos in clusters.

You could say that clustering is different in the sense that you don't need any knowledge about the labels. Moreover, there is no right or wrong in clustering. Different clusterings can reveal different and useful information about your objects. This makes it quite different from both classification and regression, where there always is a notion of prior expectation or knowledge of the result. 

An intuitively straightforward clustering method is k-means. This method will cluster your data in k clusters based on some similarity measure.  More on this in the 5th and final chapter of this course!

Enough theory for a while, it's time to roll up your sleeves, head over to the exercises and tackle some classification, regression and clustering problems!

--- video_exercise_key:0ff4bc2a0e

## Supervised vs. Unsupervised

Hi there! My name is Vincent! Together with Gilles, I will guide you through your first steps in the world of machine learning. 

In the previous video, you learned about three machine learning techniques: Classification, Regression and Clustering. As you might have felt, there are quite some similarities between Classification and Regression. For both, you try to find a function, or a model, which can later be used to predict labels or values for unseen observations. It is important that during the training of the function, labeled observations are available to the algorithm. We call these techniques supervised learning.

Labeling can be a tedious work and is often done by puny humans. There are other techniques which don't require labeled observations to learn from data. These techniques are called unsupervised learning. You've already acquainted yourself with one of these techniques in the previous video, namely Clustering. Clustering will find groups of observations that are similar, and thus does not require specific labeled observations. 

In the next chapter we'll talk about assessing the performance of your trained model. In supervised learning, we can use the real labels of the observations and compare them with the labels we predicted. It's quite straightforward that you want your model's predictions to be as similar as possible to the real labels. With unsupervised learning, however, measuring the performance gets more difficult: we don't have real labels to compare anything to. You'll learn some neat techniques to assess the quality of a clustering in the next chapter.

As you get more experienced as a data scientist, you might notice that things aren't always black and white. In machine learning, some techniques overlap between supervised and unsupervised learning. With semi-supervised learning, for example, you can have alot of observations which are not labeled, and a few which are. You can then first perform clustering to group all observations which are similar. Afterwards, you can use information about the clusters and about the few labeled observations to assign a class to unlabeled observations. This will give you more labeled observations to perform supervised learning on.

Enough talking, let's do some more exercises!
