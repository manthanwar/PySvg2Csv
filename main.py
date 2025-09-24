#! /c/Users/amit/AppData/Local/Programs/Python/Python312/python
#! python3qgis
#! /usr/bin/env python3
#! /c/Program Files/QGIS 3.26.0/apps/Python39/python
# ==============================================================================
# File Name     : svg2csv.py
# Date Created  : 2025-09-11 00:20 UTC +02:00
# description   : Extract Nodes of SVG and save as CSV
# ------------------------------------------------------------------------------
# Author        : Amit Manohar Manthanwar
# Mailer        : manthanwar@hotmail.com
# WebURL        : https:#manthanwar.github.io
# ------------------------------------------------------------------------------
# Copyright     : (c) 2025 Amit Manohar Manthanwar
# License       : LICENSE.md
# ==============================================================================
# Revision Log  | Author  | Description
# --------------+---------+-----------------------------------------------------
# 11-Sep-2025   | AMM     | Initial Version
# --------------+---------+-----------------------------------------------------
# ==============================================================================

from src.pysvg2csv.svg2csv import extract_node_coordinates


# import srcpysvg2csv.svg2csv

# from svg2csv import extract_node_coordinates


node_coords = extract_node_coordinates("tests/data-svg/node-export.svg")
# node_coords = extract_node_coordinates("tests/node-export.svg")
for path_coords in node_coords:
    # print("Path Coordinates:", path_coords)
    numbers_as_strings = list(map(str, path_coords))
    print('\\psbezier' + ''.join(numbers_as_strings))
