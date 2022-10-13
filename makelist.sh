#!/bin/bash

appdir=`pwd`
cd ~/chia-blockchain
. ./activate
cd $appdir

nft_ids=`cat list.txt`

n=1
for id in $nft_ids; do

  echo "$n. $id"

  nft_json=`curl -s https://api.mintgarden.io/nfts/$id`
  nft_id=`echo "$nft_json" | jq '.encoded_id' | cut -c 2- | rev | cut -c 2- | rev`
  nft_owner_wallet=`echo "$nft_json" | jq '.owner_address.encoded_id' | cut -c 2- | rev | cut -c 2- | rev`
  echo "$nft_owner_wallet"
  echo ""

  echo "$nft_id $nft_owner_wallet" >> $appdir/results.txt

  n=$(($n+1))

done
