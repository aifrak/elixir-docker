FROM hexpm/elixir:1.11.3-erlang-23.2.7-debian-buster-20210208 as build-elixir

ENV APP_USER=app-user
ENV APP_USER_GROUP=www-data
ENV APP_DIR=/app
ENV APP_USER_HOME=/home/$APP_USER

RUN \
  # create non root user
  adduser --quiet --disabled-password \
  --shell /bin/bash \
  --gecos "App user" $APP_USER \
  --ingroup $APP_USER_GROUP \
  # init app folder
  && mkdir -p $APP_DIR \
  && chown -R $APP_USER:$APP_USER_GROUP $APP_DIR

USER $APP_USER

VOLUME ["${APP_DIR}"]

WORKDIR $APP_DIR
