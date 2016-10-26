#!/bin/bash
#qsub script to submit to nyu's scheduler

#PBS -N 
#PBS -m abe
#PBS -j oe
#PBS -M mss460@nyu.edu
#PBS -d /scratch/mss460/CoverSongs2
#PBS -l nodes=1:ppn=2:gpus=1:k80
#PBS -l mem=24GB
#PBS -l walltime=72:00:00

# max batchsize on tesla k80 = 10
# max batchsize on titan black = 5

# echo "import sys; sys.setdefaultencoding('utf-8')" > sitecustomize.py
export PYTHONIOENCODING=utf-8
module purge
module load tensorflow/python3.5.1/20160418
cd /scratch/mss460/CoverSongs2

python3.5 /scratch/mss460/CoverSongs2/train_coversongs.py --batch_size 256  --num_epochs 1000 --dropout_factor 0.5 --l2_reg_lambda .1 --dev_size_percent .20 --evaluate_every 100 --cnn 'small' --learning_rate 0.0001
