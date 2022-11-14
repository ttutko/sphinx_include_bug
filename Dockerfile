FROM sphinxdoc/sphinx:5.0.1 as docs-build
WORKDIR /docs
COPY src src

WORKDIR /docs/src

RUN make html

FROM nginx:latest as final
COPY --from=docs-build --chown=101:101 /docs/src/build/html/ /usr/share/nginx/html/