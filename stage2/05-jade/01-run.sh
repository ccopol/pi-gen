#!/bin/bash -e

JADE_PKG=jade-core-0.5.3-linux-latest.deb

if [ "${INSTALL_NODEJS}" = "1" ]; then
  if [ -f files/${JADE_PKG} ]; then
    install -m 444 files/${JADE_PKG} ${ROOTFS_DIR}/home/${RPI_USER}/

    if [ "${USE_IPTABLE}" = "1" ]; then
      echo "Authorize jade in iptables"
      echo "# Jade In/Out" >> ${ROOTFS_DIR}/usr/bin/set_iptables_rules.sh
      echo "iptables -t filter -A INPUT -p tcp --dport 4000 -j ACCEPT" >> ${ROOTFS_DIR}/usr/bin/set_iptables_rules.sh
      echo "iptables -t filter -A OUTPUT -p tcp --dport 4000 -j ACCEPT" >> ${ROOTFS_DIR}/usr/bin/set_iptables_rules.sh
    fi
  else
    echo "WARNING: ${JADE_PKG} not found!"
  fi
fi
