# 😇 PRIVATE 😇

## FiveM scaffolding when creating nox scripts 😇

Run the following command in an empty directory to pull all the core libraries required to create a nox mod for FiveM.

The libraries contain the following:

- `Core`: The nox-core required for all the libraries
- `Public`: Contains public code and scaffolding for creating a nox mod
- `Server`: A lightweight server for testing your nox mod, This will pull fivem, nox-core and attempt to generate and run a server
- `Testing` Suite: Used for unit testing your nox mod and nox core

```
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/init.sh)
```


### QB Core

Run the following command to generate a nox mod that works on QB Core

```
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/qb-core/write-template.sh)
```


### ESX

Run the following command to generate a nox mod that works on ESX

```
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/esx/write-template.sh)
```
