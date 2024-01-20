#!/bin/bash

appdir=`pwd`
cd ~/chia-blockchain
. ./activate
cd $appdir

nft_ids=`cat list.txt`

n=1
for id in $nft_ids; do


  nft_json=`curl -s https://api.mintgarden.io/nfts/$id`
  nft_id=`echo "$nft_json" | jq '.encoded_id' | cut --fields 2 --delimiter=\"`
  nft_owner_wallet=`echo "$nft_json" | jq '.owner_address.encoded_id' | cut --fields 2 --delimiter=\"`
  #outputting to the console screen slows the script down
  #echo "$n. $id $nft_owner_wallet"
  echo "$nft_owner_wallet" >> $appdir/results.txt

  n=$(($n+1))

done
