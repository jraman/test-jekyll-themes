---
layout: post
title:  "Math -- Equation References"
date:   2020-02-18 08:22:50 -0800
categories: latex
---
# Basic Reference
We first create a labeled equation.

$$
\begin{equation}
x + 1 \over \sqrt{1 - x^2} \label{ref1}
\end{equation}
$$

Then we use that label to create a reference, like so: Eq. $$\ref{ref1}$$.

Note that the reference produced is just the equation number and we have added the prefix "Eq."

We could also display it with square brackets within math mode,
Eq. $$[\ref{ref1}]$$, or outside it, Eq. [$$\ref{ref1}$$].


<hr />
# Forward Reference
Forward reference to the following equation:
 * `\ref{ref2}` creates a plain reference like so: Eq. $$\ref{ref2}$$.
 * `\eqref{ref2}` creates one with brackets like so: Eq. $$\eqref{ref2}$$.
 
$$
\begin{equation}
x + 2 \over \sqrt{1 - x^3} \label{ref2}
\end{equation}
$$

Here is a reference inside math: $$\ref{ref2} + x + 1$$ and text after it.

<hr />
# Reference inside math

$$
\begin{align} 
x & = y_1 - y_2 + y_3 - y_5 + y_8 - \dots && \text{by } \eqref{ref1} \\ 
& = y'\circ y^* && \text{by \eqref{ref3}} \\ 
& = y(0) y' &&
\end{align} 
$$

Reference $$\eqref{ref3}$$ is a forward reference.

Reference in an alignment with a `\nonumber` for the first equation:

$$
\begin{align}
a &= b \nonumber \\
  &= c+d  \label{ref3}
\end{align}
$$

<hr />
Examples are taken from MathJax-demos-web
[here](https://mathjax.github.io/MathJax-demos-web/equation-refs.html)
and [here](https://github.com/mathjax/MathJax-demos-web/blob/master/equation-refs.html.md).
