#!/bin/tcsh

echo "------------------------------------------"
# echo `pwd`
# echo `ls -la`
cd   /usr/local/helio/applications/sheba
#cd /home/perezsud/propagation_runs/pm_sep
# echo `pwd`
# echo `ls -la`
echo "------------------------------------------"
echo `date`" - Checking IDL_DIR......"
echo `ls -la /opt/exp_soft/helio/idl/idl/`

echo `date`" - Setting IDL_DIR......"
setenv IDL_DIR '/opt/exp_soft/helio/idl/idl'

echo `date`" - Setting IDL_LICENSE_DIR......"
setenv LM_LICENSE_FILE '/opt/exp_soft/helio/idl/license/license.dat'

echo "------------------------------------------"
echo `date`" - Executing IDL code with the following argument ..."
echo " - Start time    : "$1
echo " - Longitude     : "$2
echo " - Velocity      : "$3
echo " - Velocity error: "$4
echo " - Beta value    : "$5
echo " - Output File   : "$6

echo "sheba_run,model='sep',time_sol='$1',x0=$2,vel=$3,e_vel=$4,beta=$5,PATH_OUT = '$6'" > $6/idl_input.txt
# echo "prop_end,t0='$1',x0='$2',width='$3',vel='$4',e_vel=0,FILE_OUT = '$5'" > idl_input.txt
#
# Executing code for active region extraction ...
#
echo `date`" - Executing Propagation Model ....."
source /opt/exp_soft/helio/ssw/ssw-config.sh < $6/idl_input.txt
echo `date`"..... done"
echo "------------------------------------------"
