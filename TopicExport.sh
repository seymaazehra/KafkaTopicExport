#!/bin/bash

#read -p "Enter Kafka IP: "  kafkaIP
#read -p "Enter kafka-console-consumer.sh path: "  kafka_topics_path
#read -p "Enter kafka_text_file path: "  TextFile

#kafka_topics_path=./kafka-console-consumer.sh
#kafka_topics_path2=./kafka-topics.sh
#TextFile=./TopicsTextFile/




function write() {
echo "Please enter IP:"
read kafkaIP
  if [ $(expr length $kafkaIP) -eq 13 ]; then
    echo "Enter the topic name:"
    read topic2

    echo "Topic to write: $topic2"
    for topic in $($kafka_topics_path2 --bootstrap-server $kafkaIP:9092 --list); do
    
      if [ "$topic" == "$topic2" ]; then
       touch TopicsTextFile/$topic2-TextFile.json
       
	
         
	   
	   echo "Please enter the directory path where kafka-console-consumer."
	   read kafka_topics_path
	   echo "Please enter the directory path where you want textfile."
	   read TextFile
       echo "You will see result in 5 seconds..."
	   echo "Writing..."
       $kafka_topics_path \
       --bootstrap-server $kafkaIP:9092 \
       --topic $topic2 \
       --formatter kafka.tools.DefaultMessageFormatter \
       --from-beginning --timeout-ms 5000 > $TextFile/$topic2-TextFile.json
  
  
       echo "Finished messages writing ..."
	   return 0
     
   	  fi
	done
echo "$topic2 not found... Bay Bay"
return 1	
	
  else
      echo "Wrong IP length... Please try again..." 
	  write
  fi
	
	
	  
	

}
 

function writeOwn() {
echo "Please enter IP:"
read kafkaIP
   if [ $(expr length $kafkaIP) -eq 13 ]; then
    echo "Enter the topic name:"
    read topic2

    echo "Topic to write: $topic2"
    for topic in $($kafka_topics_path2 --bootstrap-server $kafkaIP:9092 --list); do
    
      if [ "$topic" == "$topic2" ]; then
	    echo "Enter the file name:"
	    read file
	    echo "Creating $file file..."
		sleep 2
        touch $topic_path/$file-TextFile.json
     
	
       echo "Please enter the directory path where kafka-console-consumer."
	   read kafka_topics_path
	   echo "Please enter the directory path where you want textfile."
	   read TextFile
       echo "You will see result in 5 seconds..."
  	   echo "Writing..."
	   
       $kafka_topics_path \
       --bootstrap-server $kafkaIP:9092 \
       --topic $topic2 \
       --formatter kafka.tools.DefaultMessageFormatter \
       --from-beginning --timeout-ms 5000 > $topic_path/$file-TextFile.json
  
  
       echo "Finished messages writing ..."
	   exit 
     
	  fi
 
	done 
echo "$topic2 not found...Bay Bay"
return 1

  else  
    echo "Wrong IP length... Please try again..."
	write
  fi
}



function helpp(){
     echo "   --              This file purpose is kafka topics writing to text file... "
	 echo "   --              If you want your create own file select 1 and then select C or you want default file select 1 and D options..."
     echo "   --              All function write with '--from-beginning' messages... If you want limited messages you can change this."
     echo "   --              Don't forget put '/' to beginning and ending when writing file locations."
     
	 
	 
	   
	 
     
}


function main (){
     helpp
	 sleep 4
	 echo "********************************"
     echo "Let's write to text..."
	 echo "********************************"
    
   
     echo "If you want create own text file ,ENTER C ; or you want default file ENTER D"
     read topic_file
     if [ $topic_file = 'C' ]; then
     writeOwn
	 else if [ $topic_file = 'D' ]; then
	 write
	 
	 
	 else  
	 echo "Fail... "
	 sleep 2
	 exit 
     fi
	 fi
   
    
	 exit 
   
   
   }
   

main




  
  
     