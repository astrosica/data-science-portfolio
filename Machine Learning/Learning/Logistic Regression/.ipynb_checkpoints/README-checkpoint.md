# Logistic Regression

Logistic regression is a foundational model in supervised machine learning (ML), primarily used for binary classification problems. Unlike linear regression, which outputs continuous values, logistic regression predicts the probability that an input belongs to one of two classes. The predicted target variable is either a 0 or a 1, often corresponding to yes/no, success/failure, or positive/negative outcomes. It does this by applying the sigmoid (logistic) function to a linear combination of input features, producing an output that can be interpreted as probabilities.

Mathematically, the logistic model is expressed as:

$$
\begin{aligned}
\hat{y} = \sigma(\mathbf{w}^\mathrm{T}\mathbf{x} + b) = \frac{1}{1 + e^{-(\mathbf{w}^\mathrm{T}\mathbf{x} + b)}}, \quad\quad (1)
\end{aligned}
$$

where:
- $\mathbf{x}$ is the input feature vector,
- $\mathbf{w}$ is the vector of learned weights,
- $b$ is the bias term,
- $\sigma$ is the sigmoid activation function.

The parameters $\mathbf{w}$ and $b$ are learned by minimizing a loss function ($\mathcal{L}$), which in the case of logistic regression, is the log loss functio (also known as binary cross-entropy):

$$
\begin{aligned}
\mathcal{L} = -\frac{1}{m} \sum_{i=1}^m \left[ y^{(i)} \log\left(\hat{y}^{(i)}\right) + \left(1 - y^{(i)}\right) \log\left(1 - \hat{y}^{(i)}\right) \right], \quad\quad (2)
\end{aligned}
$$

where:

- $m$ is the number of training examples,
- $y^{(i)} \in \{0,1\}$ is the true label for the $i$-th sample,
- $\hat{y}^{(i)} \in [0,1]$ is the predicted probability that the $i$-th sample belongs to class 1.

While this is a small detail, it's worth emphasizing that the true class label can only take one of two values (0 or 1) while the predicted class label can take any numerical value between 0 and 1. Since the predicted class can be interpreted as a probability (i.e., values closer to 0 being low probability and values closer to 1 being higher probability), we can interpret the loss function as a weighted sum of the log-probabilities of the two possible outcomes:

$$
\begin{aligned}
\mathcal{L}^{(i)} = - \left[ 
\underbrace{P(y=1)}_{y^{(i)}} \cdot \underbrace{\log(P(\hat{y}=1))}_{\log(\hat{y}^{(i)})} + 
\underbrace{P(y=0)}_{(1 - y^{(i)})} \cdot \underbrace{\log(P(\hat{y}=0))}_{\log(1 - \hat{y}^{(i)})}
\right], \quad\quad (3)
\end{aligned}
$$

As such, predictions close to the true class label incur a small loss, while confident but incorrect predictions are heavily penalized. 

The target variable of a logistic regression model must be binary, meaning it should only take on two possible classes (typically 0 or 1). Input features can be either continuous or categorical, although categorical features must be encoded numerically. Logistic regression assumes linear separability (i.e., the two classes can be separated by a linear boundary in feature space) and is sensitive to multicollinearity (i.e., when input features are highly correlated with one another). While logistic regression is less sensitive to outliers than linear regression, extreme outliers can still skew results. Lastly, the model assumes that there is little-to-no noise in the data and that the relationship between features and the log-odds of the target variable is linear. If the relationship is non-linear, more flexible model like decision trees or gradient boosting may yield better results.