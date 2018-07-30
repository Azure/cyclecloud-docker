# Docker #

This project installs and configures the Docker container system.

Docker is a system for building and running Linux Containers. See the [Docker](https://www.docker.com) project site for more information and documentation.

The project includes an example cluster template which adds Docker to an SGE grid.   But the Docker project is intended primarily as an additional capability that can be added to any Cyclecloud cluster.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Docker](#docker)
    - [Pre-Requisites](#pre-requisites)
    - [Configuring the Project](#configuring-the-project)
    - [Deploying the Project](#deploying-the-project)
    - [Importing the Cluster Template](#importing-the-cluster-template)

<!-- markdown-toc end -->


## Pre-Requisites ##


This sample requires the following:

  1. CycleCloud must be installed and running.

     a. If this is not the case, see the CycleCloud QuickStart Guide for
        assistance.

  4. The CycleCloud CLI must be installed and configured for use.

  5. You must have access to log in to CycleCloud.

  6. You must have access to upload data and launch instances in your chosen
     Cloud Provider account.

  7. You must have access to a configured CycleCloud "Locker" for Project Storage
     (Cluster-Init and Chef).

  8. Optional: To use the `cyclecloud project upload <locker>` command, you must
     have a Pogo configuration file set up with write-access to your locker.

     a. You may use your preferred tool to interact with your storage "Locker"
        instead.


## Configuring the Project ##


The first step is to configure the project for use with your storage locker:

  1. Open a terminal session with the CycleCloud CLI enabled.

  2. Switch to the docker project directory.

  3. Copy the following source tarballs and/or RPM and DEB files to `./blobs`
    
  4. If the version number is not 2.4.5, update the version numbers in `project.ini` and `templates/pbs-docker.txt`

  5. If adding the RPM and/or DEB files, add them to the Files list in the `project.ini`
    

## Deploying the Project ##


To upload the project (including any local changes) to your target locker, run the
`cyclecloud project upload` command from the project directory.  The expected output looks like
this:

``` bash

   $ cyclecloud project upload my_locker
   Sync completed!

```


**IMPORTANT**

For the upload to succeed, you must have a valid Pogo configuration for your target Locker.


## Importing the Cluster Template ##


To import the cluster:

 1. Open a terminal session with the CycleCloud CLI enabled.

 2. Switch to the Docker project directory.

 3. Run ``cyclecloud import_template SGE-Docker -f templates/sge-docker.txt``.
    The expected output looks like this:
    
    ``` bash
    
    $ cyclecloud import_template SGE-Docker -f templates/sge-docker.txt --force
    Importing template PBS-Docker....
    ----------------------------
    SGE-Docker : *template*
    ----------------------------
    Keypair:
    Cluster nodes:
	master: off
    Total nodes: 1
    ```



# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.