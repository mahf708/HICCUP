#!/bin/bash
#SBATCH --constraint=cpu
#SBATCH --account=e3sm
#SBATCH --qos=regular
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --mail-user=$USER@NERSC.GOV
#SBATCH --mail-type=END,FAIL

# To run this batch script, use the command below 
# to set the output grid from the command line:
# (NOte that NE ~ number of spectral elements on a cube edge, and NE=30 roughly corresponds 1 degree grid)
# NE=120 ; sbatch --job-name=hiccup_ne$NE --output=logs_slurm/slurm-%x-%j.out --export=NE=$NE ./run_hiccup_batch.rhea.sh


# sbatch template_hiccup_scripts/run_hiccup_batch.nersc.sh


# Load the python environment
micromamba activate xgns


# VGRID=L120
# time python -u ./create_initial_condition.py --init_date=2008-10-01 --vgrid=$VGRID

# sbatch template_scripts/run_hiccup_batch.nersc.sh
time python /global/homes/m/mahf708/HICCUP/template_hiccup_scripts/create_EAMxx_IC_from_ERA5-NOAA.py

# Notes:
# "time" is used here to print the execution time to the end of log file.
# the "-u" option allows the log file to update in real time 
# which is useful for montioring the batch job.