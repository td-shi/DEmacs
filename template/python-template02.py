#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
DESCRIPTION

'''
'''
self.assertEqual(a,b)    ==> "a is b"     is pass.
self.assertNotEqual(a,b) ==> "a is'nt b"  is pass.
self.assertTrue(x)       ==> "x is True"  is pass.
self.assertFalse(x)      ==> "x is False" is pass.
'''

__author__  = "%id%"
__version__ = "0.1"
__date__    = "%date-T1%"

import unittest
import 

class %file-name-no-ext%(unittest.TestCase):

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_0x01(self):
        self.assertEqual()

if "__main__" == __name__:
    unittest.main()
