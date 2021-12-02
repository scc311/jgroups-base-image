# JGroups Setup

JGroups is not part of the Java Platform (the “standard library” for those who prefer more C-like terms) like Java RMI is, so it can’t simply be used in your program with just a `import java.X` or `import javax.X`. Instead, JGroups is a library provided from an external `.jar` file. This document covers 3 things:
  1. How to get JGroups
  2. How to compile a program that uses the JGroups library
  3. How to make your language server aware of JGroups

## 1. How to get JGroups

To get JGroups you'll need to download the `.jar` file. You can do so from the JGroups [sourceforge page](https://sourceforge.net/projects/javagroups/files/JGroups/). As to be better supported by both online documentation and teaching staff, you should be using version `3.6.20`. You then want to save the downloaded `.jar` file to a known location so you can refer to it later.

### With Docker

If you're using docker, then [this repository](https://github.com/scc311/jgroups-base-image) is where you want to be. This provides a docker image that you can use as a base for your own docker images. This base includes both Java and JGroups (and its already added to you classpath too so you can even skip step 2). It is these docker images that are used in the [template repository](https://github.com/scc311/jgroups-template).

## 2. Compile & Run with JGroups

When writing code that uses JGroups, you'll probably have a few imports that start like `import org.jgroups.`. But even know you have downloaded the `.jar` file, compilation with a simple `javac` command will fail. To compile and run, the Java tooling needs to know where the code you import is located. This is typically known to the tools as it is normally the Java platform API in use. However, as JGroups is not part of the platform, the tools don't know where it is, hence compilation will fail. You can tell the tools where to find extra libraries via the `CLASSPATH`. The 2 main ways of setting this path are:

 - Adding to the `CLASSPATH` environment variable to contain either a path to a library, or a directory containing libraries.
   - This is perhaps the simplest "set and forget" method, however can be more awkward to configure.
 - Setting the `CLASSPATH` via command line arguments in the `javac` and `java` commands.

> In this document, I've used `library` as a synonym for `package` to better generalize the concepts

To set the classpath via the command line argument, you simply need to be in the root directory of your Java project (or in the same directory as your `.java` files if you don't use packages) and know the path (relative or absolute) to the `.jar` file(s) containing the library(s). Each package you need to use should be separated by a colon (`:`), and so java can still use packages defined in your local directory, you also need to include a final path: your current directrory (`.`). For example, to use the JGroups package and packages in your local project, you can run the following:

```bash
javac -cp "<path to your .jar file>":. <your java files (e.g. *.java)>
```
> 🪟    **Windows Users**: In the `-cp` argument, use a semi-colon (`;`) in place of the colon (`:`) separator used in Linux and MacOS.

Running compiled Java applications is a similar issue. You must again specifically tell the tools where to find the non-platform libraries. This is again done via the classpath.

### Example

For example, if wanting to compile and run all the code in the [template repository](https://github.com/scc311/jgroups-template) without using Docker on a Linux or MacOS system:
 1. Download the JGroups `.jar` file and place it in the repository's root.
 2. Compile the code like so:
    ```bash
    javac -cp "./jgroups-3.6.20.Final.jar":. */*.java
    ```
 3. Repeat the following `N` times to create `N` backend servers:
    ```bash
    java -cp "./jgroups-3.6.20.Final.jar":. -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=127.0.0.1 backend.Backend
    ```
 4. Run a frontend server:
    ```bash
    java -cp "./jgroups-3.6.20.Final.jar":. -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=127.0.0.1 frontend.Frontend
    ```
 5. Run a client (and get a random number between 0 and 100):
    ```bash
    java -cp "./jgroups-3.6.20.Final.jar":. client.Client 0 100
    ```

> 🍎    **MacOS Users**: The `-Djava.net.preferIPv4Stack=true` flag is for you! JGroups [might not run correctly](https://github.com/belaban/JGroups/wiki/Multicast-routing-on-Mac-OS) without it. Please keep this flag in regardless of your OS though!


## 3. Add JGroups to Your Workspace

> Visual Studio Code is perhaps the most popular editor used by the class, so this section is relevant to just that. If you use another editor, it is up to you to find out how to perform a like action.

When programming with JGroups, your editor will likely not be able to find any references to JGroups via the language server (the part of the editor that helps correct you and place red underlines when it thinks you've not done something correctly). If you want to fix this, you can do so with by adding the `.jar` to your project's list of referenced libraries. The `gif` below shows this process for the latest VS Code as of Nov 2021:

![reference jgroups](./.assets/jgroups-reference.gif)

> 🐧  **Linux Users**: I haven't had to make any notes about config quirks for you. Thanks for being awesome and making this documentation easier to write!
