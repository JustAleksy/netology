#cloud-config
users:
  - name: ${username}
    ssh-authorized-keys:
      - ${ssh_public_key}
    sudo: ${sudo_privileges}
    shell: ${shell}
