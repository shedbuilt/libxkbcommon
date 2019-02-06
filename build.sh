#!/bin/bash
# Configure
./configure --prefix=/usr \
            --disable-static \
	    --disable-x11 \
	    --docdir="$SHED_PKG_DOCS_INSTALL_DIR" &&

# Build
make -j $SHED_NUM_JOBS &&

# Install
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1 

# Prune Documentation
if [ -z "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    rm -rf "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}"
fi
