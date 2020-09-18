---
layout: single
title: "Paper: GPA: A GPU Performance Advisor Based on Instruction Sampling"
date: 2020-09-18
tags: paper, gpu
---

I recently came across [this paper](https://arxiv.org/abs/2009.04061) describing
GPA, a GPU performance advisor for Nvidia GPUs. It uses program counter sampling
via the CUPTI API of Nvidia and includes a static and a dynamic analyzer. After
collecting the data and running the analysis, the tool gives advice on code
changes and also includes estimates of the expected speed-ups. It seems to be an
interesting tool, but unfortunately, I think it's not available for the public.
