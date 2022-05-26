# Building inside a VSCode Dev Container

The idea of building inside of a container is that the entire workspace, all the dependencies, are encapsulated into a pre-configured virtual Linux environment that is built on-the-fly.  This container can be created and destroyed in a matter of seconds and the environment is consistant for every developer.

## Creating a Dev Container Workspace:

- [Install and configure VSCode for container development](https://code.visualstudio.com/docs/remote/containers-tutorial) on your platform
    - Optionally, you can use [GitHub Codespaces](https://github.com/features/codespaces) and develop in the cloud.
- Run VSCode on your computer.
- Press Ctrl-Shift-P and start typing ```Remote-Containers: Clone Repository in Container Volume``` and press Enter.
- Paste in the url for this repositoy into the URL input field ```https://github.com/aughey/MarlinBuilder.git```
- Wait while the container starts and installs necessary dependencies.

## Use the top level build script
```
sh build.sh
```

This will show you a list of the available configurations.  Choose a configuration and add it
to the command line

```
sh build.sh V13DP_Rambo
```

## Transfer the firmware.hex file to your local computer

In the Explorer panel on the left side (press ```Ctrl-B``` to show this panel if it is hidden), right click on the firmware.hex file and choose ```Download```.