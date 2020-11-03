pnpm_run_cmd () {
    command=$1;
    shift;
    pnpm run $command -- $@
}

pnpm_run_recursive_cmd () {
    command=$1;
    shift;
    pnpm run $command -r -- $@
}

# Run pnpm workspace
pnpm_run_workspace_cmd () {
    workspace=$1;
    shift;
    command=$1;
    shift;
    pnpm run $command --filter $workspace -- $@
}

alias p="pnpm" # used for any general command
alias pi="pnpm install" # helper for installation
alias px="pnpm_run_cmd" # helper to run package scripts
alias pxr="pnpm_run_recursive_cmd" # helper to recursively run package scripts