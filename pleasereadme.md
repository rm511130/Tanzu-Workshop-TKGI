<p><a id="examples" title="Examples" class="toc-item"></a></p>

<h2>Examples</h2>

<ul class="example-nav js-examples-nav">
  <li><a href="#" class="selected" data-container-id="example-text" data-proofer-ignore="">Text</a></li>
  <li><a href="#" data-container-id="example-lists" data-proofer-ignore="">Lists</a></li>
  <li><a href="#" data-container-id="example-images" data-proofer-ignore="">Images</a></li>
  <li><a href="#" data-container-id="example-headers" data-proofer-ignore="">Headers &amp; Quotes</a></li>
  <li><a href="#" data-container-id="example-code" data-proofer-ignore="">Code</a></li>
  <li><a href="#" data-container-id="example-extras" data-proofer-ignore="">Extras</a></li>
</ul>

<div class="markdown-example" id="example-text">
<pre class="source">
It's very easy to make some words **bold** and other words *italic* with Markdown. You can even <span style="white-space:nowrap">[link to Google!](http://google.com)</span>
</pre>
<div class="rendered">
It's very easy to make some words <strong>bold</strong> and other words <em>italic</em> with Markdown. You can even <a href="http://google.com">link to Google!</a>
</div>
</div>

<div class="markdown-example" id="example-lists" style="display:none">
<pre class="source">
Sometimes you want numbered lists:

1. One
2. Two
3. Three

Sometimes you want bullet points:

* Start a line with a star
* Profit!

Alternatively,

- Dashes work just as well
- And if you have sub points, put two spaces before the dash or star:
  - Like this
  - And this
</pre>
<div class="rendered">
  <p>Sometimes you want numbered lists:</p>
  <ol>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  </ol>
  <p>Sometimes you want bullet points:</p>
  <ul>
  <li>Start a line with a star</li>
  <li>Profit!</li>
  </ul>
  <p>Alternatively,</p>
  <ul>
  <li>Dashes work just as well</li>
  <li>And if you have sub points, put two spaces before the dash or star:
  <ul>
  <li>Like this</li>
  <li>And this</li>
  </ul>
  </li>
  </ul>
</div>
</div>

<div class="markdown-example" id="example-images" style="display:none">
<pre class="source">
If you want to embed images, this is how you do it:

![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)
</pre>
<div class="rendered">
  <p>If you want to embed images, this is how you do it:</p>
  <p><img src="https://octodex.github.com/images/yaktocat.png" alt="Image of Yakotocat" /></p>
</div>
</div>

<div class="markdown-example" id="example-headers" style="display:none">
<pre class="source">
# Structured documents

Sometimes it's useful to have different levels of headings to structure your documents. Start lines with a `#` to create headings. Multiple `##` in a row denote smaller heading sizes.

### This is a third-tier heading

You can use one `#` all the way up to `######` six for different heading sizes.

If you'd like to quote someone, use the &gt; character before the line:

&gt; Coffee. The finest organic suspension ever devised... I beat the Borg with it.
&gt; - Captain Janeway
</pre>
<div class="rendered">
  <h1>Structured documents</h1>

  <p>Sometimes it&rsquo;s useful to have different levels of headings to structure your documents. Start lines with a <code>#</code> to create headings. Multiple <code>##</code> in a row denote smaller heading sizes.</p>

  <h3>This is a third-tier heading</h3>

  <p>You can use  one <code>#</code> all the way up to <code>######</code> six for different heading sizes.</p>

  <p>If you&rsquo;d like to quote someone, use the &gt; character before the line:</p>

  <blockquote><p>Coffee. The finest organic suspension ever devised&hellip; I beat the Borg with it.
  - Captain Janeway</p></blockquote>
</div>
</div>

<div class="markdown-example" id="example-code" style="display:none">
<pre class="source">
There are many different ways to style code with GitHub's markdown. If you have inline code blocks, wrap them in backticks: `var example = true`.  If you've got a longer block of code, you can indent with four spaces:

    if (isAwesome){
      return true
    }

GitHub also supports something called code fencing, which allows for multiple lines without indentation:

```
if (isAwesome){
  return true
}
```

And if you'd like to use syntax highlighting, include the language:

```javascript
if (isAwesome){
  return true
}
```
</pre>
<div class="rendered">
  <p>There are many different ways to style code with GitHub&rsquo;s markdown. If you have inline code blocks, wrap them in backticks: <code>var example = true</code>.  If you&rsquo;ve got a longer block of code, you can indent with four spaces:</p>

<pre><code>if (isAwesome){
  return true
}
</code></pre>

  <p>GitHub also supports something called code fencing, which allows for multiple lines without indentation:</p>

<pre><code>if (isAwesome){
  return true
}
</code></pre>

  <p>And if you&rsquo;d like to use syntax highlighting, include the language:</p>

<div class="highlight highlight-javascript"><pre><span class="k">if</span> <span class="p">(</span><span class="nx">isAwesome</span><span class="p">){</span>
  <span class="k">return</span> <span class="kc">true</span>
<span class="p">}</span>
</pre></div>

</div>
</div>

<div class="markdown-example" id="example-extras" style="display:none">
<pre class="source">
GitHub supports many extras in Markdown that help you reference and link to people. If you ever want to direct a comment at someone, you can prefix their name with an @ symbol: Hey @kneath — love your sweater!

But I have to admit, tasks lists are my favorite:

- [x] This is a complete item
- [ ] This is an incomplete item

When you include a task list in the first comment of an Issue, you will see a helpful progress bar in your list of issues. It works in Pull Requests, too!

And, of course emoji!
</pre>
<div class="rendered">
  <p>GitHub supports many extras in Markdown that help you reference and link to people. If you ever want to direct a comment at someone, you can prefix their name with an @ symbol: Hey <a href="https://github.com/kneath" class="user-mention">@kneath</a> — love your sweater!</p>

  <p>But I have to admit, tasks lists are my favorite:</p>

  <ul class="task-list">
  <li class="task-list-item">
  <input type="checkbox" class="task-list-item-checkbox" checked="" disabled="" /> This is a complete item</li>
  <li class="task-list-item">
  <input type="checkbox" class="task-list-item-checkbox" disabled="" /> This is an incomplete item</li>
  </ul>
  <p>When you include a task list in the first comment of an Issue, you will see a helpful progress bar in your list of issues. It works in Pull Requests, too!</p>
  <p>And, of course emoji! </p>

</div>
</div>
