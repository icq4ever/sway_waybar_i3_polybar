#!/usr/bin/env bash

# 합산 %만 깔끔하게 출력 (예: "77%")
# 가능하면 energy_now/energy_full로 가중합, 없으면 capacity 평균

batdirs=(/sys/class/power_supply/BAT0 /sys/class/power_supply/BAT1)
total_now=0
total_full=0
count=0
use_energy=1

for b in "${batdirs[@]}"; do
  [ -d "$b" ] || continue
  if [ -r "$b/energy_now" ] && [ -r "$b/energy_full" ]; then
    now=$(cat "$b/energy_now")
    full=$(cat "$b/energy_full")
    total_now=$((total_now + now))
    total_full=$((total_full + full))
    count=$((count + 1))
  else
    use_energy=0
  fi
done

if [ $count -gt 0 ] && [ $use_energy -eq 1 ] && [ $total_full -gt 0 ]; then
  pct=$(( (100 * total_now + total_full/2) / total_full ))  # 반올림
  echo "%{T2}%{T-} ${pct}%"
else
  # capacity로 폴백 (평균)
  sum=0; n=0
  for b in "${batdirs[@]}"; do
    [ -r "$b/capacity" ] || continue
    c=$(cat "$b/capacity")
    sum=$((sum + c)); n=$((n + 1))
  done
  if [ $n -gt 0 ]; then
    echo $(( (sum + n/2) / n ))"%"
  else
    echo "--%"
  fi
fi

