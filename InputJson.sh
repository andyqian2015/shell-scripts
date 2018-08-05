#!/bin/bash
# 将文档写道json文件里
dir="/home/andy/file/"
for file in $(ls $dir)
do
   a="[
       {
        \"req\" :
       {
           \"algo\" : \"ribRM\", \"param\" : {}
       }
     },
      {
      \"data\" :
       {
          \"desc\" : {\"type\" : \"DR\"},"

    b="\"data\" :"
    c="\"/home/pvmed/Algo-server/data/positive/${file}"
    d=\""}
  }
  ]"
  filedir="/home/andy/JsonFile/input_ribRM.json" 
  if [ -f ${filedir} ];then
     rm ${filedir}
  fi
  
  touch ${filedir}  
  echo $a >> ${filedir}
  echo $b >> ${filedir}
  echo $c >> ${filedir} 
  echo $e >> ${filedir}

  ../algo/Algo-server/build/algoserver/examples/client --uri 0.0.0.0:33333 --in ./input_ribRM.json  --out ./result/rmdicom_other_size/good/
  
done

