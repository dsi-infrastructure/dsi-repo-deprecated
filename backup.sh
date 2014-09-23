#!/bin/bash

# Sauvegarde des roles
for i in $(knife role list); do knife role show $i -F json > roles/$i.json; done

# Sauvegarde des environnements
for i in $(knife environment list); do knife environment show $i -F json > environments/$i.json; done

# Sauvegarde des databags
for i in $(knife data bag list); do
  for j in $i; do
    mkdir -p data_bags/$j
    for k in $(knife data bag show $i); do
      knife data bag show $i $k -F json > data_bags/$i/$k.json;
    done ;
  done ;
done
