#!/bin/bash


GENERATION=1 #代数号
PLSZ=1  #样本号
Numbercpu=8 #需要设定每个节点cpu数量
NumberOp=50
NumberIni=0

NumberCalTime=$[$[$NumberOp/$Numbercpu] + 1] #判断当前节点cpu数量下，反计算需要迭代多少次

while [[ $GENERATION -le 50 ]];do #进化代数迭代
     if [[ $GENERATION -eq 1 ]];then #初代计算
         ./generateInitialPopulation $1   # change mod
      
        (  #cpu队列evaluatePart计算
           while [[ $NumberIni -lt $NumberCalTime ]];do
            
            number=1 
             while [[ $number -le $Numbercpu ]];do
                   PLSZ=$[$[ $NumberIni*$Numbercpu]+$number]
                 if [[ $PLSZ -gt $NumberOp ]];then

                  break
             
                 fi
                ./evaluatePart $1 $PLSZ &   # change mod
                
                number=$((number+1))
                
             done
                
                wait               
                NumberIni=$((NumberIni+1))
         done
         )
         ./findBestIndividual $1  #样本寻优 # change mod
       num=`sed -n '3p' temp/gbest${1}.dat` #gbest文件第三行内容提取
         if [[ $num -eq 1 ]];then
             break
         else
             GENERATION=$((GENERATION+1)) #下一代迭代
         fi
     else
        ./generateNextPopulation $1    # change mod
      

        (
           while [[ $NumberIni -lt $NumberCalTime ]];do

            number=1
             while [[ $number -le $Numbercpu ]];do
                   PLSZ=$[$[ $NumberIni*$Numbercpu]+$number]
                 if [[ $PLSZ -gt $NumberOp ]];then

                  break

                 fi
                ./evaluatePart $1 $PLSZ &    # change mod

                number=$((number+1))

             done

                wait
                NumberIni=$((NumberIni+1))
         done
         )
         ./findBestIndividual $1    # change mod
       num=`sed -n '3p' temp/gbest${1}.dat`
         if [[ $num -eq 1 ]];then
             break
         else
             GENERATION=$((GENERATION+1))
         fi
     fi       
done

