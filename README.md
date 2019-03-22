# htcce 

This kit tells how to set up a minimal HTCondor-CE cluster, using CentOS7.

It doesn't use puppet or anything like that. It doesn't use Yaim.

It just uses a Perl script to make the users. Apart from that, you do everything "by hand".

I assume you are going to make one headnode and one workernode.

I assume you've chosen some admin system, unpacked this tar file here and seen this README.md file.

You are going to copy files from here onto the headnode, then configure it.
Then you are going to do something similar to make the workernode.  Then you
are going to do a test and run some jobs.

The ./svr/ directory has a README.md telling how to make the headnode (and the test at the end).

And the ./wn/ directory has a README.md telling how to make the workernode.

I won't say much about firewalls and networks (since there is so very much to say about all that!)

But you will need to be able to use ports 9618 and 9619 for condor etc.

Ste
21 March 2019

