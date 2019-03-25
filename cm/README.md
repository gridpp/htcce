This is a way to install a CentOS7 HTCondor central manager on its own (no CE.)

First make a "plain vanilla head node" to site spec.  You'll need 5 GB RAM, and 3 cpus.

For the head node, these are the files you'll need:

users.conf         # A list of users that you will make on your head node (must match worker node.)
makeNewUsers.pl    # A script that reads users.conf and makes the users.
repos.tar          # The repos that you need for the packages. 
cmPackagesOnTop.txt  # Packages that need to go on top on of the PVHN.
cmConfigOnTop.tar    # Config that needs to go in the PVHN.
scripts.tar        # Some useful scripts to (e.g.) turn nodes on and off etc.

Here are the steps to make the head node.

- Have a PVHN as the headnode.
- Copy the repos.tar file to /etc/yum.repos.d/ and untar it there. Do yum clean all.
- Copy the cmPackagesOnTop.txt to /root and use a loop to install the packages.
-   for p in `cat cmPackagesOnTop.txt`; do yum -y install $p; done
- Copy cmConfigOnTop.tar to / and untar it there.
- Use tar -tf cmConfigOnTop.tar to list the files and modify the config to suit your site.
- Copy scripts.tar to /root and untar it there.
- Copy users.conf and makeNewUsers.pl to /root/scripts/ 
- Modify users.conf to suit your site and run ./makeNewUsers.pl users.conf
- Alternatively, use any method you like to make the users.
- Make a pool password condor_store_cred -f /etc/condor/pool_password
- Copy the pool_password to all systems, in (e.g.) /etc/condor

- Reboot the head node
- service condor start

Ste
25 March 2019

