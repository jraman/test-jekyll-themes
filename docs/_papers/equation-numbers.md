---
layout: post
title:  "Math -- Numbered Equations"
date:   2020-02-18 08:22:50 -0800
categories: latex
---

In this document, we test MathJax's rendering of LaTeX equations and
the numbering of equations.

# Inline Equations

In the quadratic equation, $$a x^2 + b x + c = 0$$, $$a$$, $$b$$, and
$$c$$ are parameters.

In a summation example, $$\sum_{i=0}^{N} w_i x^i$$, the summation sign
and the limits are compressed in an in-line scenario, compared to a
display scenario.

We take the following examples from the [MathJax
Demos](https://github.com/mathjax/MathJax-demos-web/blob/master/equation-numbers.html) site.

# Equations with numbering
In this document, we test:
 1. if equations are rendered with MathJax.
 1. if the equations are numbered.
 
General rule for equations:
 * Surround the equation block, whether inline or display, with
   `$$`--both before the block and after the block.  This causes
   kramdown to replace the `$$` with `<script type="math/tex">` tags.
 * In Markdown 2.x, for LaTeX enviroments that do not have a `*`
   (e.g. like in `equation*`), then the `$$` markers are not
   necessary, although they do not harm and could help in cases where
   kramdown may muck with the equation.  This is only for Markdown 2.x.
 * For Markdown 3.0, the `$$` blocks are necessary.
 * In MathJax 3, the `<script type="math/tex">` do not work like they
   do with Markdown 2.x, and we need to insert a script (in the
   layout) to strip these `<script>` tags.

## equation

An `{equation}` enviroment.  Numbered in AMS.

$$
\begin{equation}
E = mc^2
\end{equation}
$$

## equation*

`{equation*}` enviroment.  It won't have an equation number.

$$
\begin{equation*}
E = mc^2
\end{equation*}
$$

<hr />
### Plain

We can simply surround the display equation with `$$`.  It won't have an equation number.

$$
E = mc^2
$$

### Plain tagged
We add a tag to the plain equation.

$$
E = mc^2  \tag{x}
$$

<hr />
### Split

Example of a `{split}` environment.

$$
\begin{equation}
\begin{split} 
a& =b+c-d\\ 
& \quad +e-f\\ 
& =g+h\\ 
& =i 
\end{split} 
\end{equation} 
$$

<hr />
## Multline

A `{multiline}` environment.  Numbered in AMS.

$$
\begin{multline}
  a+b+c+d+e+f+g\\
  M+N+O+P+Q\\
  R+S+T\\
  u+v+w+x+y+z
\end{multline}
$$

## Multline*

A `{multline*}` environment.  Not numbered.

$$
\begin{multline*}
  a+b+c+d+e+f+g\\
  M+N+O+P+Q\\
  R+S+T\\
  u+v+w+x+y+z
\end{multline*}
$$

<hr />
## Gather

A `{gather}` environment.  Each equation gets its own number.  For the
second equation, we have specified `\nonumber`.

$$
\begin{gather} 
a_1=b_1+c_1 \\ 
a_2=b_2+c_2-d_2+e_2 \nonumber \\
a_3 = b_3 + b_3 * c_3^2
\end{gather} 
$$

## Gather*

A `{gather*}` environment.

$$
\begin{gather*} 
a_1=b_1+c_1\\ 
a_2=b_2+c_2-d_2+e_2 
\end{gather*} 
$$

<hr />
## Align

An `{align}` environment.  Each equation gets its own number.  Second
equation has `\nonumber` specified.

$$
\begin{align} 
a_1& =b_1+c_1\\ 
a_2& =b_2+c_2-d_2+e_2 \nonumber \\
a_3 &= b_3 + c_3^2
\end{align}
$$

### Align with multiple `&` markers

$$
\begin{align} 
a_{11}& =b_{11}& a_{12}& =b_{12}\\ 
a_{21}& =b_{21}& a_{22}& =b_{22}+c_{22} 
\end{align}
$$

### Align with `\notag` and `\tag`

The first equation has a `\notag` and the second has `\tag{y}`.

$$
\begin{align} 
a_{11}& =b_{11}& a_{12}& =b_{12} \notag \\ 
a_{21}& =b_{21}& a_{22}& =b_{22}+c_{22} \tag{y}
\end{align}
$$

## Align*

An `{align*}` environment.  Equations are not numbered.

$$
\begin{align*} 
a_1& =b_1+c_1\\ 
a_2& =b_2+c_2-d_2+e_2 
\end{align*}
$$

### Align* with `\tag`

$$
\begin{align*} 
a_1& =b_1+c_1\tag{z}\\ 
a_2& =b_2+c_2-d_2+e_2 
\end{align*}
$$
