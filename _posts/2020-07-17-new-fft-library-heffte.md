---
layout: single
title:  "A new fft library: heFFTe"
date:   2020-07-17 09:43:04 +0200
tags: paper algorithm
---

I just found an interesting paper about a new FFT library for heterogeneous
architectures,
[heFFTe](https://link.springer.com/chapter/10.1007%2F978-3-030-50371-0_19).
It is developed in Jack Dongarra's group as part of the Exascale Computing
Project.

The library is based on a pencil decomposition of the domain combined with 1D
FFTs along each direction. This approach is known to involve more
transpositions, but it can scale to much larger core numbers than the slab
decomposition which is limited by the number of grid points in one direction.
The authors show quite impressive scalings on summit, up to 1024 nodes, although
the GPU version is faster only by a factor of about 2 than the CPU versions
(Summit nodes have 6 Volta GPUs per node). It seems they managed to speed up the
local kernels by a much bigger factor, but now the communication part is the
bottleneck (see their Figure 6).

This is definitely a development to keep an eye on.
