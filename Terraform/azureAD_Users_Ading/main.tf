terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "331a949f-b38b-4711-a7fb-64ce9e156260"
  
}

provider "azuread" {
  # make sure: az login

}

data "azurerm_subscription" "current" {}

# --------- 1) Naya Group Create ---------
resource "azuread_group" "Group1" {
  display_name     = "devops_intern"
  security_enabled = true

}

resource "azurerm_role_assignment" "devops_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.Group1.id
}


# --------- 2) Users list (existing Entra ID users) ---------
locals {
  devops_intern_users = [
              "09321606-2e4f-420a-8a39-a2ad023de634",
              "0b1a71ef-50f3-416d-bde7-d849402d70f3",
              "0d3764d3-9bfc-4c51-a6c1-95e037b5263d",
              "2d1d96c5-9fb7-4b6b-a35b-fdab8b1a24dc",
              "2ebe51dc-5007-4e1e-bc7a-4e40f40c4f84",
              "39f572d9-8aac-46ef-b5f6-8e0476034996",
              "3d765bf5-b8dc-46f6-a541-f5388a84de68",
              "41ab1d46-219d-4e6a-9927-292a139c2ade",
              "438321fc-9ea2-4b77-a79d-d7ffc8c71659",
              "46b03b95-f497-4d14-a6ca-8e76bf16cacc",
              "46eee629-ef99-485c-8c75-0f6cec161d0a",
              "4b5c3519-d77a-4bbe-b2f8-8c9a80319ee7",
              "51be2c17-342e-4a67-998f-3648c012e458",
              "538285a6-b70b-4389-9e0f-49fa133dc6e8",
              "55554339-3a81-471c-9e22-5899193239cd",
              "57972a9a-0681-4711-bdb6-e7d44d57b998",
              "58eb7261-1b29-49f3-aa99-5fcccd61e6f4",
              "5c0dcc29-4449-4d1e-8f7b-48bacfd6a458",
              "5c8ba178-f7a7-4452-989e-9da74ac86ef3",
              "5d446694-092b-4466-a855-b9e9cb9f2215",
              "612f3b15-3b0f-473e-95c9-6c7f68d39d94",
              "6fed1a38-4df1-4d49-b42e-f109c165d7fd",
              "7ea6c5d9-8801-4986-9286-09045d0bb5e7",
              "82487bbb-2195-4302-a56f-a7e2fd8d01f2",
              "87328793-8cfd-4358-b146-96368d319b57",
              "90d2c227-b534-4da0-a4e6-3a8e30b3c643",
              "945f6576-62a4-4730-966e-c2b4def7debb",
              "94f677da-72ac-44fe-9114-8756b9e50aaf",
              "96cc8bd4-02a7-472c-98a2-2959727890d9",
              "9e4b172e-1ab5-4ccb-a7b2-cc21128e2e53",
              "a1e36427-3322-4053-89be-0c3764562f9f",
              "ac70fc05-7cd7-4e72-81dd-ea4af05c54ac",
              "b21582b6-29d9-4065-aac9-a97ab7bb5d5f",
              "b970fd2c-d561-4a90-9d19-e3e780287613",
              "bb7fdad1-bfba-407b-8d11-c3a40403b26b",
              "c54880de-ae21-488a-bffe-a5efe840f87f",
              "c7317c8d-d974-4bc4-877c-5f298b6a7057",
              "cac0c48f-711f-4af1-9b54-a97642afcb68",
              "e94437b7-bd26-442f-a0ff-117c6e59454e",
              "ea8e2622-05b9-4643-81b3-8f7e199a0ac6",
              "eb6a24c7-6c6b-440b-82c6-4c8159df29c3",
              "ecda4226-a334-49b8-ba4c-d3b4a36b9e6d",
              "ef6389f4-77b0-44f9-aa29-ca9ca3a4c79d",
              "f0dbe183-5252-4afd-82bd-3000380103af",
              "f113db5a-91cc-41a9-ac19-7e0727b65ce9",
              "f1b0a4bf-2480-4621-a29f-d7c35c8ac0b8",
              "f1b8a070-f932-452f-b370-9564716f5784",
              "f53ef742-ba41-45f2-870f-fdfc26aa79a0",
              "f6309569-ca79-4b3c-80c1-93b3a5ee1c1a",
              "f869b066-1016-4f97-b2e5-ea6caae46213"
            ]
}


# --------- 3) Existing users ko lookup karo ---------
data "azuread_user" "intern_users" {
  for_each = toset(local.devops_intern_users)
  object_id = each.value
}

# --------- 4) Users ko naye group me add karo ---------
resource "azuread_group_member" "devops_intern_members" {
  for_each = data.azuread_user.intern_users

  group_object_id  = azuread_group.Group1.id
  member_object_id = each.value.id
}
