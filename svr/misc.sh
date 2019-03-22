# Copy a proxy for test

scp /user/sjones/.globus/x509up_u460 root@hepgrid9://home/dteam001/test

# Do an ldap search
ldapsearch -LLL -x -h hepgrid9.ph.liv.ac.uk:2170   -b o=glue    | perl -p0e 's/\n //g' | wc

# Make a pool password (on condor system)
condor_store_cred -f pool_password
# Copy this to all systems into (e.g.) /etc/condor/pool_password
# BTW: I used Tommy Cooper's catch phrase for a password, with CamelCase and single spaces.

