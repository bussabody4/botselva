FROM alpine:3.15

# تثبيت التبعيات الأساسية
RUN apk add --no-cache \
    lua5.3 \
    lua5.3-libs \
    lua-socket \
    lua-sec \
    git \
    build-base \
    lua5.3-dev \
    luarocks

# تثبيت المكتبات البرمجية التي يطلبها الكود (serpent, dkjson, redis)
RUN luarocks-5.3 install serpent && \
    luarocks-5.3 install dkjson && \
    luarocks-5.3 install redis-lua && \
    luarocks-5.3 install luautf8

WORKDIR /app
COPY . .

# تشغيل البوت
CMD ["lua5.3", "bot.lua"]
