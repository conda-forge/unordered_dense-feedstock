#!/bin/bash

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
  # Get an updated config.sub and config.guess
  # See: https://conda-forge.org/docs/maintainer/knowledge_base.html#cross-compilation
  cp $BUILD_PREFIX/share/gnuconfig/config.* .
fi

cmake ${CMAKE_ARGS} -DBUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      $SRC_DIR

make install
