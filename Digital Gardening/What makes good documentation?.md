---
title: What makes good documentation?
created: 2025-11-26
updated: 2025-11-26
publish: true
tags:
  - essay
  - documentation
---
During my time at Vectra AI, I noted how little I documented my work. This is a total shift in priorities relative to grad school where people spent unreasonable amounts of time critiquing extensive analysis documentation and zero time reading my code. At Vectra, I wrote a lot of code reviews (and that's good!) but very rarely did I spend time documenting my decision making.

Note that I'm not saying I didn't document my *code*. I used docstrings and inline comments and I documented the timeline of work with tickets and (brief) PR descriptions. But I did *not* document the decision making that went into the tickets, PR descriptions, code, model training; all of the stuff that impacts the business logic that makes the product work.

"What made the author choose to take an average of ratios instead of the ratio of sums?" No idea - and good luck searching for any supporting figures in notebooks or Jira, let alone commentary on where the data in the plot came from, assumptions that were made in a research analysis, etc.

"But Lucas, we have a model training repository where you can put python notebooks that have both the code and commentary!" Let he who has read the notebooks from a previous project cast the first stone.

There is valuable content in these artifacts but they are also great examples of a lot of technical description with no business context. What's the working theory behind the technique? How did we test to make sure the technique didn't introduce biases? Why are these features in the data relevant to the task? How is the project helping customers? Even more importantly, what are the ways things can go wrong? Where do assumptions break down? What do the developers expect to happen if the assumptions breakdown?

This leads to (what I find to be) an important insight: great documentation starts from considering who the reader is and what are the most important things they need to know, not what are *all of the things the writer knows*.