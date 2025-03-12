administrative_units = {
  unit1 = {
    custom_display_name       = "<some cuctom display name>" # (Optional) Custom name for the Administrative Unit. This will override the automatically generated name
    description               = "<some description>"         # (Optional) Description of the Administrative Unit Default: ""
    hidden_membership_enabled = true                         # (Optional) Whether the administrative unit and its members are hidden or publicly viewable in the directory. Default: true
    members                   = ["<some object id>"]         # (Optional) List of object IDs of the members of the Administrative Unit. Default: []
    role_members = {
      role1 = {
        role_object_id   = "<some aad role object id>" # (Required) The object ID of the directory role you want to assign. Changing this forces a new resource to be created.
        member_object_id = "<some aad object id>"      # (Required) The object ID of the user, group or service principal you want to add as a member of the administrative unit. Changing this forces a new resource to be created.
      }
    }
  }
}
