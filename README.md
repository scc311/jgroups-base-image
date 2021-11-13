# JGroups Base Image 🐳

This repository contains 2 docker images that contain JGroups and Java: one the full JDK, the other just the JRE. These images can be used as base images for your own Dockerfiles. You can see an example usage in the [JGroups Template repository](https://github.com/scc311/jgroups-template).

---

## Available Images

Both the JRE and JDK images are built with multiple JGroups versions:

 - Java: `11`
 - JGroups: `3.6.20`, `4.2.4`, `5.0.0`

The tag format to specify these versions is: `ghcr.io/scc311/jgroups:{JAVA_VERSION}-{JGROUPS_VERSION}`

> For example `ghcr.io/scc311/jgroups:11-3.6.20` and `ghcr.io/scc311/jgroups:jre-11-3.6.20` will have Java version 11 and JGroups version 3.6.20.

## Suggested Image

For completing the SCC311 coursework, it is suggested that you use Java `11` and JGroups `3.6.20`. To get support for any issues from a TA, you must be using those versions for the JDK and JRE (if using docker).
