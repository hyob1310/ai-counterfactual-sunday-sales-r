# ai-counterfactual-sundat-sales-r

Counterfactual forecasting: estimating Sunday revenue using time-series + ML in R



\## Proxy Comparison: Chick-fil-A vs McDonald’s



Chick-fil-A does not operate on Sundays, so no direct Sunday sales data exists.

To estimate potential Sunday revenue, this project uses McDonald’s as a proxy

for fast-food demand patterns.



McDonald’s is an appropriate comparison because it:

\- operates seven days a week

\- serves a similar quick-service customer base

\- exhibits strong weekend demand

\- relies heavily on takeout and drive-thru traffic



The analysis first learns Sunday-to-Saturday revenue patterns from

McDonald’s-like fast-food data, then applies these patterns to a

Chick-fil-A–style baseline to estimate counterfactual Sunday revenue.

## Executive Summary

Chick-fil-A remains closed on Sundays, creating a unique operational constraint.
This project estimates the potential revenue impact of Sunday operations using a
counterfactual forecasting approach.

Using McDonald’s as a fast-food proxy, the analysis measures how Sunday revenue
typically compares to Saturday revenue, then applies those patterns to a
Chick-fil-A–style baseline.

Results suggest that opening on Sundays could generate a meaningful weekly
revenue uplift per store under reasonable assumptions, with annual impacts
varying by scenario. These estimates are intended to support strategic
decision-making rather than predict exact outcomes.

## Results

Using McDonald’s-like fast-food data, Sunday revenue was estimated as a proportion
of Saturday revenue. This Sunday-to-Saturday ratio was then applied to a simulated
Chick-fil-A baseline.

Three scenarios were evaluated:
- **Conservative:** assumes lower-than-observed Sunday demand
- **Moderate:** assumes Sunday demand similar to comparable fast-food behavior
- **Aggressive:** assumes strong Sunday demand, capped at Saturday levels

Across scenarios, opening on Sundays would increase weekly revenue and result in
a six-figure annual uplift per store. These results highlight the financial
opportunity cost associated with remaining closed on Sundays.

