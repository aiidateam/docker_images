#/bin/bash -l
#PBS -r n
#PBS -o scheduler.o
#PBS -e scheduler.e
#PBS -l select=1:ncpus=1
#PBS -l walltime=00:02:00
sleep 5 && env && date && echo "finished" > output.txt

