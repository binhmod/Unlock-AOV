#!/system/bin/sh

echo "Unlock Fps AOV"
echo "https://github.com/binhmod/Unlock-AOV.git"

# lấy thông tin tb
MANUFACTURER=$(getprop ro.product.manufacturer)
MODEL=$(getprop ro.product.model)

DEVICE_STRING="${MANUFACTURER} ${MODEL}"

echo "Mã máy : $DEVICE_STRING"

# => hex
HEX=$(echo -n "$DEVICE_STRING" | od -An -tx1 | tr -d ' \n')

echo "Hex           : $HEX"

# Cảm ơn bác Ngọc  Tú

P1="aHR0cHM6Ly9kbnR1"
P2="cmJvLmlvLnZuL2Ru"
P3="dHVyYm8vYW92L3Rv"
P4="b2wvTW9kRlBTLnBo"
P5="cD9ERVZJQ0U9"

jjhahqysh2="${P1}${P2}${P3}${P4}${P5}"
BASE=$(echo "$jjhahqysh2" | base64 -d)
LIMIT_ENC="JkxJTUlUPTE2"
LIMIT=$(echo "$LIMIT_ENC" | base64 -d)
jakqkag271="${BASE}${HEX}${LIMIT}"

OUTPUT="/sdcard/modfps.zip"

echo "Đang tải..."
HTTP_CODE=$(curl -L -o "$OUTPUT" -w "%{http_code}" "$jakqkag271")

if [ "$HTTP_CODE" = "200" ]; then
    echo "OK, đã lưu vào : → $OUTPUT"
    echo "Sao chép và dán vào /storage/emulated/0/Android/data/com.garena.game.kgvn/files/Resources/1.61.1"
    echo "Nhớ dán vào đúng phiên bản, ví dụ bản hiện tại là 1.61.1"
else
    echo "Tải thất bại, chả lẻ bác Ngọc Tú chặn hay sao :))"
fi
