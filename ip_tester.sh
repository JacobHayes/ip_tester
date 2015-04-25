ip_addr=0

printf "What is the IP range? (ex: 192.168.0.x): "
read ip_range

while (( ip_addr < 254 ))
do
  ping -c 1 -t 1 ${ip_range}${ip_addr} > /dev/null

  if (( `echo $?` == 0 ))
  then
    printf "Host found at ${ip_range}${ip_addr}" 
    echo ""
  fi

  (( ip_addr = $ip_addr + 1 ))
done 
