
def json_params_exist(request, params: list):
    if not request.json:
        return False, "data missing"

    missing_params = []

    for param in params:
        if param not in request.json:
            missing_params.append(param)

    if missing_params:
        message = "missing parameters: {0}".format(", ".join(missing_params))
        return False, message

    return True, ""
