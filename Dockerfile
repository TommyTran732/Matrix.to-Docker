FROM node:alpine

LABEL maintainer="Thien Tran contact@tommytran.io"

ARG UID=992
ARG GID=992

RUN apk -U upgrade \
  && apk --no-cache add git \
  && adduser -g ${GID} -u ${UID} --disabled-password --gecos "" matrix-to

USER matrix-to

WORKDIR /home/matrix-to

RUN git clone https://github.com/matrix-org/matrix.to

WORKDIR /home/matrix-to/matrix.to

RUN yarn \
  && yarn build

EXPOSE 5000

ENTRYPOINT ["yarn", "start"]
