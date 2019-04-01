This kit tells how to set up a minimal HTCondor-CE cluster, using CentOS7.

It doesn't use puppet or anything like that. It doesn't use Yaim.

It just uses a Perl script to make the users. Apart from that, you do everything "by hand".

I assume you are going to make one headnode and one workernode.

The headnode will run a HTCondor central manager, and a HTCondor-CE.

The worker node will just run HTCondor.

I assume you've chosen some admin system, unpacked this tar file here and seen this README.md file.

You are going to copy files from here onto the headnode, then configure it as a central manager.

Then you are going to do something similar to make the workernode.  

Then you will configure the headnode/central manager as a CE.

Then you are going to do a test and run some jobs.

The ./cm/ directory has a README.md telling how to make the central manager.

The ./wn/ directory has a README.md telling how to make the workernode.

The ./ce/ directory has a README.md telling how to make the ce.

And the ./test/ directory has a README.md telling how to test this work.

Notes: 

1) I won't say much about firewalls and networks (since there 
is so very much to say about all that!) But you will need to be able 
to use ports 9618 and 9619 for condor etc. And, in the manual build, the
hostname for the CE is hepgrid9 (for external LAN) or igrid9 (for internal LAN), 
which is for special routing at Liverpool that you don't need to use.

2) The BDII is configured with the HTCondor central manager; by rights it
should be configured with the HTCondor-CE, but sadly the condor python bindings
default to the /etc/condor, not etc/condor-ce. Hence this compromise. But
it works OK.

Ste
25 March 2019

