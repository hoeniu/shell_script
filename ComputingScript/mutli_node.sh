#! /bin/bash

rm -rf temp/*  #清空temp文件夹

#cpu and node number 
path=`pwd`  #获取计算目录绝对路径
NumberNode=5 #设定节点总数
NumberOps=43 #测点个数
NumberInitial=0
counter=1

NumberCalTime=$[$[$NumberOps/$NumberNode] + 1]  #集群批数计算判断


./inputExpValue


while [[ $NumberInitial -lt $NumberCalTime ]];do #集群批数循环 
          node=1
       
          while [[ $node -le $NumberNode ]];do  #退出判断
   
          counter=$[$[$NumberInitial*$NumberNode]+$node] #$1计算
          if [[ $counter -gt $NumberOps ]];then  #$1退出判断
          
          break 
          fi
          ssh node$node "cd $path && \
                    ./calculation.sh $counter &" &  #放到各个节点计算
          node=$((node+1))
          done
       NumberInitial=$((NumberInitial+1))
       wait    
done

#排序功能
SortNumber=1
while [[ $SortNumber -le 43 ]];do

      ./outputTextReport $SortNumber
      SortNumber=$((SortNumber+1))
done

