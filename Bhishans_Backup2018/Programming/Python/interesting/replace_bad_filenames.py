#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os


def replace_bad_filenames(parent, bad_chars):
    """Replace bad names."""
    for dir, subdir, files in os.walk(parent):
        for file in files:
            os.rename(os.path.join(dir, file),
                      os.path.join(dir, "".join
                                   (filter(lambda x: x not in bad_chars, file))
                                   )
                      )


if __name__ == "__main__":
    bad_chars = [' ', ',', ';', '-', '&', '(', ')', '{', '}', '[', ']']
    parent = '.'
    replace_bad_filenames(parent, bad_chars)
