#################################
# Development
#################################
FROM node:10.1-alpine as build

# Create app folder
RUN mkdir /app
WORKDIR /app

COPY . .

RUN npm install -g json-server

# Install app dependencies
# RUN npm install -g yarn && \
# 	chmod a+rwx /usr/local/lib/node_modules/yarn/bin/yarn* && \
# 	chmod a+rwx  /usr/local/bin/yarn* && \
# 	yarn global add @vue/cli

# RUN yarn install --check-files

# Add configuration files
# COPY image-files/ /
# RUN chmod 700 /usr/local/bin/docker-entrypoint-dev.sh

# Expose port
EXPOSE 3000
# ENTRYPOINT ["docker-entrypoint-dev.sh"]
# CMD [ "tail", "-f", "/dev/null" ]
CMD [ "json-server", "--watch", "--host", "0.0.0.0", "db.json" ]
