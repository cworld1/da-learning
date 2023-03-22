# Getting Started with Regression

## 什么是线性回归

线性样本回归分析：

$$
\hat{y_0} = a_i + b_ix
$$

原则：残差平方和最小

怎么算 $a_i$ 和 $b_i$：

$$
\begin{cases}
b=\frac
{\sum_{i=1}^{n}(x-x_i)(y-y_i)}
{\sum_{i=1}^{n}(x-\bar{x})^2} \\
a=\bar{y}-b\bar{x}
\end{cases}
$$

## 线性回归的残差与模型误差分析

残差表示预测值与真实值的差值，有正负号，一般使用 $\varepsilon$ 表示。

$$
y_i = ax_i + b + \varepsilon
$$

且 $\varepsilon$ 的值符合正态分布：$\varepsilon \sim N(0, \sigma^2)$

误差：

$$
\begin{split}
Y - \hat{Y} &= Y - \bar{Y} - \hat{Y} + \bar{Y} \\
&= (Y - \bar{Y}) - (\hat{Y} - \bar{Y}) \\
Y - \bar{Y} &= (Y-\hat{Y}) + (\hat{Y} - \bar{Y})
\end{split}
$$

其中 $Y - \bar{Y}$ 称为总体差异，$Y-\hat{Y}$ 称为随机变量，$\hat{Y} - \bar{Y}$ 称为可以用自变量 x 进行解释的差异。

于是，我们有：

$$
\begin{split}
\sum{Y - \bar{Y}} &= \sum{Y-\hat{Y}} + \sum{\hat{Y}-\bar{Y}} \\
SST &= \ \ \ \ \ SSE \ \ \ \ \ + \ \ \ \ \ SSR \\
df = n-1 & \ \ \ \ \  df=n-2 \ \ \ \ \ \ \ \ df = 1
\end{split}
$$

并且有：

$$
\begin{cases}
MST &= \frac{SST}{df} \\
MSE &= \frac{SSE}{df} \\
MSR &= \frac{SSR}{df}
\end{cases}
$$
