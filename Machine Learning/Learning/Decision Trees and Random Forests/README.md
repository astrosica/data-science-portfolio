# Decision Tree

A decision tree is a supervised learning algorithm used for both classification and regression tasks. It works by recursively splitting the input feature space into regions based on feature values, forming a tree-like structure where each internal node represents a decision based on a feature, and each leaf node represents a prediction outcome. Decision trees are non-parametric and make no assumptions about the underlying data distribution. They can handle both continuous (for regression tasks) and categorical (for classification tasks) input features and are capable of modelling complex, nonlinear relationships. Decision trees are widely used due to their interpretability, flexibility, and low pre-processing needs.

The algorithm selects the best feature and threshold at each node using a splitting criterion that aims to maximize information gain (IG) or, in the case of classification tasks, minimize impurity, commonly measured using entropy ($H$) or Gini impurity ($G$). Information gain is used to determine how useful a feature is by measuring the change in entropy (i.e., randomness or uncertainty) after splitting a data set on a feature. For example, if you’re working with a dataset that tracks customer behaviour, if every customer has a 50\% chance of buying the product, the entropy is high (because the outcome is unpredictable) but if 90\% of customers tend to buy, the entropy is lower (because there’s less uncertainty).

Information gain is the change in entropy $H$ by adding a feature $A$

$$
\begin{align}
IG &= H(S) - H(S,A),
\end{align}
$$

where $H$ is defined as

$$
\begin{align}
H = - \sum_{i=1}^{C} p_i \log_2(p_i).
\end{align}
$$

Here, $p_i$ is the proportion of class $i$ in the node and $C$ is the total number of classes. 

Another popular criterion used in classification is the Gini impurity, which measures the probability of incorrectly classifying a randomly chosen sample based on the class distribution in the node. The Gini impurity is calculated as

$$
\begin{align}
G = 1 - \sum_{i=1}^{C} p_i^2.
\end{align}
$$

It is often preferred in practice because it is computationally simpler and tends to isolate the most frequent class in a node faster than entropy.

Entropy and Gini impurity reach a minimum (zero) when all samples in a node belong to a single class. If splitting the data on a feature significantly reduces entropy or Gini impurity, that feature is considered useful. When building a decision tree, the algorithm chooses the split that maximizes information gain or minimizes impurity at each step. A common pitfall when using information gain is that it tends to favour categorical features with many unique values, such as zip codes, which can lead to overfitting by perfectly segmenting the training data without improving generalization.

# Random Forest

A random forest is an ensemble learning algorithm that creates a "forest" of decision trees, each trained on a random subset of the data, and then aggregate their predictions to improve predictive performance and reduce overfitting. Each tree in the forest is trained on a bootstrap sample of the training data (i.e., sampled with replacement), a technique known as bagging. Additionally, at each split in the tree, only a random subset of features is considered. This introduces further randomness and helps ensure that the individual trees are de-correlated, which improves generalization.

Random forests do not rely on a specific mathematical loss function during inference, but each individual decision tree uses the same criteria as decision trees: Gini impurity or entropy for classification and mean squared error for regression. For classification tasks, the overall prediction $\hat{y}$ is typically the majority vote across all trees:

$$
\begin{align}
\hat{y} = \text{mode}\left\{T_1(x), T_2(x), \dots, T_n(x)\right\},
\end{align}
$$

where $T_i(x)$ is the prediction of the $i$-th tree, and $n$ is the total number of trees in the forest. For regression tasks, the overall prediction is typically given by the average of their predictions:

$$
\begin{align}
\hat{y} = \frac{1}{n} \sum_{i=1}^{n} T_i(x).
\end{align}
$$

Random forests are particularly useful when working with high-dimensional data or when strong individual predictors are not easily discernible. They are robust to noise, capable of capturing feature interactions, and perform well even without extensive hyperparameter tuning. While individual trees are interpretable, the overall ensemble is often considered a “black box” due to the difficulty in tracing a single prediction through all the trees. However, random forests offer helpful byproducts like feature importance scores, which can highlight the most informative features in a dataset. Despite their strengths, random forests can be computationally expensive to train and may not perform well on sparse data or in situations where model interpretability is critical.