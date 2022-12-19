#!/usr/bin/env bash

input=$(</dev/stdin)
arr=($input)

kaomoji_joy=(" (* ^ ω ^)" " (o^▽^o)" " (≧◡≦)" " ☆⌒ヽ(*\"､^*)chu" " ( ˘⌣˘)♡(˘⌣˘ )" " xD")
kaomoji_embarassed=(" (⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄).." " (*^.^*)..," "..," ",,," "..." ".." " mmm.." " O.o")
kaomoji_confused=(" (o_O)?" " (°ロ°) !?" " (ーー;)?" " owo?")
kaomoji_sparkles=(" *:･ﾟ✧*:･ﾟ✧" " ☆*:・ﾟ " "〜☆" " uguu.., " "-.-")

for i in "${!arr[@]}"
do

  original_word=${arr[$i]}
  word=${arr[$i]}
  end=""
  random_number=$(shuf -i 0-2 -n 1)
  if [ "$random_number" -eq 0 ]; then
    if [ "${original_word: -1}" = "." ]; then
      word=$(echo $original_word | rev | cut -c 2- | rev)
      random_number=$(shuf -i 0-5 -n 1)
      end="${kaomoji_joy[$random_number]}"
    elif [ "${original_word: -1}" = "?" ]; then
      word=$(echo $original_word | rev | cut -c 2- | rev)
      random_number=$(shuf -i 0-3 -n 1)
      end="${kaomoji_confused[$random_number]}"
    elif [ "${original_word: -1}" = "!" ]; then
      word=$(echo $original_word | rev | cut -c 2- | rev)
      random_number=$(shuf -i 0-5 -n 1)
      end="${kaomoji_joy[$random_number]}"
    elif [ "${original_word: -1}" = "," ]; then
      word=$(echo $original_word | rev | cut -c 2- | rev)
      random_number=$(shuf -i 0-7 -n 1)
      end="${kaomoji_embarassed[$random_number]}"
    fi

    random_number=$(shuf -i 0-4 -n 1)
    if [ "$random_number" -eq 0 ] && [ "${original_word: -1}" != "." ] && [ "${original_word: -1}" != "?" ] && [ "${original_word: -1}" != "!" ] && [ "${original_word: -1}" != "," ]; then
      word=$original_word
      random_number=$(shuf -i 0-4 -n 1)
      end="${kaomoji_sparkles[$random_number]}"
    fi
  fi

  word_before=$word
  word=${word//you\'re/ur}
  word=${word//youre/ur}
  word=${word//fuck/fwickk}
  word=${word//shit/poopoo}
  word=${word//bitch/meanie}
  word=${word//asshole/b-butthole}
  word=${word//dick/peenie}
  word=${word//penis/peenie}
  if [ "$word" = "cum" ]; then word="cummies"; fi
  if [ "$word" = "semen" ]; then word="cummies"; fi
  if [ "$word" = "ass" ]; then word="boi pussy"; fi
  if [ "$word" = "dad" ]; then word="daddy"; fi
  if [ "$word" = "father" ]; then word="daddy"; fi

  if [ "$word_before" = "$word" ]; then
    word=${word//l/w}
    word=${word//r/w}
  fi

  random_number=$(shuf -i 0-6 -n 1)
  if [ "${#word}" -gt 2 ] && [ "$random_number" -eq 0 ] && [[ "$word" =~ ^[a-zA-Z]*$ ]]; then
    word="${word:0:1}-${word}"
  fi

#  arr[$i]="${word}${end}"
  printf '%s' "${word}${end} "

done

echo