#!/usr/bin/env bash

# 기존 polybar 모두 종료
polybar-msg cmd quit >/dev/null 2>&1
# 혹시 남아있으면 강제 종료
killall -q polybar 2>/dev/null

# 잠깐 대기 (프로세스 정리 시간)
sleep 1

# 모니터별로 하나씩 실행 (bar 이름은 config.ini에 맞추세요: mybar)
if command -v polybar >/dev/null 2>&1; then
  if polybar -m | grep -q ":"; then
    # 멀티 모니터: 각 모니터에 하나씩
    polybar -m | while read -r m; do
      MONITOR="${m%%:*}" polybar --reload mybar &
    done
  else
    # 폴백: 그냥 하나
    polybar --reload mybar &
  fi
fi

disown

