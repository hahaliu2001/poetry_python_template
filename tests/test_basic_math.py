#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from src.poetry_python_template import basic_math


def test_add_num():
    assert basic_math.add_num(2, 3) == 5
