# ML Questions



##### The following questions go over the knowledge of ML. They are from the end of several chapters of Aurelien Geron's *Hands-On Machine Learning with Scikit-Learn & TensorFlow*. 

<!-- MarkdownTOC -->
- [Chapter 1 Basic Q](#Chapter-1-Basic-Question)
- [Chapter 4 Training Model](#Chapter-4-Training-Model)
- [Chpater 5 SVM](#Chapter-5-SVM)


<!-- MarkdownTOC -->

## Chapter 1 Basic Question

### 1. How would you define Machine Learning?

   * Machine learning is defined by programming machine to learn from data to solve a specific problem.

### 2. Can you name four types of problems where it shines?

   * Machine learning is great for problems whose solution requires a great deal of work or a long list of rules, complex problems that are hard to get a solution of using a traditional method, fluctuating environments and getting insights about complex problems and large data.
   
### 3. What are the two most common supervised tasks?

   * Two most common supervised tasks are classification and regression.

### 4. Can you name four common unsupervised tasks?

   * Four common unsupervised tasks inclused clustering, visualization, dimensionality reduction , and association rule learning.

### 5. What type of Machine Learning algorithm would you use to allow a robot to walk in various unknown terrains?

   * The best Machine Learning algorithm to allow a robot to walk in unknown terrain is Reinforced Learning, where the robot can learn from response of the terrain to optimize itself.

### 6. What type of algorithm would you use to segment your customers into multiple groups?

   * The best algorithm to segment customers into multiple groups is either supervised learning (if the groups have known labels) or unsupervised learning (if there are no group labels).

### 7. What is an online learning system?

   * Online learning system is a learning system in which the machine learns  as data is given in small streams continuously.

### 8. What is out-of-core learning system?

   * Out-of-core learning system is a system that can handle data that cannot fit into your computer memory. It uses online learning system to feed data in small bits.

### 9. What type of learning algorithm relies on a similarity measure to make predictions?

   * Learning algorithm that relies on a similarity measure to make predictions is instance-based algorithm.

### 10. What is the difference between a model parameter and a learning algorithm's hyperparameter? 

   * Model parameter determines how a model will predict given a new instance; model usually has more than one parameter (i.e. slope of a linear model). Hyperparameter is a parameter for the learning algorithm, not of a model.
   
### 11. What do model-based learning algorithms search for? What is the most common strategy they use to succeed? How do they make predictions?

   * Model based learning algorithm search for the optimal value of parameters in a model that will give the best results for the new instances. We often use a cost function or similar to determine what the parameter value has to be in order to minimize the function. The model makes prediction by using the value of the new instance and the parameters in its function.

### 12. What is a test set and why would you want to use it?

   * Test set is a set that you test your model (fit using training data) to see how it performs. Test set is necessary so that you can determine how good (or bad) your model performs.

### 13. What is the purpose of a validation set?

   * Validation set is a set used to compare between different training models.

### 14. What can go wrong if you tune hyperparameters using the test set?

   * If you tune hyperparameters using the test sets, then it may not perform well on the out-of-sample data because the model is tuned just for that specific set.* 

### 15. What is cross-validation and why would you prefer it to a validation set?

   * Cross-validation is a tool to compare models without needing a separate validation set. It is preferred over validation set because we can save from breaking of part of the training set to create a validation set, as having more data is valuable regardless.
    
## Chapter 4 Training Model

### 1. What Linear Regression training algorithm can you use if you have a training set with millions of features?

   * Since there are lots of features, we cannot use Normal Equations (it will be very, very computationally expensive). Instead we can use Gradient Descent.

### 2. Suppose the features in your training set have very different scales. What algorithms might suffer from this, and how? What can you do about it?

   * The Gradient Descent suffers from features of different scales, because the model will take a longer time to reach the global maximum. We can always scale the features to eliminate this problem.

### 3. Can Gradient Descent get stuck in a local minimum when training a Logistic Regression model?

   * Since Logistic Regression Model cost function is convex, there is no local minimum.

### 4. Do all Gradient Descent algorithms lead to the same model provided you let them run long enough?

   * No. If the learning rate is too high, then the model can diverge. It can also only reach the local minimum based on where the initialization is.

### 5. Suppose you use Batch Gradient Descent and you plot the validation error at every epoch. If you notice that the validation error consistently goes up, what is likely going on? How can you fix this?**

   * If the validation error consistently goes up, that means the model could be diverging because of high learning rate. If the training error also goes up, that is the indication of diverging. You can fix that by lowering the learning rate and then re-training. If the training error is **not** increasing, then your model is overfitting and you have to retrain with a different model.

### 6. Is it a good idea to stop Mini-batch Gradient Descent immediately when the validation error goes up?

   * No, because it will be erratic in approaching the minimum (just like Stochastic Gradient Descent, but to less degree). You can always revert to the best case if the error does not improve for a while.

### 7. Which Gradient Descent Algorithm will reach the vicinity of the optimal solution the fastest? Which will actually converge? How can you make the others converge as well?

   * The Stochastic Gradient Descent will reach the fastest since you are using one random training data  at each iteration. However, the Batch Gradient Descent is the only one to actually converge. You cannot make the others converge; they will only approach close to the global minimum.

### 8. Suppose you are using Polynomial Regression. You plot the learning curves and you notice that there is a large gap between the training error and the validation error. What is happening? What are three ways to solve this?

   * If the gap exists between the training and the validation error, the model is overfitting the data. 
   * To avoid overfitting the data, you can do one of three things:   
                                    1. train more data
                                    2. regularize the model
                                    3. reduce the complexity of the model (degree of freedom)

### 9. Suppose you are using Ridge Regression and you notice that the training error and the validation error are almost equal and fairly high. Would you say that the model suffers from high bias or high variance? Should you increase the regularization hyperparameter alpha or reduce it?

   * The model suffers from high bias, because the errors are both high, indicating wrong assumptions and therefore underfitting. In order to reduce high bias, you have to decrease alpha.

### 10. Why would you want to use:

  * Ridge Regression instead of plain Linear Regression?

    - Ridge Regression regularizes the Linear Regression, to avoid overfitting.

  * Lasso instead of Ridge Regression?

    - Lasso, which uses L1 norm regularization, automatically eliminates the weights of the least important features and therefore performs feature selection.

  * Elastic Net instead of Lasso?

    - Elastic Net is preferred over Lasso if there are lots of features or lots of strongly correlated features.

### 11. Suppose you want to classify pictures as outdoor/indoor and daytime/nighttime. Should you implement two Logistic Regression classifier or one Softmax Regression classifier?

   * You should implement two Logistic Regression classifiers, because there are two different binary classifying (outdoor/indoor, daytime/nighttime). All pictures can be one from each classifier. Softmax Regression classifies into only one class out of all of them.
   
## Chapter 5 SVM
### 1. What is the fundamental idea behind Support Vector Machines?
   * The fundamental idea behind Support Vector Machines is to fit the widest possible "street" between the classes. In other words, the goal is to have the largest possible margin between the decision boundary that separates the two classes and the training instances. When performing soft margin classification, the SVM searches for a compromise between perfectly separating the two classes and having the widest possible street (i.e., a few instances may end up on the street). Another key idea is to use kernels when training on nonlinear datasets.
### 2. What is a support vector?
   * After training an SVM, a support vector is any instance located on the "street", including its border. The decision boundary is entirely determined by the support vectors. Any instance that is not a support vector (i.e., off the street) has no influence whatsoever. Computing the predictions only involves the support vectors, not the whole training set.
### 3. Why is it important to scale the inputs when using SVMs?
   * SVMs try to fit the largest possible "street" between the classes, so if the training set is not scaled, the SVM will tend to neglect small features.
### 4. Can an SVM classifier output a confidence score when it classifies an instance? What about a probability?
   * An SVM classifier can output the distance between the test instance and the decision boundary, and you can use this as a confidence score. However, this score cannot be directly converted into an estimation of the class probability. If you set probability=True when creating an SVM in Scikit-Learn, then after training it will calibrate the probabilities using Logistic Regression on the SVM's scores. This will add the predict_proba() and predict_log_proba() methods to the SVM.
### 5. Should you use the primal or the dual form of the SVM problem to train a model on a training set with millions of instances and hundreds of features?
  * This question applies only to linear SVMs since kernelized can only use the dual form. The computational complexity of the primal form of the SVM problem is proportional to the number of training instances m, while the computational complexity of the dual form is proportional to a number between m2 and m3. So if there are millions of instances, you should definitely use the primal form, because the dual form will be much too slow. The dual problem is faster to solve than the primal when the number of training instances is smaller than the number of features
### 6. Say you trained an SVM classifier with an RBF kernel. It seems to underfit the training set: should you increase or decrease γ (gamma)? What about C?
  * It's possible that there is too much regularization. To decrease it, increase gamma, C, or both.
