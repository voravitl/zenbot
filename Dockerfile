FROM node:8

RUN mkdir -p /app
WORKDIR /app

COPY . /app
RUN wget https://raw.githubusercontent.com/DeviaVir/zenbot/unstable/extensions/exchanges/binance/products.json -O extensions/exchanges/binance/products.json
RUN wget https://raw.githubusercontent.com/DeviaVir/zenbot/unstable/extensions/exchanges/binance/exchange.js -O extensions/exchanges/binance/exchange.js
RUN wget https://raw.githubusercontent.com/DeviaVir/zenbot/unstable/extensions/exchanges/binance/update-products.sh -O extensions/exchanges/binance/update-products.sh
RUN wget https://raw.githubusercontent.com/DeviaVir/zenbot/unstable/package-lock.json -O package-lock.json
RUN wget https://raw.githubusercontent.com/DeviaVir/zenbot/unstable/package.json -O package.json
RUN npm install -g node-gyp
RUN npm install --unsafe

RUN ln -s /app/zenbot.sh /usr/local/bin/zenbot

ENV NODE_ENV production

ENTRYPOINT ["/app/zenbot.sh"]
CMD [ "trade", "--paper" ]
