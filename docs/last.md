# 写在最后

至此，所有内容你都学完了。恭喜！让我们复习一下这些内容。当然接下来的内容也是考试重点考察内容。

## 考题构造

总构造：5+12 题。其中：

- 选择题 3.5*12
- 综合题 58

> 注：multi-choice 是从多个选一个

## 相关模型

### lm model (1-12 chapter)

前提假设：正态分布

- 简单线性（Simple Linear Regression）

  Formula: $y = β_0 + β_1x_i + ε_i,\ ε_i \sim N(0, σ^2)$ where $β_1 > 0$.

- 零模型（The Null Model）

  Formula: $y = \beta_0 + x$

- 多项式（Curved Model (Like Quadratic Model)）

  Formula: $y = β_0 + β_1 x + β_2 x^2 + ε_i$

- 多变量

- 多变量交互

- 指数

- 幂

### glm model (13-16 chapter)

前提假设：泊松分布、二项分布

泊松一般是一到二道题

## 模型研究

1. 对数据绘制图形，评价图形中数据变化的趋势

   什么样的趋势，自变量和因变量的关系

2. 选择合适的模型进行拟合（包括 lm 和 glm）

   要求会写不同模型的代码、拟合函数。注意不要忘了分布的书写

3. 残差三分析：同分布、正态检验、异常值

4. 模型本身的数据分析（`summary(model)`）

   - 公式

   - t 检验

     t-value 含义：预估变量值 - 假设H_0（假设能接受的该变量值） / 标准差

     由 t-value 和自由度一起分析得到 p-value，从而得出我们能否接受该假设。（对于三十几行以内的数据而言，t 绝对值大于 1.96 就基本等价于 p 小于 0.05，大于95%置信区间）当然零假设本身就落在95%置信区间也可以。

     但是我们的summary里面是设定的零假设为0。

   - p 检验

     p-value：大于等于 0.05 则可以接受，小于 0.05 不能接受

   - r 方

     误差：模型解释的偏差+观测的误差

     r 方即模型能解释误差的百分比，模型能解释的误差越少，就说明数据越不受控，不能直接拒绝。

   - 参数的95%置信区间

     含义：哪一个解释更有用，解释是什么？

   - 自由度

     原数据有多少行：残差自由度 + 参数变量个数（零模型自由度加一也行，但一般不用）

5. 预测 predict

   代码里参数有两个，prediction预测个体，confidence预测均值（个体预测范围更大）

   注意有时还要套用exp（看y有没有变形）

6. method and assumption checks：问题是什么，数据什么情况，拟合什么具体模型（解释单变量、多变量在模型里的含义），r方是多少

7. executive summary：解释拟合参数的含义（解释参数死都需要变形，每单位参数的变化，导致预测值变化多少、变成原来多少倍），回答题目问题

## 其他知识点

### 卡方

什么是 1 - 卡方？

代码中一般是 `1 - pchisq(36.59, 18)` 这样的。

The p-value for testing the null hypothesis that the data are 泊松/二项 distributed, the p-value is below 0.05 (above 0.05), rejecting the null hypothesis.

the null hypothesis is that the binomial variance 
assumption holds, the residual deviance is chi-squared with 18 degrees of freedom if this assumption is true.

in this case, the p-value is below 0.05, rejecting the null hypothesis.

### log 使用条件

- 数值数据（曲线拟合log，使用后变成直线）
- 分类数据（箱线图观察，log后宽度变成一致了就是好的）

### 公式书写

- 正态分布：$E(Exam_i) = \beta_0 + \beta_1 Test_i + \epsilon$ where $\epsilon \sim N(0, \sigma^2)$
- 泊松分布：$log(Exam_i) = \beta_0 + \beta_1 Test_i + \epsilon$ where ...