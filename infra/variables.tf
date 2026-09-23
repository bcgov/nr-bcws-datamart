
variable "app_env" {
  description = "Application environment (dev, test, prod)"
  type        = string
}

variable "repo_name" {
  description = "Name of the repository, used for resource naming"
  type        = string
  default     = "quickstart-azure-containers"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    error_message = "subscription_id must be a valid GUID string."
  }
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.tenant_id))
    error_message = "tenant_id must be a valid GUID string."
  }
}

variable "use_oidc" {
  description = "Use OIDC for authentication"
  type        = bool
  default     = true
}

variable "prevent_rg_deletion_if_contains_resources" {
  description = "AzureRM provider feature flag: refuse to delete a resource group if Azure reports it still contains resources. Set false to allow RG deletion even when Azure-managed/auto-created resources remain (e.g., App Insights Smart Detector rules)."
  type        = bool
  default     = true
}

variable "client_id" {
  description = "Azure client ID for the service principal"
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.client_id))
    error_message = "client_id must be a valid GUID string."
  }
}


# Fabric variables per https://registry.terraform.io/providers/microsoft/fabric/latest/docs/guides/getting_started
variable "workspace_display_name" {
  description = "A name for the getting started workspace."
  type        = string
}

variable "notebook_display_name" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
}

variable "notebook_definition_update_enabled" {
  description = "Whether to update the notebook definition."
  type        = bool
  default     = true
}

variable "notebook_definition_path" {
  description = "The path to the notebook's definition file."
  type        = string
}

variable "capacity_name" {
  description = "The name of the capacity to use."
  type = string
}