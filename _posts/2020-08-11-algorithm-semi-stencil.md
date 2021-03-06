---
layout: single
title: "Paper: semi-stencil algorithm"
date: 2020-08-11
tags: paper hpc
---

Recently, I have read
[an interesting article](https://dl.acm.org/doi/abs/10.1145/2591006)
describing the semi-stencil algorithm.

This algorithms splits stencil applications in a forward and a backward
part and reuses the points that are loaded into cache for both parts at
once:
```
x_i   += a_0  x_i + a_1  x_i+1 + a_2 x_i+2    (forward)
x_i+2 += a_-2 x_i + a_-1 x_i+1                (backward)
```

This turns out to be beneficial especially for larger stencils (> 25
points) with speed-ups of about 1.2-1.7. A nice benefit of this method
is that it is independent of other optimizations, such as cache blocking
for loops. This makes it interesting when optimizing finite-difference codes or
stencil codes in general that often hit the memory-bandwidth barrier.
