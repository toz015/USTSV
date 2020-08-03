# ML Questions



##### The following questions go over the knowledge of ML. They are from the end of several chapters of Aurelien Geron's *Hands-On Machine Learning with Scikit-Learn & TensorFlow*. 

<!-- MarkdownTOC -->
- [Chapter 1 Basic Q](#Chapter-1-Basic-Question)
- [Chapter 4 Training Model](#Chapter-4-Training-Model)
- [Chapter 5 SVM](#Chapter-5-SVM)
- [Chapter 6 Decision Tree](#Chapter-6-Decision-Tree)
- [Chapter 7 Ensemble Learning and Random Forests](#Chapter-7-Ensemble-Learning-and-Random-Forests)
- [Chapter 8 Dimensionality Reduction](#Chapter-8-Dimensionality-Reduction)

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

   * The best Machine Learning algorithm to allow a robot to walk in unknown terrain is Reinforced Learning, where the robot can learn from response of the terrain to opt ction or similar to determine what the parameter value has to be in order to minimize the function. The model makes prediction by using the value of the new instance and the parameters in its function.

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
  
## Chapter 6 Decision Tree
### 1. What is the approximate depth of a decision tree trained without restrictions on a training set with 1 million instances?
  * If the tree is balanced, then at ever layer it splits the samples in two, so the depth is $log_{2}(1\,000\,000) \approx 20$.

### 2. Is a node's Gini impurity generally lower or greater than its parent's? Always Lower/greater?

  * Gini's impurity score is generally lower than its parent. However, it is possible for a child node to have higher Gini's score as long as it's compensated by its other binary node and by the weights of its sample size.
  
### 3. If a decision tree is overfitting the training set, is it a good idea to try decreasing max_depth?

  * Yes, It's a good idea since you're contraining the model's predictions to bigger sample_size averages.
  
### 4. If a decision tree is underfitting the training set, is it a good idea to try scaling the input features?

  * Decision Trees don't need feature scaling for them to work, you can reduce underfitting by increasing max_depth, decreasing min_leaf_samples or any of the other regularization hyper-parameters.
  
## Chapter 7 Ensemble Learning and Random Forests

### 1. If you have trained five different models on the exact same training data, and they all achieve 95% precision, is there any chance that you can combine these
models to get better results? If so, how? If not, why?
  *  If you have trained five different models and they all achieve 95% precision, you can try combining them into a voting ensemble, which will often give you even
better results. It works better if the models are very different. It is even better if they are trained on different training instances (that’s the whole
point of bagging and pasting ensembles), but if not it will still work as long as the models are very different.

### 2. What is the difference between hard and soft voting classifiers?

  * A hard voting classifier just counts the votes of each classifier in the ensemble and picks the class that gets the most votes. A soft voting classifier computes the
average estimated class probability for each class and picks the class with the highest probability. This gives high-confidence votes more weight and often performs better, but it works only if every classifier is able to estimate class probabilities

### 3. Is it possible to speed up training of a bagging ensemble by distributing it across multiple servers? What about pasting ensembles, boosting ensembles, random forests, or stacking ensembles?

  * It is quite possible to speed up training of a bagging ensemble by distributing it across multiple servers, since each predictor in the ensemble is independent of
the others. The same goes for pasting ensembles and Random Forests, for the same reason. However, each predictor in a boosting ensemble is built based on the previous predictor, so training is necessarily sequential, and you will not gain anything by distributing training across multiple servers. Regarding stacking ensembles, all the predictors in a given layer are independent of each other, so they can be trained in parallel on multiple servers. However, the predictors in one layer can only be trained after the predictors in the previous layer have all been trained.

### 4. What is the benefit of out-of-bag evaluation?

  * With out-of-bag evaluation, each predictor in a bagging ensemble is evaluated using instances that it was not trained on (they were held out). This makes it possible to have a fairly unbiased evaluation of the ensemble without the need for an additional validation set. Thus, you have more instances available for training, and your ensemble can perform slightly better.

### 5. What makes Extra-Trees more random than regular Random Forests? How can this extra randomness help? Are Extra-Trees slower or faster than regular Random Forests?

  * When you are growing a tree in a Random Forest, only a random subset of the features is considered for splitting at each node. This is true as well for ExtraTrees, but they go one step further: rather than searching for the best possible thresholds, like regular Decision Trees do, they use random thresholds for each feature. This extra randomness acts like a form of regularization: if a Random Forest overfits the training data, Extra-Trees might perform better. Moreover, since Extra-Trees don’t search for the best possible thresholds, they are much faster to train than Random Forests. However, they are neither faster nor slower than Random Forests when making predictions.

### 6. If your AdaBoost ensemble underfits the training data, what hyperparameters should you tweak and how?

  * If your AdaBoost ensemble underfits the training data, you can try increasing the number of estimators or reducing the regularization hyperparameters of the base
estimator. You may also try slightly increasing the learning rate.

### 7. If your Gradient Boosting ensemble overfits the training set, should you increase or decrease the learning rate?

  * If your Gradient Boosting ensemble overfits the training set, you should try decreasing the learning rate. You could also use early stopping to find the right
number of predictors (you probably have too many)

## Chapter 8 Dimensionality Reduction

### 1. What are the main motivations for reducing a dataset’s dimensionality? What are the main drawbacks?
 
 * To speed up a subsequent training algorithm (in some cases it may even remove noise and redundant features, making the training algorithm per‐
  form better).
  * To visualize the data and gain insights on the most important features.
  * Some information is lost, possibly degrading the performance of subsequent training algorithms.
  * It can be computationally intensive.
  * Transformed features are often hard to interpret
### 2. What is the curse of dimensionality?
 
 * The curse of dimensionality refers to the fact that many problems that do not exist in low-dimensional space arise in high-dimensional space. In Machine Learning, one common manifestation is the fact that randomly sampled highdimensional vectors are generally very **sparse**, increasing the **risk of overfitting** and making it very difficult to identify patterns in the data without having plenty of training data.
  
### 3. Once a dataset’s dimensionality has been reduced, is it possible to reverse the operation? If so, how? If not, why?
  
  * Once a dataset’s dimensionality has been reduced using one of the algorithms we discussed, it is almost always impossible to perfectly reverse the operation, because some information gets lost during dimensionality reduction. Moreover, while some algorithms (such as PCA) have a simple reverse transformation procedure that can reconstruct a dataset relatively similar to the original, other algorithms (such as T-SNE) do not

### 4. Can PCA be used to reduce the dimensionality of a highly nonlinear dataset?

  * PCA can be used to significantly reduce the dimensionality of most datasets, even if they are highly nonlinear, because it can at least get rid of useless dimensions. However, if there are no useless dimensions.

### 5. In what cases would you use vanilla PCA, Incremental PCA, Randomized PCA, or Kernel PCA?

  * Regular PCA is the default, but it works only if the dataset fits in memory. Incremental PCA is useful for large datasets that don’t fit in memory, but it is slower than regular PCA, so if the dataset fits in memory you should prefer regular PCA. Incremental PCA is also useful for online tasks, when you need to apply PCA on the fly, every time a new instance arrives. Randomized PCA is useful when you want to considerably reduce dimensionality and the dataset fits in memory; in this case, it is much faster than regular PCA. Finally, Kernel PCA is useful for nonlinear datasets 
  
### 6. How can you evaluate the performance of a dimensionality reduction algorithm on your dataset?

  *  Intuitively, a dimensionality reduction algorithm performs well if it eliminates a lot of dimensions from the dataset without losing too much information. One way to measure this is to apply the reverse transformation and measure the reconstruction error. However, not all dimensionality reduction algorithms provide a reverse transformation. Alternatively, if you are using dimensionality reduction as a preprocessing step before another Machine Learning algorithm (e.g., a Random Forest classifier), then you can simply measure the performance of that second algorithm; if dimensionality reduction did not lose too much information, then the algorithm should perform just as well as when using the original dataset
  
### 7. Does it make any sense to chain two different dimensionality reduction algorithms?
 * It can absolutely make sense to chain two different dimensionality reduction algorithms. A common example is using PCA to quickly get rid of a large number of useless dimensions, then applying another much slower dimensionality reduction algorithm, such as LLE. This two-step approach will likely yield the same performance as using LLE only, but in a fraction of the time
