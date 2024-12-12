def get_message_by_name(ct_name):
    return f"//*[@content-desc='{ct_name}']"

def get_message_by_number(ct_number):
    ct_number = str(ct_number)
    formatted_number = ' '.join(ct_number)
    formatted_number = formatted_number + ' '
    return f"//*[@content-desc='{formatted_number}']"
