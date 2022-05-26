# Building inside a VSCode Dev Container

## Creating a Dev Container Workspace:

- [Install and configure VSCode for container development](https://code.visualstudio.com/docs/remote/containers-tutorial) on your platform
    - Optionally, you can use [GitHub Codespaces](https://github.com/features/codespaces) and develop in the cloud.
- Run VSCode on your computer.
- Press Ctrl-Shift-P and start typing ```Remote-Containers: Clone Repository in Container Volume``` and press Enter.
- Paste in the url for this repositoy into the URL input field ```https://github.com/aughey/MarlinBuilder.git```
- Wait while the container starts and installs necessary dependencies.

## _Checkout Marlin_
```
git clone git@github.com:MarlinFirmware/Marlin.git Marlin -b bugfix-2.0.x --depth 1
```

## _Run build steps_
For each machine you want to target, replace V1CNC_ConfigName with the machine config. (eg. V1CNC_SkrPro_DualLR_2209)
```
source .venv/bin/activate
src/core/config-for-machine V1CNC_ConfigName
src/core/build-for-machine
```

## _Post build cleanup_
Optional but helps when getting build errors between different configurations
```
cd Marlin
git checkout .
git reset --hard
git clean -f
cd ..
```
