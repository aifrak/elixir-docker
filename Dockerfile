FROM hexpm/elixir:1.11.3-erlang-23.2.7-debian-buster-20210208 as build-elixir

ENV APP_USER=app-user
ENV APP_USER_GROUP=app-user
ENV APP_DIR=/app
ENV APP_USER_HOME=/home/$APP_USER

RUN \
  # Create non root user group
  addgroup --gid 1000 --quiet $APP_USER_GROUP \
  # Create non root user
  && adduser --uid 1000 --quiet --disabled-password \
  --shell /bin/bash \
  --gecos "App user" $APP_USER \
  --ingroup $APP_USER_GROUP \
  # Init app folder
  && mkdir -p $APP_DIR \
  && chown -R $APP_USER:$APP_USER_GROUP $APP_DIR

USER $APP_USER

VOLUME ["${APP_DIR}"]

WORKDIR $APP_DIR
