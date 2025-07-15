# Linear Regression

## Background

Linear regression is a foundational algorithm used in supervised machine learning (ML) to map input variables to continuous output values using a linear function by minimizing the prediction error. The linear regression model is given by

$$
\begin{aligned}
\hat{y} = \mathbf{w}^\mathrm{T} \mathbf{x} + b, \quad\quad (1)
\end{aligned}
$$

where

- $\mathbf{x}$ is the input feature vector,
- $\mathbf{w}$ is the vector of learned weights (coefficients),
- $b$ is the bias (intercept), and
- $\hat{y}$ is the predicted output.

For example, data involving three features ($x_1$, $x_2$, and $x_3$) would have a linear regression model of the following form:

$$
\begin{aligned}
\hat{y} = w_1x_1 + w_2x_2 + w_3x_3 + b, \quad\quad (2)
\end{aligned}
$$

where each feature has an associated weight. The parameters $\mathbf{w}$ and $b$ are determined by minimizing the standard loss function ($\mathcal{L}$), which in this case of linear regression is the **mean squared error (MSE)** between the predicted and true values,

$$
\begin{aligned}
\mathcal{L} = \frac{1}{m} \sum_{i=1}^{m} \left( \hat{y}^{(i)} - y^{(i)} \right)^2, \quad\quad (3)
\end{aligned}
$$

where $m$ is the number of training samples. This loss function penalizes large errors more heavily by squaring the difference between each prediction and its corresponding true value.

There are two common approaches for finding the optimal parameters. The first is **gradient descent**, an iterative optimization technique that updates weights based on the gradient of the loss function. The second is the **normal equation**, a closed-form solution that directly computes the optimal weights by solving the equation

$$
\begin{aligned}
\mathbf{w} = (\mathbf{X}^\mathrm{T} \mathbf{X})^{-1} \mathbf{X}^\mathrm{T} \mathbf{y}, \quad\quad (4)
\end{aligned}
$$

where $\mathbf{X}$ is the design matrix (i.e., the entire input data in the form of a matrix with samples as rows and features as columns) and $\mathbf{y}$ is the vector of target values. While the normal equation is efficient for small to moderately sized datasets, it becomes computationally expensive as the number of features increases. We will use `scikit-learn`’s `LinearRegression` implementation, which solves the normal equation behind the scenes to find the optimal model parameters.

The types of variables used in linear regression affects model performance and interpretability. The target (output) variable must be continuous, as linear regression is designed to predict numeric outcomes. Input features can include continuous variables, as well as ordinal and binary categorical variables provided they've been appropriately encoded to numerical form. Linear regression is also sensitive to the scale of the feature, so it's important that all numerical features are standardized to have a mean of zero ($\mu=0$) and a standard deviation of one ($\sigma=1$). This ensures that each feature contributes equally to the model.