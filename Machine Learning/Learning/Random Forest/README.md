# Random Forest

A random forest is an ensemble learning algorithm that creates a "forest" of decision trees, each trained on a random subset of the data, and then aggregates their predictions to improve predictive performance and reduce overfitting. Each tree in the forest is trained on a bootstrap sample of the training data (i.e., sampled with replacement), a technique known as bagging. Additionally, at each split in the tree, only a random subset of features is considered. This introduces further randomness and helps ensure that the individual trees are de-correlated, which improves generalization.

Within each tree, splits are chosen to minimize impurity in the nodes. For classification, this is typically measured using entropy ($H$) or Gini impurity ($G$). Entropy captures the uncertainty in class labels and is defined as

$$
H = - \sum_{i=1}^{C} p_i \log_2(p_i), \quad\quad (1)
$$

where $p_i$ is the proportion of class $i$ in the node and $C$ is the total number of classes. Gini impurity measures the probability of incorrectly classifying a randomly chosen sample and is defined as

$$
G = 1 - \sum_{i=1}^{C} p_i^2. \quad\quad (2)
$$

Both reach zero when a node contains only one class, and features that yield the largest impurity reduction are preferred for splitting. This splitting criterion applies within each decision tree, but the random forest as a whole relies on bagging and feature randomness to improve performance and reduce overfitting.

For classification tasks, the overall prediction $\hat{y}$ is typically the majority vote across all trees:

```math
\hat{y} = \mathrm{mode}\{ T_1(x), T_2(x), \dots, T_n(x) \}, \quad (3)
```

where $T_i(x)$ is the prediction of the $i$-th tree, and $n$ is the total number of trees in the forest. For regression tasks, the overall prediction is typically given by the average of their predictions:

$$
\hat{y} = \frac{1}{n} \sum_{i=1}^{n} T_i(x). \quad\quad (4)
$$

Random forests are particularly useful when working with high-dimensional data or when strong individual predictors are not easily discernible. They are robust to noise, capable of capturing feature interactions, and perform well even without extensive hyperparameter tuning. While individual trees are interpretable, the overall ensemble is often considered a “black box” due to the difficulty in tracing a single prediction through all the trees. However, random forests offer helpful byproducts like feature importance scores, which can highlight the most informative features in a dataset. Despite their strengths, random forests can be computationally expensive to train and may not perform well on sparse data or in situations where model interpretability is critical.