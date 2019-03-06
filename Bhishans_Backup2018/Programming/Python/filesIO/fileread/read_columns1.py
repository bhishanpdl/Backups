#!/usr/bin/env python3
# -*- coding: utf-8 -*-

crs = open("color.txt", "r")
rows = (row.strip().split() for row in crs)
col0 = zip(*(row for row in rows if row))

print(col0)
