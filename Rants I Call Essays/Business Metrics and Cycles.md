---
title: Coverage Cycles
created: 2025-11-26
updated: 2025-12-15
publish: true
tags:
  - essay
  - "#metrics"
  - "#teams"
---
While working at Vectra, I was introduced to the concepts of "Objectives and Key Results" (OKRs) and "Key Performance Indicators" (KPIs). Initially, I treated these as dumb business ideas that were mostly disconnected from my daily work as an individual contributor and for me to largely ignore. As the culture of my team changed and the management tree evolved, KPIs took on a more prominent role in meetings.

My initial mental model treated OKRs and KPIs as interchangeable acronyms that just meant "business metrics". I eventually crafted a mental model that described OKRs as "mushy" **goals** the business wants to accomplish -- gain customer trust, be seen as the leader in the market, etc -- and KPIs as the measurable **metrics** that indicate whether the goals are being reached -- percent of customers indicating they are satisfied with the product, number of customer-facing incidents, number of new features shipped etc. 

On the first go at Vectra, KPIs were decided on by the business and then delivered to teams. My team was not happy with the KPIs. Specifically, our success as a team would hinge on the delta in the number of simulated attack samples the product would catch between year start and end; making measurements every quarter, if not every month.

This team was/is made up of scientifically minded individuals who immediately had obvious questions:
- Which attack samples qualify?
- Who will audit the quality of the sample set?
- Is the entire portfolio in play?
- How do we evaluate portions with online learning? (ie. the system sits and watches for days to learn "normal" before it can classify "abnormal")
- Can the set change mid-year?

That last one is especially poignant but nuanced. From a scientific and "fair" perspective, the set can't change if the metric is expected to go up. From a security perspective, the threat landscape can shift every few months and the important attacks to catch in December won't necessarily be the same as they were in January.

These dueling perspectives were represented physically by the data scientists and security researchers, respectively. Every week, the same issues would be brought up and the same replies would be said and we'd end on the non-action action of "let's just see what happens".

In case it's not clear, I'm annoyed by punting on these sorts of problems. Punting is fine when you expect to have more information at a later date or the future problem is clear but not considered a full threat just yet. But this problem was actively impacting our ability to make other decisions ("what do we work on?") and it was punted because it was complex; no new information was coming to save us.

In that year, I started reading more about systems thinking and learned two relevant ideas about complexity in teams building systems:
- Making assumptions so you can implement a simple solution to a complex problem does not resolve the complexity; it just ignores it and creates later problems when the assumptions inevitably breakdown. This is by definition -- if the assumption was fully valid, it wouldn't be an assumption but a property of the system.
- We confuse complexity in software systems with complexity in systems of humans building the software. We are prone to misclassify the latter as the former because we rather tackle the problem with the predicable computer versus the unpredictable human.

With these in mind, I spent time time mapping out the human system in play. I've included my diagram below (DS = Data Science Team, SR = Security Research Team).

![[coverage_goal_system_model.png]]

As part of this exercise, I realized that this is a simple development + QA relationship. I also uncovered the two interwoven cycles in purple and orange and, importantly, they are *constructive* like this:

![[Pasted image 20251126090830.png]]

and not *destructive* like this:

![[Pasted image 20251126090846.png]]

From a high level view, this makes sense -- both cycles are working to improve product coverage (the OKR!). But during team meetings, folks actively identified the process as "adversarial" in nature, implying a destructive relationship between the cycles. And if you consider the KPI -- increase the *percentage* of the sample set identified by the product as malicious -- it's easy to agree. One team is working on the numerator and the other on the denominator. Why would the percentage go up unless the DS cycle is considerably stronger than the SR one?

And *this* is why this KPI is actually a "dumb business idea" like I first thought. It started from the mental model that metrics only go up (or equivalently "down" if you're trying to make the product *less bad*) and then "the business" picked a number that doesn't change when progress is happening -- and more importantly, doesn't change when the product *regresses* or *nothing changes*. Maybe even sillier is that the proposed percentage can *never be greater than 100%*. If this year's goal is 80% and next year's is 100%, what is it the year after? The stonk does *not* always go up.

Finally, sudden changes in the metric make people feel uneasy. Why was there a sudden rise/drop? Did we suddenly start performing much better/worse? Or has the number of samples suddenly dropped/risen? Are people gaming the system?

The reality is that there are two valuable metrics -- (1) the total number of samples covered in the sample set (the numerator) and (2) the total number of samples in the set. If we're progressing, both should go up; and they can grow indefinitely unlike the percentage!

I proposed this to the team and the feeling I got in the room was that this was an obvious conclusion. I felt a bit stupid and like I was a step behind everyone else. But then something happened -- we continued computing the percentage, but the two metrics I proposed (total samples and samples covered) started appearing in their own dedicated columns instead of simple annotations, a sign they became metrics in their own right.

I choose to believe the reaction in the room was a case of a clear explanation making an interesting idea uninteresting. In any case, a basic exercise in modeling out the human system created an insight and sharing the insight changed the system itself.

## Some additional hot takes from this work
### Stonks only go up
- Businesses have an inherent desire to have metrics that increase
- There's no reason this needs to be true but the nature is a reality of the human system and this makes percentages bad metrics for just this reason
- Percentages are further bad if they measure relative strengths of the collaborating teams
### Go, Go, Go
- All teams have an incentive to work quickly but the nature of each team's work means progress rates may be more or less consistent; one team may be able to progress in frequent small chunks while the other progresses in infrequent large chunks.
- Unfortunately, the nature of the work means you can't always make your [OODA loop](https://en.wikipedia.org/wiki/OODA_loop) faster. If another team is getting inside your team's OODA loop and is making your job harder, treating them as a partner is more likely to result in success than treating them as an adversary.
- Teams working on "generalizable" solutions often perform fewer total cycles because their work covers more of the solution space
- There's a difference between quick fixes and simple, elegant solutions, especially if a solution can't be both quick and generalizable; the team working in big chunks shouldn't blur the lines just to match the rate of the partner team since they need fewer cycles to make the same amount of progress over time.
- Metric evaluations should never happen more frequently than the slowest cycle rate among teams. If they happen more frequently, the inclination will be to make the cycle rate faster rather than reduce the rate of the metric evaluation. This is costly, painful, and will result in worse outcomes in the long term as the team with the longer cycles compromises their work quality.
### Core feedback loop momentum
- The momentum of core feedback loops increases through collaboration, conceptual integrity, and creativity as the human system self-organizes around its goals
- Polluting the feedback loops with external (emergency) influences will reduce momentum of the core system
- Losing momentum happens faster than gaining momentum
- External influences shouldn't be ignored though. Team's should strategize and engineer systems to manage these influences in ways that reduce their impact on the core loop.