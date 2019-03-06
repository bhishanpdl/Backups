#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun-24-2017 Sat

RANKS = list(range(-8, 0)) + list(range(1, 9))


class User:

    def __init__(self):
        self._rank = 0
        self.progress = 0

    @property
    def rank(self):
        return RANKS[self._rank]

    def update_rank(self):
        while self.progress >= 100 and self._rank < 15:
            self._rank += 1
            self.progress -= 100
        if self._rank == 15:
            self.progress = 0

    def inc_progress(self, rank):
        if not rank or rank < -8 or rank > 8:
            raise ValueError()

        rank += 7 if rank > 0 else 8
        if self._rank == rank:
            self.progress += 3
        elif self._rank - rank == 1:
            self.progress += 1
        elif self._rank < rank:
            self.progress += 10*(rank - self._rank)**2
        self.update_rank()

u = User()
u.rank = 6
u.progress = 10

print(u.rank())
