---
layout: single
title: "Paper: Accelerating High-Order Stencils on GPUs"
date: 2020-09-18
tags: 
---

This [paper on arXiv](https://arxiv.org/abs/2009.04619) looks interesting
because the authors show different implementations of a 25-point
finite-difference stencil (octopus also uses such a stencil) on GPUs. The
implementations include different techniques, such as 3D blocking vs. 2.5D
blocking, semi-stencil, and explicit shared-memory and register usage. They
evaluate the different versions on different architectures to find the fastest
algorithm. Interestingly, the simplest variant with 3D blocking and using global
memory is the fastest on Volta GPUs, whereas other variants are fastest on
Pascal GPUs. The reasoning behind different optimization strategies is nicely
described in the paper!
