#!/usr/bin/env bash

# flush-dns is a helper script to clear the DNS cache for macOS.
sudo killall -HUP mDNSResponder
