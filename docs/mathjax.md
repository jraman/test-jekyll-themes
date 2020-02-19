# MathJax

The corresponding script will be:

``` js
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/<name>.js"></script>
```
# TeX Input

Two options to render the TeX notation:
 * CommonHTML (chtml)
 * SVG (svg)

## tex-chtml
Process an HTML page containing TeX notation into math using the CommonHTML format.

``` js
<script>
  MathJax = {
    tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]}
  };
  </script>
  <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>
```

The `tex` setting is optional.  For Jekyll/kramdown, this is moot.

## tex-svg
Process an HTML page containing TeX notation into math in SVG format.

``` js
<script>
  MathJax = {
    tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]},
    svg: {fontCache: 'global'}
  };
  </script>
  <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js"></script>
```

The SVG output jax is configured to use a global font-path cache.

# MathML Input
## mml-chtml
Process an HTML page containing MathML notation into math using the CommonHTML format.

``` js
  <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/mml-chtml.js"></script>
```

### mml-svg
Process an HTML page containing MathML notation into math in SVG format.

``` js
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/mml-svg.js"></script>
```


## Equation Numbering

``` js
  <script>
  MathJax = {
    tex: {
      tags: 'ams'  // should be 'ams', 'none', or 'all'
    }
  };
  </script>
  <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>
```


## Skipped
 * **Macros example** (tex-macros) : predefine TeX macros for use in a
   web page in two different ways: either using the MathJax
   configuration to define them, or by embedding them in a hidden math
   expression.
 * **tex-mml**: Process an HTML page containing TeX notation into math
   in MathML format.  Needs a browser with native support for MathML.
