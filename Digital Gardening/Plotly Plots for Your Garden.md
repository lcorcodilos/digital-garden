---
publish: true
title: Plotly Plots for Your Garden
date: 2025-05-15
tags:
  - quartz
---
I really wanted to get Plotly plots to be HTML rendered in both Obsidian and Quartz with the same automated magic that is currently working. First I had to figure out how to get the HTML to render in Obsidian. The secret was to `<iframe>`. However, it seems Obsidian removed the ability to just reference a file so relative paths (which would work well with porting to Quartz!) are disallowed. Instead, you need something like:
```html
<iframe
	src="file:///Users/lucascorcodilos/path/to/Digital-Garden/Digital Gardening/assets/plotly_test.html"
	width="75%"
	height="400px"
	style="border:none; display: block; margin: auto;"
></iframe>
```

<iframe src="file:///Users/lucascorcodilos/Library/Mobile Documents/iCloud~md~obsidian/Documents/Digital-Garden/Digital Gardening/assets/plotly_test.html" width="75%" height="400px" style="border:none; display: block; margin: auto;"></iframe>

I've added some extra height, width, and styling options to center the plot and make it the size I want. But the main part is the path.

Once this is shipped to Quartz, the true path is going to change but the path above will be unchanged (and wrong).

To get around this, I wrote (with the help of GitHub Copilot) a new Quartz plugin called `StripIFramePaths` that will look for `<iframe>` blocks, find the `src` field, and compare it to the path of the Markdown file containing the `<iframe>` block to identify the relative path in the `content/` folder to the referenced file.

This post is proof that this works.