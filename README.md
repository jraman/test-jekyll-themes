# test-jekyll-themes
_Test Jekyll themes for GitHub Pages, especially LaTeX_

## Github Pages
References:
 * GitHub Pages homepage: [pages.github.com](https://pages.github.com/)
 * [Working With Github Pages](https://help.github.com/en/github/working-with-github-pages "includes Jekyll")
 * [YouTube Video Intro (4 min)](https://www.youtube.com/watch?v=2MsN8gpT6jY)
 * [Setting up a GitHub Pages site with Jekyll](https://help.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll)
 

There are two types of GitHub Pages:
 1. `username.github.io`: A user's GitHub Pages.  It is a separate
    repo of the same name i.e. `username.github.io`.  For example, if
    your username is `jraman`, then create a repo named
    `jraman.github.io`.
 1. GitHub Pages for an existing repo (aka project).  You will
    configure this in Settings--scroll down the "GitHub Pages" section

There are multiple ways to configure:
 1. Using the `master` branch in the root directory.
 1. Using the `master` branch in the `docs/` directory.
 1. Using a `gh-pages` branch.  Prior to August 2016, it used to be
    that this was the only way to configure GitHub Pages for repos,
    but not anymore.  See this [GitHub
    blog](https://github.blog/2016-08-17-simpler-github-pages-publishing/).

In this repo we will use the `docs/` director (aka folder).

## Software Stack
 * [ruby](https://en.wikipedia.org/wiki/Ruby_(programming_language))
   -- interpreter for Ruby, a high-level programming language (Jekyll
   is written in Ruby as is kramdown).
 * [rbenv](https://github.com/rbenv/rbenv#readme) -- a Ruby version
   manager.  Used to install and activate Ruby versions.
 * gem ([RubyGems](https://en.wikipedia.org/wiki/RubyGems)) -- a
   package manager for Ruby.  Python equivalent: `pip`.  A Ruby module
   is also called a Gem--get it? :).
 * bundle (Bundler) -- Ruby application dependency manager
   i.e. manages packages required for an application.  Python
   equivalent to `bundle install`: `pip install -r requirements.txt`.
   `bundle` can also execute a Ruby script in a specific enviroment,
   while `pip` does not.
 * Jekyll -- Ruby package for static site generation and maintenance.
 * [kramdown](https://kramdown.gettalong.org/) -- Ruby library for
   parsing and converting a superset of Markdown.  Also supports LaTeX
   in Markdown.  In addition to HTML, kramdown also converts to LaTeX,
   [kramdown](https://kramdown.gettalong.org/syntax.html), etc.
 * [Markdown](https://en.wikipedia.org/wiki/Markdown) -- a lightweight
   markup language.
 * [MathJax Demos](https://github.com/mathjax/MathJax-demos-web)
 * [HTML](https://en.wikipedia.org/wiki/HTML) -- a heavyweight markup
   language.  It stands for
   [HyperText](https://en.wikipedia.org/wiki/Hypertext) Markup
   Language.
 
As you can see, there's lots of languages, types of languages,
installers, and package managers in play here.

## rbenv -- Ruby version manager

 * README: https://github.com/rbenv/rbenv#readme

Check `rbenv` installation:
``` sh
# Run rbenv-doctor
$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
# You may need to run which the following adds ~/.rbenv/shims to PATH and does other things.
$ eval "$(rbenv init -)"
```

``` sh
# Display available ruby version.  * = active version.
$ rbenv versions
*  system
  2.7.0 (set by ~/.rbenv/version)

# Set the global ruby version
$ rbenv global 2.7.0

# Check
$ rbenv version
2.7.0
$ ruby -v
2.7.0
```

## gem -- RubyGems program, package manager
 * Documentation: [rubygems.org](http://rubygems.org)
 * `gem`, the RubyGems program, is a command-line utility to install
   Ruby packages.  It "is a sophisticated package manager for the Ruby
   programming language" (from the `gem` manpage).
 * For gems with executables ruby installs a wrapper file.  The
    wrapper allows you to choose among alternate gem versions using
    _version_.  For example `rake _0.7.3_ --version` will run rake
    version 0.7.3 if a newer version is also installed.

## Bundler - dependency and environment manager
 * [bundler.io](https://bundler.io/)
 * Some similarities to virtualenv, in that they both make available
   the desired versions of the packages.

## Jekyll
[Jekyll](https://en.wikipedia.org/wiki/Jekyll_%28software%29) is a
static site generator written in Ruby originally by Tom
Preston-Werner, GitHub's co-founder in 2008.  It is especially suited
for blogs (pages with title and date).
 * It provides a template directory structure for blogs and articles.
 * Content is written by the user primarily in Markdown.
 * It also processes
   [Textile](https://en.wikipedia.org/wiki/Textile_(markup_language)),
   a lightweight markup language, and Liquid, a template language).
 * Many themes exist including officially supported ones and those
   written by other folks.
 * A Jekyll server, when run, automatically processes files as they
   are modified which may make it easier to develop.
 * Jekyll homepage: https://jekyllrb.com/

### Jekyll Structure and Functionality
 * Config is in `_config.yml`.  Search on github: `extension:yml
   filename:"_config.yml" language:YAML`.
 * YAML front matter to the top of any Markdown or HTML file: to set
   variables, title, layout, and other metadata.
 * Theme files location: `bundle info --path minima` or `bundle info
   --path <theme>`
 * Empty commit to trigger a Jekyll build on the server: `git commit
   --allow-empty -m "Force rebuild of site"`


### Jekyll Installation

We follow instructions from GitHub's page titled [Creating a GitHub
Pages site with
Jekyll](https://help.github.com/en/github/working-with-github-pages/creating-a-github-pages-site-with-jekyll).
Steps are detailed below.

From the [GitHub Dependency](https://pages.github.com/versions/) page,
we find that we need Jekyll 3.8.5.  We first install the latest
`bundler` and then install the required version of Jekyll.

``` sh
$ gem install bundler
Successfully installed bundler-2.1.4
Parsing documentation for bundler-2.1.4
Done installing documentation for bundler after 1 seconds
1 gem installed

# The GitHub Dependency page specifies version 3.8.5
# https://pages.github.com/versions/
$ gem install jekyll -v 3.8.5
Successfully installed jekyll-3.8.5
Parsing documentation for jekyll-3.8.5
Done installing documentation for jekyll after 0 seconds
1 gem installed

$ mkdir docs
$ cd docs
# Note the underscores
$ jekyll _3.8.5_ new .

# Check the version of jekyll
$ bundler exec jekyll -v
jekyll 3.8.5

# Start the server, which also monitors and compiles any changes to files on disk.
$ bundle exec jekyll serve
```

After `git push`ing the files, and configuring the
[Settings](/settings) to publish from the master branch, `/docs`
folder (aka directory), you should see a basic site at
`<username>.github.io/<repo>`.  For this project, it is
[jraman.github.io/test-jekyll-themes/](https://jraman.github.io/test-jekyll-themes/).

Open the Gemfile that was created and follow the instructions in the
Gemfile's comments to use GitHub Pages.

``` ruby
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
```

Accordingly, we
 1. Comment the `gem "jekyll"` line.
 1. Uncomment the `gem "github-pages"` line.
 1. `bundle install`.  This will print out error messages (in red) and
    recommend running `bundle update`.
 1. Run the command `bundle update`.

We also update the `baseurl` in `_config.yml` to
`/test-jekyll-themes`.  And push this and the above changes to GitHub.

That's it!

To view whether the change you pushed has been deployed, go to the
`environment` tab, which takes you to a [deployments
page](https://github.com/jraman/test-jekyll-themes/deployments).

### Trying out different themes

 * [Jekyll document on Themes](https://jekyllrb.com/docs/themes/)

We maintain separate branches for the different themes, as they may
have different configurations and what not.

A useful feature of git is to move (`-m`) and copy (`-c`) branches.
The capitalized version, `-M` and `-C`, force move and force copy,
respectively.

We will try the following methodology:
 * To make changes for an existing theme: make changes to the branch
   with the required theme, then force copy the theme branch to the
   master branch.
 * To create a new theme branch: create your new branch off of master.
   You could force copy the minimal branch, or whatever branch you
   wish, to master, before branching off of it.
 * We want to maintain a canonical list of pages across all branches.
   This may prove to be cumbersome.

```
git branch -C theme1 master
git branch -C theme2 master
```

Themes officially supported by GitHub are
[here](https://pages.github.com/themes/).

### Directory Structure
The directory structure of your Jekyll files (for example, in `docs/`)
looks something like:

```
|---_config.yml
|---404.html
|---about.md
|---index.md
|---_posts
|     |---2020-02-17-welcome-to-jekyll.markdown
|---_site
|    |---feed.xml
|    (... other files generated by Jekyll that make up the final site)
```


## MathJax
 * [MathJax Documentation](https://docs.mathjax.org/en/latest/index.html)
 * [Supported LaTeX Commands on MathJax 3.x](http://docs.mathjax.org/en/latest/input/tex/macros/index.html)
 * [Input
   types](http://docs.mathjax.org/en/latest/web/components/input.html):
   tex, tex-full, tex-ascii, MathML (mml)
 * [Output types](http://docs.mathjax.org/en/latest/web/components/output.html): CommonHTML (chtml) and SVG.
 * [Combinations](http://docs.mathjax.org/en/latest/web/components/combined.html):
   combine an input with an output.  E.g. tex-chtml, tex-svg, etc.
 * [Configuration for
   TeX](http://docs.mathjax.org/en/latest/options/input/tex.html) --
   including displayMath, inlineMath, macros, etc.
 * MathJax vs Kratex: https://www.intmath.com/cg5/katex-mathjax-comparison.php?processor=MathJax

### MathJax LaTeX Equations
 * For inline, use `$$` start and end demarcators in the same line.
 * For display, use `$$` demarcators in its own paragraph.
 * LaTeX block demarcators can be used within the `$$` blocks.
   Examples include `\begin{equation}` (numbered), `\begin{equation*}` (unnumbered),
   `\begin{align}`, `\begin{cases}`.
 

### MathJax config
 * [Configuring MathJax](https://docs.mathjax.org/en/latest/web/configuration.html#configuring-mathjax)

Example MathJax config:

``` js
<script>
MathJax = {
  tex: {
    tags: 'none',              // none=no eq numbering, ams=AMS numbering (some), all=all equations
    inlineMath: [              // start/end delimiter pairs for in-line math
	  ['$', '$'],
      ['\\(', '\\)']
    ],
    displayMath: [             // start/end delimiter pairs for display math
      ['$$', '$$'],
      ['\\[', '\\]']
    ],
    macros: {
      RR: '{\\bf R}',          // string replacement
      bold: ['{\\bf #1}',1]    // macro with one parameter
    }
}
</script>
```

Where does this go?  Probably in one of the `_includes` files for the
theme.  For example, in the So-Simple theme, the file "$(bundle info
--path so-simple 2>/dev/null)/_includes/scripts.html" checks if
mathjax is configured for this site and configures and includes the
required mathjax javascript file.

### SVG vs cHTML
 * SVG is better at rendering equations.  Not supported by IE9 and older browsers.
   And table sizes are fixed (does not change if window is resized).
 
Example script include:
``` js
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>
```

### Test with kramdown:

``` sh
# output is generated into stdout
$ kramdown _1.17.0_ _posts/2020-02-07-welcome-to-jekyll.markdown
```


### Tags vs Demarcators
`kramdown` inserts `<script type="math/tex">` blocks in the output
HTML.  While this is fine with the older version of MathJax (2.x), the
newer version (3.x) barfs at it.  See the script later below to strip
out these `<script>` blocks.

``` sh
http://docs.mathjax.org/en/latest/upgrading/earlier/jsMath.html
If you are generating your jsMath documents programmatically, it would
be better to convert from generating the jsMath <span> and <div> tags
to producing the corresponding MathJax <script> tags. You would use
<script type="math/tex"> in place of <span class="math"> and <script
type="math/tex; mode=display"> in place of <div class="math">.  See the
section on How mathematics is stored in the page for more details.

https://github.com/mathjax/MathJax/issues/2220
```

As specified in the MathJax ticket (#2220), the following script
strips out the `<script type="math/tex">` tags which MathJax 3.x is
unable to handle.  We create two separate configurations for MathJax
3.x and 2.x.  More
[here](https://docs.mathjax.org/en/latest/upgrading/v2.html#math-script-example).

``` js
{% if site.mathjax3 == true %}
<script>
// MathJax 3.x
MathJax = {
  tex: {
    tags: 'ams'              // none=no eq numbering, ams=AMS numbering (some), all=all equations
  },
  options: {
    renderActions: {
      // for mathjax 3, handle <script "math/tex"> blocks inserted by kramdown
      find_script_mathtex: [10, function (doc) {
        for (const node of document.querySelectorAll('script[type^="math/tex"]')) {
          const display = !!node.type.match(/; *mode=display/);
          const math = new doc.options.MathItem(node.textContent, doc.inputJax[0], display);
          const text = document.createTextNode('');
          node.parentNode.replaceChild(text, node);
          math.start = {node: text, delim: '', n: 0};
          math.end = {node: text, delim: '', n: 0};
          doc.math.push(math);
        }
      }, '']
    }
  }
}
</script>

<script type="text/javascript" id="MathJax-script" async
        src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
{% endif %}
{% if site.mathjax == true %}
// MathJax 2.x
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
{% endif %}
```

Flavors:
 * tex-svg.js
 * tex-mml-chtml.js

## References
 * Katz, Yehuda.  2010.  [Clarifying the Roles of the .gemspec and
   Gemfile](https://yehudakatz.com/2010/12/16/clarifying-the-roles-of-the-gemspec-and-gemfile/)
   - When developing a gem, use `gemspec` in your `Gemfile`.  Do not checkin `Gemfile.lock`.
   - When developing an app, checkin both `Gemfile` and
     `Gemfile.lock`.  Your `Gemfile` will not be dependent on
     `gemspec`.  The `Gemfile.lock` file notes the exact versions and
     sources of every piece of third-party code that was used in the
     application.


## Theme - Architect
This theme is officially supported by GitHub.

Print out this theme's directory on your computer.
``` sh
$ bundle info --path jekyll-theme-architect
~/.rbenv/versions/2.7.0/lib/ruby/gems/2.7.0/gems/jekyll-theme-architect-0.1.1
```

Note that the `_layouts` directory in this theme directory has only one html file, namely `default.html`


## Theme - So Simple
 * [Instructions](https://github.com/mmistakes/so-simple-theme/blob/master/docs/theme-setup.md)
 * [Documentation](https://github.com/mmistakes/so-simple-theme/blob/master/README.md)
 * Difference between `post` and `page` layouts:
   - post layout has a left column with meta information such as the
     author, date, categories, etc.  Some of them are hyperlinks.
	 page layout does not have this left rail, and hence the page content is wider.
   - post layout includes related posts at the end of the page.
 * Gotchas:
    - `index.html`, and not `index.md`.  If both are present, then `index.md` overrides.
	- If the date of the post (in the front matter YAML) is in the
      future, then the page will not be generated by Jekyll.  This
      might be a good way to start working on a page before publishing
      it.  [Haven't tried this on GitHub].


Layouts:

```
# Main
default    - the main layout.  All other page layout are derived from this.
home       - derived from page layout.
page       - derived from default layout.
post       - derived from default layout.


# Pivots
category     - derived from page layout.
collection   - derived from page layout.
search       - derived from page layout.
tag          - derived from page layout.

# Collections
categories    - derived from page layout.
posts         - derived from page layout.
tags          - derived from page layout.
```


## Liquid
 * [Liquid by Shopify](https://shopify.github.io/liquid/)

Liquid tag start with `{%` and end with `%}`.  For a basic explanation
and examples, see [Jekyll docs: Order of
interpretation](https://jekyllrb.com/tutorials/orderofinterpretation/)

Example: String variable, with defaults

```
<html lang="{{ page.lang | default: site.lang | default: 'en-US' }}"
```

## Embed Javascript in Markdown
 * [StackOverflow: Embed javascript in markdown](https://stackoverflow.com/questions/2754391/embed-javascript-in-markdown).  Asked May 2010.  Answer 2011.  Answer 2019.
    - Add a newline after the open-tag.
	- Escape the close-tag.  `<script\>... javascript code...</script\>`.
	- Modify the layout and add a YAML front matter variable.
	  ``` js
	  <!-- Custom JavaScript files set in YAML front matter -->
	  {% for js in page.customjs %}
	  <script async type="text/javascript" src="{{ js }}"></script>
	  {% endfor %}
	  ```
	  ``` yaml
	  # Front matter YAML
	  ---
	  layout: post
	  title: Adding custom JavaScript for a specific post
	  category: posts
	  customjs:
	  - http://code.jquery.com/jquery-1.4.2.min.js
	  - http://yourdomain.com/yourscript.js
	  ---
	  ```
 
