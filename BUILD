# Terraform init Build Targets
filegroup(
    labels = [
        "api-gateway",
        "deploy",
        "plan",
    ],
    name = "api-gateway_pkg",
    srcs = glob([
        "*.tf",
        "commands/*.sh",
        "env-config/*.tfvars",
        "examples/*.tf",
    ]),
)

# commands
sh_binary(
    labels = [
        "api-gateway",
    ],
    deps = [
        ":api-gateway_pkg",
    ],
    main = "commands/destroy.sh",
    name = "destroy_exe",
)

sh_binary(
    labels = [
        "api-gateway",
    ],
    deps = [
        ":api-gateway_pkg",
    ],
    main = "commands/plan.sh",
    name = "plan_exe",
)

sh_binary(
    labels = [
        "api-gateway",
    ],
    deps = [
        ":api-gateway_pkg",
    ],
    main = "commands/apply.sh",
    name = "apply_exe",
)