FROM python@sha256:22d67fbf4849f06491933f273526e425342b210e9c8b90052708c09a00f6154f as base

WORKDIR /opt

ARG USER_UID=1000
RUN adduser --shell /bin/sh --system --group --uid "${USER_UID}" default

RUN chown -R default /opt

USER default

ENV VIRTUAL_ENV=/opt/.venv
ENV PATH "$VIRTUAL_ENV/bin:/home/default/.local/bin:$PATH"


FROM base as builder

RUN pip install poetry
COPY --chown=default:default poetry.lock poetry.toml pyproject.toml ./
RUN poetry install

FROM base as final

COPY --chown=default:default . .
COPY --chown=default:default --from=builder "$VIRTUAL_ENV" "$VIRTUAL_ENV"
COPY --chown=default:default --from=builder "$VIRTUAL_ENV" "/home/default/.venv"


ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD ["python", "src/project_template/main.py"]
