from stdnum.ean import calc_check_digit


class InvalidNumber(Exception):
    """Base class for exceptions in this module."""
    pass


def generate_ean13(number):
    if number <= 2147483647:
        twelve_first = "2" + str(number).zfill(11)
        return twelve_first + calc_check_digit(str(twelve_first))
    else:
        raise InvalidNumber("Exceeded your maximum amount of things")


