get_volume=$(amixer get Master| grep "Mono:" | cut -d ' ' -f 6 | sed -e "s/\[//g" | sed -e "s/\]//g" | sed -e "s/\%//g")

echo "$get_volume%"
