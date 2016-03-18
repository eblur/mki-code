from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy

# setup(
#     ext_modules = cythonize("mcmc.pyx"),
#     include_dirs=[numpy.get_include()]
# )
setup(
    ext_modules=[
        Extension("mcmc", ["mcmc.c"],
                  include_dirs=[numpy.get_include()],
                  libraries=["gsl", "gslcblas"])
    ],
)