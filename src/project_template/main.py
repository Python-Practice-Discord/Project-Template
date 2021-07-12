import config
from utils.log import log


# TODO figure out why the package is working some times and not others `import project_template....`

def main():
    log.info("Hello world")
    log.debug(config.POSTGRES_DATABASE_URL)
    raise KeyError


if __name__ == "__main__":
    main()
