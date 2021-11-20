# JGroups Base Image 🐳

[![Rolling Release](https://github.com/scc311/jgroups-base-image/actions/workflows/rolling.yml/badge.svg?branch=main)](https://github.com/scc311/jgroups-base-image/actions/workflows/rolling.yml)

This repository contains 2 docker images that contain JGroups and Java: one the full JDK, the other just the JRE. These images can be used as base images for your own Dockerfiles. You can see an example usage in the [JGroups Template repository](https://github.com/scc311/jgroups-template).

---

## Available Images

Both the JRE and JDK images are built with multiple JGroups versions:

 - Java: `11`
 - JGroups: `3.6.20`, `4.2.4`, `5.0.0`

The tag format to specify these versions is: `ghcr.io/scc311/jgroups:{JGROUPS_VERSION}`

> For example `ghcr.io/scc311/jgroups:3.6.20` and `ghcr.io/scc311/jgroups:jre-3.6.20` will have JGroups version 3.6.20.

## Suggested Image

For completing the SCC311 coursework, it is suggested that you use Java `11` and JGroups `3.6.20`. To get support for any issues from a TA, you must be using those versions for the JDK and JRE (if using docker).

## Using JGroups (with or without Docker)

Although this Docker image and paired template might make using JGroups simple for those wanting to use Docker, you may need to know how to compile Java programs with JGroups without Docker too! See [this document](./TUTORIAL.md) to learn how to add JGroups to your local Java Classpath, allowing you to build and run JGroups programs without Docker.
