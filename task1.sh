# Масив URL вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
logfile="website_status.log"

# Очищення файлу логів перед виконанням скрипта
> $logfile

# Перебір кожного сайту з масиву
for site in "${websites[@]}"; do
    # Використання curl для отримання HTTP статус-коду
    status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $site)
    
    # Перевірка статус-коду та запис результатів у файл логів та вивід на екран
    if [ $status_code -eq 200 ]; then
        echo "$site is UP" | tee -a $logfile
    else
        echo "$site is DOWN" | tee -a $logfile
    fi
done

# Вивід інформації про запис у файл логів
echo "Results have been logged in $logfile"
