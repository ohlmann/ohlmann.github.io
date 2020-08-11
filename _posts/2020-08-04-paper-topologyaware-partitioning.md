---
layout: single
title: "Paper: Topology-aware partitioning"
date: 2020-08-04
tags: paper hpc
---

Today, I stumbled across an
[interesting paper](https://arxiv.org/abs/2008.00832) about improving mesh
partitioning and also load balancing by taking into account the underlying
hardware topology. The authors introduce *TreePart*, a library to improve upon
existing tools by using a topology-aware approach and MPI3 shared-memory
communication for intra-node communication. They see this development as an
alternative to hybrid MPI+X solutions because it makes the code aware of the
topology and also makes use of shared-memory communication.

Some interesting things they do:
* Using hierarchical communicators on node and socket level
* Blind send and receive queries using MPI windows to avoid all-to-all and
  allgather communication
* Shared-memory halo communication for intra-node halo exchange and send/recv
  halo communication for inter-node halo exchange
* Load balancing on different levels of the hierarchy

Some of those points might also be beneficial for other codes as well that use
mesh partioning.
