# Data Analysis Learning

[![GitHub stars](https://img.shields.io/github/stars/cworld1/da-learning?style=flat-square)](https://github.com/cworld1/da-learning/stargazers)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/cworld1/da-learning?label=commits&style=flat-square)](https://github.com/cworld1/da-learning/commits)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/cworld1/da-learning/.github/workflows/docs-build.yml?branch=main&style=flat-square)](https://github.com/cworld1/da-learning/actions/workflows/docs-build.yml)
[![GitHub license](https://img.shields.io/github/license/cworld1/da-learning?style=flat-square)](https://github.com/cworld1/da-learning/blob/main/LICENSE)

Some notes and code about CWorld learning Data Analysis.

[Get Started 前往阅读 →](https://da.cworld.top/)

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

As the author is only a beginner in learning Data Analysis, there are obvious mistakes in his notes. Readers are also invited to make a lot of mistakes. In addition, you are welcome to use PR or Issues to improve them.

## Thanks

Some of the electronic textbooks have helped the author a lot in his studies, and without them, this notebook would not have been possible. I would like to express my gratitude to the original authors of these materials. If you have any doubts about this project, you can also read the following textbooks carefully to remedy them.

- [STATS 201 : Data Analysis](https://courseoutline.auckland.ac.nz/dco/course/STATS/201/1215)

## License

This project is licensed under the GPL 3.0 License.

[![Creative Commons](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en)

This documention is admitted by [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](http://creativecommons.org/licenses/by-nc-sa/4.0/).

> **Note** This website is built using [Jupyter Book](https://jupyterbook.org/en/stable/), a [Jupyter](https://jupyter.org/) static website generator.
