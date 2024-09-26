#!/bin/bash
# Start a QEMU/KVM virtual machine

read -p "Enter the name of the VM to start: " VM_NAME
virsh list --all | grep "$VM_NAME" > /dev/null

if [ $? -eq 0 ]; then
    virsh start "$VM_NAME"
    echo "VM $VM_NAME is starting."
else
    echo "VM $VM_NAME does not exist."
fi

