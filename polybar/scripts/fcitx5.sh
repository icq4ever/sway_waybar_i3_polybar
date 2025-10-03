#!/usr/bin/env bash
# Show current fcitx5 IME in polybar: ENG / KOR / JPN
# deps: fcitx5, fcitx5-remote

# If fcitx5 not running, show a dim dot
if ! pgrep -x fcitx5 >/dev/null 2>&1; then
  echo ""
  exit 0
fi

name="$(fcitx5-remote -n 2>/dev/null)"

case "$name" in
  # 영어: 키보드 레이아웃(국가코드)별 매핑
  keyboard-us|keyboard-kr|keyboard-jp|keyboard-*)
    # 필요하면 "$name"에 따라 US/JP/…로 더 세분화 가능
    echo "A"
    ;;

  # 한국어(한글)
  hangul|hangul-libhangul|*Hangul*)
    echo "가"
    ;;

  # 일본어(Mozc/Anthy 등)
  mozc|anthy|*Japanese*|*JP*)
    echo "あ"
    ;;

  # 그 외: 이름 그대로(짧게) 표시
  *)
    # 너무 길면 앞 6자만
    echo "${name:0:6}"
    ;;
esac

