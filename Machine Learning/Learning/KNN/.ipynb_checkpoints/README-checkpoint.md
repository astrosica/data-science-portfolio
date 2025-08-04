# K-Nearest Neighbours (KNN)

K-Nearest Neighbours (KNN) is a non-parametric algorithm that is used for both regression and classification tasks. Given a new input example, the algorithm identifies the $k$ closest examples from the training set, based on a distance metric (such as Euclidean distance) and makes predictions based on the properties of those neighbours.

For classification, the predicted class is typically the majority class among the $k$ nearest neighbours, while for regression, the prediction is typically the average of the target values associated with the $k$ nearest neighbours. Since KNN relies directly on the training data rather than building an explicit model, it is considered a ``lazy learner,'' meaning that it stores all of the training data and defers computation until prediction time, which can make it computationally expensive as the dataset grows.

While the KNN model doesn't minimize a loss function as it is non-parametric, it typically uses the Euclidean distance to measure the distance between two features $\mathbf{x}_i$ and $\mathbf{x}_j$ in feature space, defined as

$$
\begin{align}
d(\mathbf{x}_i, \mathbf{x}_j) = \sqrt{\sum_{l=1}^{n} (x_i^{(l)} - x_j^{(l)})^2},
\end{align}
$$

{\noindent}where $n$ is the number of features. This metric determines how similar (or different) each point is in feature space, where points closer to each other in feature space are considered to be more similar. Depending on the data, other distance metrics (such as Manhattan distance) may be more appropriate.

One of the strengths of KNN is its simplicity and interpretability. The decision boundaries formed by the model are highly flexible and adapt closely to the training data. However, this also makes the algorithm prone to overfitting, particularly when $k$ is small. Increasing $k$ can reduce variance and make the model more robust to noise, but may lead to underfitting if $k$ becomes too large. Therefore, selecting an appropriate value for $k$ is an important part of tuning KNN models, which is often done through cross-validation.

Since KNN relies on distance calculations, it is sensitive to the scale of the features, and normalization or standardization is often necessary to ensure that all features contribute equally to the distance metric. It also assumes that nearby points in the input space share similar outputs, which may not hold in cases of high-dimensional or sparse data, where the notion of distance becomes less meaningful.

Despite these limitations, KNN is a powerful and intuitive algorithm that performs well on a range of problems, particularly when the decision boundary is nonlinear and the training set is not excessively large. It is often used as a baseline model or in scenarios where interpretability and simplicity are valued.