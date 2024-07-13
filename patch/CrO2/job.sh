#!/bin/bash

#SBATCH -p v6_384
#SBATCH -n 72
#SBATCH -N 1
#SBATCH -J linyh


#ATTENTIAON: There should be no commands before SBATCH lines.
#command : sbatch job.sh
#export OMP_NUM_THREADS=64
ulimit -s unlimited

mkdir data 
mkdir logdir

core=72
prog=/path/to/vasp_ncl

echo "start    time  :  $(date) " >>runtime
srun -n $core $prog > log
echo "end      time  :  $(date) " >>runtime
