This is a way to install a CentOS7 HTCondor-CE/HTCondor headnode.

First make a "plain vanilla head node" to site spec.  You'll need 5 GB RAM, and 3 cpus.

For the head node, these are the files you'll need:

users.conf         # A list of users that you will make on your head node (must match worker node.)
makeNewUsers.pl    # A script that reads users.conf and makes the users.
repos.tar          # The repos that you need to use for the packages. 
packagesOnTop.txt  # Packages that need to go on top on of the PVHN.
configOnTop.tar    # Config that needs to go in the PVHN.
test.tar           # Tools to test the system once it is built.
scripts.tar        # Some useful scripts to (e.g.) turn nodes on and off etc.
misc.sh            # Some nice commands that you may find useful.

Also, you'll need specific versions of these files for your server from UK e-Science.
I cannot provide these; you have to apply for them yourself.
hostcert.pem       # Host cert
hostkey.pem        # Host key

Here are the steps to make the head node.

- Have a PVHN as the headnode.
- Copy the repos.tar file to /etc/yum.repos.d/ and untar it there.
- Copy the packagesOnTop.txt to /root and use a loop to install the packages.
-   for p in `cat packagesOnTop.txt`; do yum -y install $p; done
- Copy configOnTop.tar to / and untar it there.
- Use tar -tf configOnTop.tar to list the files and modify the config to suit your site.
- Copy scripts.tar to /root and untar it there.
- Copy users.conf and makeNewUsers.pl to /root/scripts/ 
- Modify users.conf to suit your site and run ./makeNewUsers.pl users.conf
- Alternatively, use any method you like to make the users.
- Make a pool password condor_store_cred -f /etc/condor/pool_password
- Copy the pool_password to all systems, in (e.g.) /etc/condor
- Install the host certificates and keys, as per following. Note that 
  the condor versions are just copies.

  -r--r--r-- 1 root root 1606 Mar 12 15:41 ./etc/grid-security/hostcert.pem
  -r-------- 1 root root 1675 Mar 12 15:41 ./etc/grid-security/hostkey.pem
  -r--r--r-- 1 condor condor 1606 Mar 12 15:41 ./etc/grid-security/condorcert.pem
  -r-------- 1 condor condor 1679 Mar 12 15:41 ./etc/grid-security/condorkey.pem

- Reboot the head node
- Start services; condor, condor-ce, bdii

Here are the steps to test the head node.

- Set up a worker node to point at the new headnode. 
  (see ../wn dir.) You might need to restart the condor services on both systems.
- On the headnode, turn on the worker node using scripts/startJobsOn.sh r23-n10
- Copy the test.tar file to (e.g.) /home/dteam001/
- su - dteam001
- Untar the test.tar file and cd test/
- Make a proxy somehow and put it into the /home/dteam001/test/ dir, with proper ownership, e.g.
    chown dteam001:dteam x509up_u460
    chmod 600 x509up_u460 
- ./submit_a_lot.sh
- Check that the jobs queue and run with (e.g.) condor_q
- Use the commands in misc.sh to check the bdii

The steps to hook the headnode up to APEL accounting are listed here:

-  https://twiki.cern.ch/twiki/bin/viewauth/LCG/HtCondorCeAccounting

Ste
19 March 2019

