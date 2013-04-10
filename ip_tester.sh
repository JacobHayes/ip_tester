#I should port this to Ruby to test my knowledge. I could implement hash tables in a seperate config file for the 'known' hosts.

ip_addr=0

printf "What is the IP range? (ex: 192.168.0.x): "
read ip_range

while (( ip_addr < 254 ))
do
   ping -c 1 -t 1 ${ip_range}${ip_addr} > /dev/null

   if (( `echo $?` == 0 ))
   then
      printf "Host found at ${ip_range}${ip_addr}" 

      if [[ ${ip_range} == 10.0.1. ]]
      then
         if [[ ${ip_range}${ip_addr} == 10.0.1.20  ]]
         then
            printf ": MPB"
         elif [[ ${ip_range}${ip_addr} == 10.0.1.100  ]]
         then
            printf ": Public LB"
         elif [[ ${ip_range}${ip_addr} == 10.0.1.245 ]]
         then
            printf ": Content Storage"
         elif [[ ${ip_range}${ip_addr} == 10.0.1.250 ]]
         then
            printf ": Xen Host"
         elif [[ ${ip_range}${ip_addr} == 10.0.1.251 ]]
         then
            printf ": Main Server"
         fi
      elif [[ ${ip_range} == 192.168.0. ]]
      then
         if [[ ${ip_range}${ip_addr} == 192.168.0.20 ]]
         then
            printf ": MBP"
         fi
         if [[ ${ip_range}${ip_addr} == 192.168.0.101 ]]
         then
            printf ": Master LB"
         fi
         if [[ ${ip_range}${ip_addr} == 192.168.0.102 ]]
         then
            printf ": Backup LB"
         fi
         if [[ ${ip_range}${ip_addr} == 192.168.0.151 ]]
         then
            printf ": Web Server 1"
         fi
         if [[ ${ip_range}${ip_addr} == 192.168.0.152 ]]
         then
            printf ": Web Server 2"
         fi
      fi

   echo ""
   fi

   (( ip_addr = $ip_addr + 1 ))

done 
