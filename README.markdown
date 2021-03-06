# Bootstrap CentOS VMs for training
Installs the training, student, or learning envirnments on an existing VM.

## Usage
To turn the current machine or VM into one of the Education environments.
NOTE: This changes the hostname and should probably only be done from within a Centos 6.5 32bit base VM.  The old rakefile has been deprecated and can be found in Rakefile.orig

The basic process is to start a new VM, check out this repo within it, and run `rake VMNAME` from the root of the repo.

e.g. for a training VM for classroom use:
- Build a new VM and ssh to it
- `git clone https://github.com/puppetlabs/puppetlabs-training-bootstrap bootstrap`
- `cd bootstrap`
- `rake -f training`

## Packer
Packer scripts are provided in the `packer` directory. These depend on vmware fusion and the ovftool post-processor plugin from here: https://github.com/iancmcc/packer-post-processor-ovftool

The common configuration options have been set up in educationbase.json and vm specific variables are set in VMNAME.json

To initiate a packer build of the student vm:
- `packer build -var-file=student.json educationbase.json`

For the training vm:
- `packer build -var-file=training.json educationbase.json`

## Vagrant
There is a Vagrantfile that automates this process and builds on the puppetlabs/centos-6.5-32-nocm base box.
There are three boxes specified.

To start a student vagrant box:
- `vagrant up`

To start a training vagrant box for instructor use:
- `vagrant up training`

To start a learning vagrant box:
- `vagrant up learning`
