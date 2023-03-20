# Database Analysis Learning

[![GitHub stars](https://img.shields.io/github/stars/cworld1/da-learning?style=flat-square)](https://github.com/cworld1/da-learning/stargazers)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/cworld1/da-learning?label=commits&style=flat-square)](https://github.com/cworld1/da-learning/commits)
<!-- [![Vercel Production Status](https://img.shields.io/github/deployments/cworld1/da-learning/production?label=vercel&logo=vercel&style=flat-square)](https://vercel.com/cworld0/da-learning) -->
[![GitHub license](https://img.shields.io/github/license/cworld1/da-learning?style=flat-square)](https://github.com/cworld1/da-learning/blob/main/LICENSE)

Some notes and code about CWorld learning Database Analysis.

[前往阅读 →](https://da.cworld.top/)

## Local Development

Environment requirements:

- [R Language](https://www.r-project.org/) 4.0.0+
- [Python](https://www.python.org/) 3.9.0+

### 1. Clone the repository

```shell
git clone https://github.com/cworld1/da-learning.git
cd da-learning
```

### 2. Install dependencies

```shell
pip install --upgrade poetry
poetry install
```

If you have trouble installing `poetry`, you can also use `pip` to install dependencies:

```shell
pip install -r requirements.txt
```

### 3. Build and run the website

```shell
jupyter-book build docs
```

This will build the website into static files in the `docs/_build/html` directory.

## Contributions

As the author is only a beginner in learning Database Analysis, there are obvious mistakes in his notes. Readers are also invited to make a lot of mistakes. In addition, you are welcome to use PR or Issues to improve them.

## Thanks

Some of the electronic textbooks have helped the author a lot in his studies, and without them, this notebook would not have been possible. I would like to express my gratitude to the original authors of these materials. If you have any doubts about this project, you can also read the following textbooks carefully to remedy them.

<!-- - [数据库原理及应用 - shark-Gao 的博客](https://blog.csdn.net/qq_58608526/article/details/122922114)
- [数据库原理及应用教程（微课版）](https://annas-archive.org/md5/08cf09ef24ff4989641044caa544b29e)
- [数据库系统概论（第 5 版）](https://z-lib.io/book/13860288) -->

## License

This project is licensed under the GPL 3.0 License.

[![Creative Commons](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en)

This documention is admitted by [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](http://creativecommons.org/licenses/by-nc-sa/4.0/).

> **Note** This website is built using [Jupyter Book](https://jupyterbook.org/en/stable/), a [Jupyter](https://jupyter.org/) static website generator.
