#!/bin/bash

read -p "Enter the VM name: " VM_NAME
read -p "Enter the disk size (for e.g. 20G): " DISK_SIZE
read -p "Enter the RAM to give(in MB (1024MB==1GB): " RAM
read -p "Enter the number of CPU cores to allot: " CPUS
read -p "Enter the full path to the ISO installer: " ISO_PATH
read -p "Enter the OS variant (e.g., ubuntu20.04, generic): " OS_VARIANT
DISK_PATH="/var/lib/libvirt/images/${VM_NAME}.qcow2"
echo "VM Details:"
echo "Name: $VM_NAME"
echo "Disk Size: $DISK_SIZE"
echo "RAM: ${RAM}MB"
echo "CPUs: $CPUS"
echo "ISO Path: $ISO_PATH"
echo "OS Variant: $OS_VARIANT"
read -p "Proceed with VM creation? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
    echo "VM creation canceled."
    exit 1
fi

qemu-img create -f qcow2 "$DISK_PATH" "$DISK_SIZE"

virt-install \
  --name "$VM_NAME" \
  --ram "$RAM" \
  --vcpus "$CPUS" \
  --disk path="$DISK_PATH",format=qcow2 \
  --cdrom "$ISO_PATH" \
  --os-variant "$OS_VARIANT" \
  --network network=default \
  --graphics vnc,listen=0.0.0.0 \
  --noautoconsole \
  --import

# Check if VM was created successfully
if [ $? -eq 0 ]; then
    echo "Virtual machine '$VM_NAME' created successfully and saved in virt-manager."
else
    echo "Failed to create virtual machine."
fi

