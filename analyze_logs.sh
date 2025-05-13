awk 'NF { COUNT+=1 } END { print "Общее количество запросов:" COUNT }' access.log > report.txt
echo "Количество уникальных IP адресов:" >> report.txt
awk '{print $1}' access.log | sort| uniq| wc -l >> report.txt
echo "Количество запросов по методам:" >> report.txt
awk '/GET/ {count++} END {print count " GET"}' access.log >> report.txt
awk '/POST/ {count++} END {print count " POST"}' access.log >> report.txt
echo "Самый популярный URL:" >> report.txt
awk '{print $7}' access.log |sort|uniq -c|sort -nr| head -1 >> report.txt