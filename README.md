## ☔ FiveM - NoX Public Scripts ☔

### Nox public scripts exposes all the scripts required for the perfect ecosystem. 

- ⚠️ To use this repository you still need access to a lot of private scripts used in public scripts 
- ⚠️ Why then still expose the scripts  to the public and not only private ?
  - It allows anyone that is onboarded into the ecosystem developing scripts to still attempt to initialize the scripts and if their Git is set up correctly proceed or get a helpful message of what happened.
  - Having a public entry point and allow future improvements to be made to the initialization process for people not onboarded into the ecosystem as the norm is already public no going from private to public.
  - We can expose certain logic to the public that can be used in any of the mods for that was created in the nox ecosystem. Currently, there is no example of this but the potential does exist
  - **We will expose more to the public in the future, first we need to build a solid base first**

### Important Folder / File Explanations

- [./scripts](scripts) - Contain general bash scripts that can either be used in a Windows subsystem for linux, mac or linux env. These scripts will help set up an env that the scripts might require, usually a python env.
  - [./scripts/common](scripts%2Fcommon) - Common scripts are generally used more throughout all the nox ecosystem pieces.
    - [./scripts/common/prepare-env.sh](scripts%2Fcommon%2Fprepare-env.sh) ⚠️ - This file is used to initialize the python env for a script. It attempts to set up the env required and install all the requirements.
    - [./scripts/common/prepare-scripts.sh](scripts%2Fcommon%2Fprepare-scripts.sh) Boilerplate reduction script - We will many times check if the nox public scripts are available, if not then we will create the temp dir and pull the nox public scripts as it is the core all processes.
  - [./scripts/cleanup.sh](scripts%2Fcleanup.sh) - Super basic script to allow nox public to define what should be cleaned up as nox public will create most of the mess around the structures. Run this to remove all the sources and python setup.
  - [./scripts/initialize.sh](scripts%2Finitialize.sh) ⚠️⚠️⚠️ - This script is the entry point for your `bash command below` running this script will attempt to bring all the puzzle pieces together and set up a working FiveM mod for you.
- [./src](src) - Contains all the python scripts that will be used to set up the FiveM mod. The `scripts` setup the env or init calls, `src` is the core of creating everything for you
  - [./src/templates](src%2Ftemplates) - Contains template that will be compiled with Mustache, these templates is the base for your FiveM Script
  - [./src/lib](src%2Flib) - Core scripts
    - [./src/lib/framework.py](src%2Flib%2Fframework.py) - Responsible to detecting / writing or retrieving a cached framework (Do not have to redetermine everytime what is the framework we are working with)
    - [./src/lib/importer.py](src%2Flib%2Fimporter.py) - Boilerplate reduction to import Nox Modules, When called the importer checks if the module exists then updates it. If it does not exist the importer will attempt to pull the git repository
    - [./src/lib/logger.py](src%2Flib%2Flogger.py) - All the pretty printing you will see, example: [INFO] XYZ
    - [./src/lib/template.py](src%2Flib%2Ftemplate.py) - Responsible for choosing the correct template for your script, compile the mustache and generate the template for your script so that you can start coding
- [./tests/test_entire_flow.sh](tests%2Ftest_entire_flow.sh) - To test if the public scripts and all the requirements work run this script. It will attempt to run the same command a new users will and generate a script. If this fails then something big is wrong
- [./requirements.txt](requirements.txt) - Python requirements for the scripts to run

### Usage

To generate a FiveM QB-Core template run the script below in a empty directory. This will create the following in your directory:

- ****Base template you can use to code your FiveM mod.****
  - Instantly start writing code in your client/server folder


- ****Server for your mod****. 
  - Alongside your mod a server will be added
  - When you run this server your mod will automatically be pulled into the server and a base qb-core will be started. You can then easily test your mod isolated without worrying about copy + paste, refreshing, and setting up an entire server. 


- ****Automatic Mod Refresh****
  - A script will monitor your script folder, if you change anything in your client or server the script will automatically be refreshed on the FiveM server. Thus you can run your server in the background and code your mod, swap to the game and your latest code will already be running.

 
- ****Testing Framework (In Progress, Currently only used in the Nox Core\)****
  - A custom wrote testing framework is shipped with your mod to allow unit testing against your code


- ****In-Game Acceptance Testing (In Progress)****
  - A custom framework that executes an acceptance test, this test will launch a FiveM server with your mod and some custom code in it, Launch Fivem, Join your private server, execute the custom code and attempt to generate specific results. The acceptance test will then verify the results to make sure you can produce x or y in game

### Usage - Generate the FiveM QB-Core Template
```
curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/initialize.sh | bash -s -- init-base.py qb-core
```