#!/bin/bash -e

install -m 644 files/ipv6.conf ${ROOTFS_DIR}/etc/modprobe.d/ipv6.conf
install -m 644 files/hostname ${ROOTFS_DIR}/etc/hostname

ln -sf /dev/null ${ROOTFS_DIR}/etc/systemd/network/99-default.link

echo "${RPI_LOCALHOST}" > ${ROOTFS_DIR}/etc/hostname
echo "127.0.1.1 ${RPI_LOCALHOST}" >> ${ROOTFS_DIR}/etc/hosts
