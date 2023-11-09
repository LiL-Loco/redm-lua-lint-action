FROM ghcr.io/LiL-Loco/luacheck:v1.1.1-redm-lua-v1.3.1

RUN mkdir -p /luacheck-redm
ADD . /luacheck-redm/
RUN apk add --no-cache yarn nodejs && \
    cd /luacheck-redm/ && \
    yarn --prod --frozen-lockfile && yarn build && \
    chmod +x /luacheck-redm/.docker/entrypoint.sh 
ENTRYPOINT ["/luacheck-redm/.docker/entrypoint.sh"]
