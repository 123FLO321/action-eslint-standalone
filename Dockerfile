FROM 0815flo/eslint-standard:latest
LABEL version="1.0.0"
LABEL repository="https://github.com/123FLO321/action-eslint-standalone"
LABEL homepage="https://github.com/123FLO321/action-eslint-standalone"
LABEL maintainer="Florian Kostenzer <florian.kostenzer@icloud.com>"

LABEL "com.github.actions.name"="GitHub Action for Standalone ESLint"
LABEL "com.github.actions.description"="A tool to enforce ESLint style and conventions."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="orange"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
