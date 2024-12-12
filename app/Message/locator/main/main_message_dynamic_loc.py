def get_message_by_number(ct_number):
    '''
    Process formatted number for dynamic locator in python file for better speed
    '''
    ct_number = str(ct_number)
    formatted_number = ' '.join(ct_number)
    formatted_number = formatted_number + ' '
    return f"//*[@content-desc='{formatted_number}']"
