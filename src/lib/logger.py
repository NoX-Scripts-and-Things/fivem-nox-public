def info_log(message: str) -> None:
    print(f"[INFO] {message}")


def error_log(message: str) -> None:
    print(f"[ERROR] {message}")


def warn_log(message: str) -> None:
    print(f"[WARN] {message}")


def debug_log(message: str) -> None:
    print(f"[DEBUG] {message}")


def fatal_log(message: str) -> None:
    raise Exception(f"[FATAL] {message}")


if __name__ == "__main__":
    info_log("Example INFO log")
    error_log("Example ERROR log")
    warn_log("Example WARN log")
    debug_log("Example DEBUG log")
    fatal_log("Example FATAL log")
