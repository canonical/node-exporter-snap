<h1 align="center">
  <img src="logo.svg?raw=true" alt="Node Exporter">
  <br />
  Node Exporter
</h1>

<p align="center"><b>This is the snap for <a href="https://github.com/prometheus/node_exporter">node-exporter</a></b>. Exporter for hardware and OS metrics exposed by *NIX kernels, written in Go with pluggable metric collectors.</p>

<!-- Uncomment and modify this when you are provided a build status badge
<p align="center">
<a href="https://snapcraft.io/my-snap-name">
  <img alt="enpass" src="https://snapcraft.io/my-snap-name/badge.svg" />
</a>
<a href="https://snapcraft.io/my-snap-name">
  <img alt="enpass" src="https://snapcraft.io/my-snap-name/trending.svg?name=0" />
</a>
</p>
-->

<!-- Uncomment and modify this when you have a screenshot
![my-snap-name](screenshot.png?raw=true "my-snap-name")
-->

<p align="center">Published for <img src="https://raw.githubusercontent.com/anythingcodes/slack-emoji-for-techies/gh-pages/emoji/tux.png" align="top" width="24" /> with 💝 by The Canonical Observability Team</p>

## Install

    sudo snap install node-exporter

<!-- Uncomment and modify this when your snap is available on the store
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-white.svg)](https://snapcraft.io/my-snap-name)
-->

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))


## Post-installation

The `node-exporter` snap requires some interfaces to be manually connected in order to grant permission to collect certain metrics. Without these connections, only basic metrics are available. To connect all exposed interfaces, run the following commands after installation:

```bash
sudo snap connect node-exporter:hardware-observe
sudo snap connect node-exporter:mount-observe
sudo snap connect node-exporter:network-observe
sudo snap connect node-exporter:system-observe
sudo snap connect node-exporter:proc-sys-kernel-random
```

## Configuration

Collectors can be enabled/disabled using the `collectors` and `no-collectors` configuration options with this snap. To specify multiple collectors, use a quoted string with space-separated values. For example:

```bash
sudo snap set node-exporter collectors=ntp
sudo snap set node-exporter no-collectors="mdadm netstat"
```

Reference the [prometheus/node_exporter README.md](https://github.com/prometheus/node_exporter/blob/master/README.md#collectors) for the list of collectors enabled by default.


## Known issues

Currently this strictly confined snap has no access to system files that prevents the following collectors from operating correctly:

- buddyinfo
- logind
- mountstats
- slabinfo
- softirqs

For more details read:

https://forum.snapcraft.io/t/should-some-snapd-interfaces-be-modified/48242