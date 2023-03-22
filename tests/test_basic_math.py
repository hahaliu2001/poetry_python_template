#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from src.poetry_python_template import basic_math
import pytest

@pytest.fixture(scope='function')
def db():
    print('\n enter test ')

    yield

    print('\n exit test')

def test_add_num(db):
    assert basic_math.add_num(2, 3) == 5

@pytest.mark.parametrize('num1, num2, expected',[(3,5,8), (-2,-2,-4), (-1,5,4), (3,-5,-2), (0,5,5)])
def test_param_add_num(num1, num2, expected,db):
    assert basic_math.add_num(num1, num2) == expected