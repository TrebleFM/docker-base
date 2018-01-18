FROM treblefm/base

COPY .nvmrc /usr/src/app
WORKDIR /usr/src/app
RUN /installNode.sh

COPY ./ /usr/src/app
RUN npm install --quiet && \
    npm test

CMD npm start
