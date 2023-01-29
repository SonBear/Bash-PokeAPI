#!/bin/bash
curl https://pokeapi.co/api/v2/pokemon/$1 | jq '"id= \(.id), name= \(.name), weight= \(.weight), height= \(.height), order= \(.order)"' 

