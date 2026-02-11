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


## Configuration

### Collectors

Collectors can be enabled/disabled using the `collectors` and `no-collectors` configuration options with this snap. To specify multiple collectors, use a quoted string with space-separated values. For example:

```bash
sudo snap set node-exporter collectors=ntp
sudo snap set node-exporter no-collectors="mdadm netstat"
```

Reference the [prometheus/node_exporter README.md](https://github.com/prometheus/node_exporter/blob/master/README.md#collectors) for the list of collectors enabled by default.

### Listen Address

The listen address and port can be configured using the `web.listen-address` option. The default is `:9100` (all interfaces on port 9100). For example:

```bash
# Change port only (all interfaces)
sudo snap set node-exporter web.listen-address=":9200"

# Bind to specific IPv4 address and port
sudo snap set node-exporter web.listen-address="127.0.0.1:9100"

# Bind to specific IPv6 address and port
sudo snap set node-exporter web.listen-address="[::1]:9100"
```

To verify the configuration was applied successfully and check for any errors, view the service logs:

```bash
sudo journalctl -u snap.node-exporter.node-exporter -n 50
```
