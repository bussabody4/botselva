FROM alpine:3.18

# 1. تثبيت الأدوات اللازمة لبناء المكتبات داخل السيرفر
RUN apk add --no-cache \
    lua5.3 \
    lua5.3-dev \
    build-base \
    cmake \
    git \
    openssl-dev \
    zlib-dev \
    gperf

# 2. تجهيز مجلد العمل
WORKDIR /app

# 3. نسخ ملفاتك (بدون الملف الكبير tdlua.so)
COPY . .

# 4. أمر تشغيل البوت (تأكد أن اسم ملفك هو bot.lua)
CMD ["lua5.3", "bot.lua"]
