data "fabric_capacity" "capacity" {
  display_name = var.capacity_name
}

resource "fabric_workspace" "bcws_datamart_workspace" {
  display_name = var.workspace_display_name
  description = "nr-bcws-datamart workspace"
  capacity_id = data.fabric_capacity.capacity.id
}

resource "fabric_lakehouse" "bcws_datamart_workspace" {
  display_name = "nr-bcws-datamart-lakehouse-${var.app-env}"
  workspace_id = fabric_workspace.bcws_datamart_workspace.id
}