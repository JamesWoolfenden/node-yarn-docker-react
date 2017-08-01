FROM node:7.8.0

ENV NODE_ENV production
ENV NPM_CONFIG_LOGLEVEL warn

#RUN npm install -g yarn
RUN yarn global add serve

# copy the files
COPY . .

# build it
RUN yarn run build --production

# Run serve when the image is run.
CMD serve -s build

# Let Docker know about the port that serve runs on.
EXPOSE 5000
