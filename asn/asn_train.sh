#!/bin/bash
#cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
#DIR="$( pwd )"
#SRC_DIR=${DIR}"/../"
#export PATH=${PATH}:${SRC_DIR}
# Change to your desired GCS bucket
GCS_MODEL_DIR='gs://oss-yonsei/asntmp'
# This is opened publicly, should be able to access. Dont change this
NOW="$(date +"%Y%m%d_%H%M%S")"
# Align with the model version you are training
JOB_PREFIX="Assemblenet101"
MODEL_DIR=${GCS_MODEL_DIR}/${JOB_PREFIX}_${NOW}
python -m official.vision.beta.projects.assemblenet.train --mode=train_and_eval --experiment=assemblenet_ucf101 --model_dir=${MODEL_DIR}  --config_file=./asn/assemble101.yaml --tpu=node-1
#python -m official.vision.beta.projects.mnet.train --mode=train_and_eval --experiment=mnet_classification --model_dir=${MODEL_DIR} --config_file=./official/vision/beta/projects/mnet/configs/experiments/mbnv2_8gpu_gcp.yaml



