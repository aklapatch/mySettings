#!/bin/bash
sed "s/CONFIG_MODULE_SIG_FORCE=y/# CONFIG_MODULE_SIG_FORCE is not set/g" -i config
sed "s/CONFIG_MODULE_SIG_ALL=y/# CONFIG_MODULE_SIG_ALL is not set/g" -i config
