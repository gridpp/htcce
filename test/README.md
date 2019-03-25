This is a way to test a CentOS7 HTCondor-CE/HTCondor cluster.

Here are the steps.

- Set up a worker node to point at the new headnode. 
  (see ../wn dir.) You might need to restart the condor services on both systems.
- On the headnode, turn on the worker node using scripts/startJobsOn.sh r23-n10
- Copy the test.tar and misc.sh files to (e.g.) /home/dteam001/
- su - dteam001
- Untar the test.tar file and cd test/
- Make a proxy somehow and put it into the /home/dteam001/test/ dir, with proper ownership, e.g.
    chown dteam001:dteam x509up_u460
    chmod 600 x509up_u460 
- ./submit_a_lot.sh
- Check that the jobs queue and run with (e.g.) condor_q
- Use the commands in misc.sh to check the bdii

Ste
25 March 2019

