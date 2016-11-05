#!/bin/sh

echo jekyll serve start.......
rm -rf _site/*
jekyll s -p 4001

echo jekyll serve end ........
