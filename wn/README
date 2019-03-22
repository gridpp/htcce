This is a way to install a CentOS7 HTCondor worker node for 
use in a HTCondor-CE setting (instead of ARC or CREAM.)

First make a "plain vanilla worker node" (PVWN) to site spec.  

For the workernode, these are the files you'll need:

users.conf         # A list of users that you will make on your head node (must match worker node.)
makeNewUsers.pl    # A script that reads users.conf and makes the users.
repos.tar          # The repos that you need to use for the packages.
packagesOnTop.txt  # Packages that need to go on top on of the PVWN
configOnTop.tar    # Config that needs to go in the PVWN

Here are the steps to make the worker node.

- Have a plain vanilla worker node.
- Copy the repos.tar file to /etc/yum.repos.d/ and untar it there.
- Copy the packagesOnTop.txt to /root and use a loop to install the packages.
-   for p in `cat packagesOnTop.txt`; do yum -y install $p; done
- Copy configOnTop.tar to / and untar it there 
- Use tar -tf configOnTop.tar to list the files and modify the config to suit your site.
- Copy users.conf and makeNewUsers.pl to /root/scripts/
- Modify users.conf to suit your site and run ./makeNewUsers.pl users.conf
- Alternatively, use any method you like to make the users.
- Copy a pool_password made on the server to this system, in (e.g.) /etc/condor
-    (or work backwards and make the pool password on the wn, condor_store_cred -f /etc/condor/pool_password)
- cvmfs_config setup
- cvmfs_config chksetup
- cvmfs_config probe
- systemctl restart autofs.service
- ls /cvmfs/atlas.cern.ch
- Reboot the worker node (why not?)
- Start condor services

Test as per svr section.

Ste
21 March 2019

