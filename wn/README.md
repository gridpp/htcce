This is a way to install a CentOS7 HTCondor worker node for 
use with a HTCondor central manager.

First make a "plain vanilla worker node" (PVWN) to site spec.  

For the workernode, these are the files you'll need:

users.conf         # A list of users that you will make on your head node (must match worker node.)
makeNewUsers.pl    # A script that reads users.conf and makes the users.
repos.tar          # The repos that you need to use for the packages.
wnPackagesOnTop.txt  # Packages that need to go on top on of the PVWN
wnConfigOnTop.tar    # Config that needs to go in the PVWN

Here are the steps to make the worker node.

- Have a plain vanilla worker node.
- Copy the repos.tar file to /etc/yum.repos.d/ and untar it there. Do yum clean all.
- Copy the wnPackagesOnTop.txt to /root and use a loop to install the packages.
    for p in `cat wnPackagesOnTop.txt`; do yum -y install $p; done
- Copy wnConfigOnTop.tar to / and untar it there.
- Use tar -tf wnConfigOnTop.tar to list the files and modify the config to suit your site.
    Note: the main files to edit would be 00-node_parameters (properties of node) 
    and condor_config.local (point it at the right server.)
- Copy users.conf and makeNewUsers.pl to /root/scripts/
- Modify users.conf to suit your site and run ./makeNewUsers.pl users.conf
    Alternatively, use any method you like to make the users.
- Copy a pool_password made on the server to this system, in (e.g.) /etc/condor
     (or work backwards and make the pool password on the wn, condor_store_cred -f /etc/condor/pool_password)
- cvmfs_config setup
- cvmfs_config chksetup
- cvmfs_config probe; echo $? # should be zero
- systemctl restart autofs.service
- ls /cvmfs/atlas.cern.ch  # should see dir or files
- Reboot the worker node   # why not?
- service condor start 

Ste
25 March 2019

