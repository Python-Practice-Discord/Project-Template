from project_template import config
from project_template.utils.log import log


def main():
    log.info("Hello world")
    log.debug(config.POSTGRES_DATABASE_URL)


if __name__ == "__main__":
    main()
