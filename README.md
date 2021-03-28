# VBoxReady for Windows 10

![version](https://img.shields.io/badge/Version-1.0-blue) ![script](https://img.shields.io/badge/script-powershell-blue) ![build-status](https://img.shields.io/badge/build-passing-brightgreen)

Hyper-V is not a tool for inexperienced PC users. It’s a utility, which replaces Microsoft Virtual PC and allows running multiple operating systems on a single device. Hyper-V simplifies the lives of software developers, professional IT workers or tech-savvy people who opt for working or experimenting with multiple OS, including various Linux releases, FreeBSD, and Windows.

Many third-party virtualization applications don't work together with Hyper-V. Affected applications include VMware Workstation and VirtualBox. These applications might not start virtual machines, or they may fall back to a slower, emulated mode.

These symptoms are introduced when the Hyper-V Hypervisor is running. Some security solutions are also dependent on the hypervisor, such as:

- Device Guard
- Credential Guard

## Determine whether the Hyper-V hypervisor is running

To determine whether the Hyper-V hypervisor is running, follow these steps:
1. In the search box, type `msinfo32.exe`.
2. Select System Information.
3. 