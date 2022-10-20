

data "template_file" "task_definition_template" {
    template = file("./modules/infrastructure/modules/compute/task_definition.json.tpl")
}