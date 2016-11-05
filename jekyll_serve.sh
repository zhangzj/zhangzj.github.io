#!/bin/sh

echo jekyll serve start.......
rm -rf _site/*
jekyll s -p 4001 --draft

echo jekyll serve end ........
