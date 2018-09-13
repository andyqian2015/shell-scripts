#!/bin/bash
dir="/home/dongdong/Algo-server/data/sgDataDeal/"

dcmdir="/home/dongdong/Algo-server/dcmNameFolder/dcm.txt"

dir1="/home/dongdong/Algo-server/result/"
dir2="/home/dongdong/Algo-server/result_/"

#touch ${dcmdir}

prefile=""

for file in $(ls $dir)
do

   for result in $(ls $dir1)
   do
       resultsrc=${dir1}${result}
       resultdst=${dir2}${prefile}
       mv ${resultsrc} ${resultdst}
   done

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
    c="\"${dir}${file}\""
    d="}
  }
  ]"
  filedir="/home/dongdong/Algo-server/input_ribRM.json" 
  if [ -f ${filedir} ];then
     rm ${filedir}
  fi

  
  
  touch ${filedir}  
  echo $a >> ${filedir}
  echo $b >> ${filedir}
  echo $c >> ${filedir}
  echo $d >> ${filedir}

#  echo ${file%%.*} >> ${dcmdir}

./build/algoserver/examples/client --uri 0.0.0.0:20020 --in ./input_ribRM.json  --out ./result

prefile=${file}
  
done

