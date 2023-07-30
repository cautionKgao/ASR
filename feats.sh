#!/bin/bash

data_dir="/home/caution/Downloads/kaldi/egs/my_directory/data/train"

# Create the feats.scp file
rm -f "$data_dir/feats.scp"

# Specify the location of the existing MFCC feature files
mfcc_dir="/home/caution/Downloads/kaldi/egs/my_directory/mfcc"

# Iterate over the utt2spk file
while read -r line; do
  utt_id=$(echo "$line" | awk '{print $1}')
  speaker_id=$(echo "$line" | awk '{print $2}')
  
  # Create feature file path
  feature_path="${mfcc_dir}/raw_mfcc_train.${utt_id}.ark"

  # Append to feats.scp
  echo "${utt_id} ${feature_path}" | sed 's,//,/,g' >> "$data_dir/feats.scp"
done < "$data_dir/utt2spk"
