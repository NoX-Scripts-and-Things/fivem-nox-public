from colorama import Fore, Style


class Logger:
    logging_identifier = None
    color = None

    def __init__(self, logging_identifier, color=Fore.WHITE):
        self.logging_identifier = logging_identifier
        self.color = color

    def info(self, message):
        print("{}[{}]{} {}{}".format(self.color,
                                     self.logging_identifier,
                                     Style.RESET_ALL,
                                     message,
                                     Style.RESET_ALL))

    def custom(self, color, message, message_main):
        print("{}[{}]{} {}[{}]{} {}{}".format(self.color,
                                              self.logging_identifier,
                                              Style.RESET_ALL,
                                              color,
                                              message,
                                              Style.RESET_ALL,
                                              message_main,
                                              Style.RESET_ALL))

    def warn(self, message):
        print("{}[{}]{}{}[WARN] {}{}".format(self.color,
                                             self.logging_identifier,
                                             Style.RESET_ALL,
                                             Fore.LIGHTYELLOW_EX,
                                             Style.RESET_ALL,
                                             message))

    def error(self, message):
        print("{}[{}]{}{}[ERROR] {}{}".format(self.color,
                                              self.logging_identifier,
                                              Style.RESET_ALL,
                                              Fore.RED,
                                              Style.RESET_ALL,
                                              message))

    def fatal(self, message):
        print("{}[{}]{}{}[FATAL] {}{}".format(self.color,
                                              self.logging_identifier,
                                              Style.RESET_ALL,
                                              Fore.RED,
                                              Style.RESET_ALL,
                                              message))
        raise Exception(message)

