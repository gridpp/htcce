This is a way to install a CentOS7 HTCondor-CE headnode.

I assume you have already set up the system as a central manager (CM.)


For the HTCondor-CE, these are the files you'll need:

repos.tar          # The repos that you need to use for the packages. 
cePackagesOnTop.txt  # Packages that need to go on top on of the CM
ceConfigOnTop.tar    # Config that needs to go in the CE.

Also, you'll need specific versions of these files for your server from UK e-Science.
I cannot provide these; you have to apply for them yourself.
hostcert.pem       # Host cert
hostkey.pem        # Host key

Here are the steps to make the head node.

- Have a central manager, make as per the cm/README.md document.
- Copy the cePackagesOnTop.txt to /root and use a loop to install the packages.
-   for p in `cat cePackagesOnTop.txt`; do yum -y install $p; done
- Copy ceConfigOnTop.tar to / and untar it there.
- Use tar -tf ceConfigOnTop.tar to list the files and modify the config to suit your site.
- Install the host certificates and keys, as per following. Note that 
  the condor versions are just copies.

  -r--r--r-- 1 root root 1606 Mar 12 15:41 ./etc/grid-security/hostcert.pem
  -r-------- 1 root root 1675 Mar 12 15:41 ./etc/grid-security/hostkey.pem
  -r--r--r-- 1 condor condor 1606 Mar 12 15:41 ./etc/grid-security/condorcert.pem
  -r-------- 1 condor condor 1679 Mar 12 15:41 ./etc/grid-security/condorkey.pem

- Reboot the head node
- Start services; condor, condor-ce, bdii
- Use the test//README.md to test the who setup.

The steps to hook the ce up to APEL accounting are listed here:

-  https://twiki.cern.ch/twiki/bin/viewauth/LCG/HtCondorCeAccounting

Ste
25 March 2019


