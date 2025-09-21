#!/bin/sh

. /etc/runit/functions

msg "waiting for services to stop..."
sv force-stop /etc/service/*
sv exit /etc/service/*
