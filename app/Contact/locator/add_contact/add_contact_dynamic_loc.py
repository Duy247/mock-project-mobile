def get_contact_name(ct_name):
    return f"//*[contains(@resource-id,'header') and @text='{ct_name}']"

def get_contact_phone(ct_phone):
    return f"//*[contains(@resource-id,'display_number') and @text='{ct_phone}']"
