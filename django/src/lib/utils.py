def list_contains(array, condition):
    for item in array:
        if condition(item):
            return True
        else:
            continue
    return False

def get_or_init(dict, key, initial):
    if key not in dict:
        return initial
    else:
        return dict[key]


def none_to_underscore(value):
    if value is None:
        return '-'
    else:
        return value