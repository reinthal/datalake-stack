#!/bin/bash
kubectl delete pods --field-selector=status.phase!=Running -n dagster
