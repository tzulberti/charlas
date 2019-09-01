# -*- coding: utf-8 -*-
import numpy
import pyximport

pyximport.install(setup_args=dict(include_dirs=numpy.get_include()))

import difference

print(difference.__file__)
difference.main()
