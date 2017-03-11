#!/bin/bash
consul agent -ui -config-dir=/consul/config -data-dir=/consul/data -client 0.0.0.0
#-ui-dir=/consul/ui