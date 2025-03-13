# administrative_units = {
#   default = {
#     # custom_name               = "<some cuctom display name>" # (Optional) Custom name for the Administrative Unit. This will override the automatically generated name
#     description               = "<description of the AU>"       # (Optional) Description of the Administrative Unit Default: ""
#     hidden_membership_enabled = false                        # (Optional) Whether the administrative unit and its members are hidden or publicly viewable in the directory. Default: false

#     # (Optional) List of object IDs of the members of the Administrative Unit. Default: []
#     members = [
#       "28fb2532-89d2-4ee6-905f-4e9a6dcd443a", # julien.degouffe_ssc-spc.gc.ca#EXT#@ent.cloud-nuage.canada.ca
#       "50726bdd-5f09-49b6-8fc8-620b47237bd4", # GcDc-CTO-ESLZ-Webtop
#     ]

#     # (Optional) Member assignment to AAD Role. Only support built-in roles at the moment. CUstom roles have to be manually added via the portal. Default: {}
#     role_members = {
#       "Groups Administrator" = {
#         member_object_ids = [
#           "43c575de-f7a9-4bf3-ac6e-f8d6539e05f2", # Bernard.Maltais_ssc-spc.gc.ca#EXT#@163Ent.onmicrosoft.com
#           "1bd43f7e-a92f-4070-8e3f-eca1623cb9e9", # GcPc-AAD-Azure Cloud-DevOps-GA-Admin-PT0
#         ]
#       },
#       "<some other AAD RBAC name allowed in AU>" = {
#         member_object_ids = [
#           "43c575de-f7a9-4bf3-ac6e-f8d6539e05f2", # Bernard.Maltais_ssc-spc.gc.ca#EXT#@163Ent.onmicrosoft.com
#           "1bd43f7e-a92f-4070-8e3f-eca1623cb9e9", # GcPc-AAD-Azure Cloud-DevOps-GA-Admin-PT0
#         ]
#       }
#     }
#   }
# }
