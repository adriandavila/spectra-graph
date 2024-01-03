#!/bin/bash

# Bash library for controlling the Spectra-Graph build and environment

############################################
# Variables
############################################

export REPO_ROOT="$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)"

export SRC_DIR="${REPO_ROOT}"/spectra_graph/

############################################
# Help
############################################

spectra-help() {
    cat <<'_EOF_'
---------------------------------------------------------------
spectra-lib: a collection of bash functions to ease development
---------------------------------------------------------------

    Formatting and Linting:
        spectra-format-python: -------- Format all the python files
        spectra-sort-python: ---------- Sort the imports in python files
        spectra-typecheck-python: ----- Typecheck the python files

Happy developing!
_EOF_

    return 0
}

############################################
# Formatting and linting
############################################

spectra-format-python() {
    local HELP="""\
Formats all python files in the project

Syntax: spectra-sort-python [-h]
------------------------------
    -h               Print this help message
"""
    OPTIND=1
    while getopts ":h" opt; do
        case "${opt}" in
            h) echo "${HELP}"; return 0 ;;
        esac
    done

    black "${SRC_DIR}"
}

spectra-sort-python() {
    local HELP="""\
Sort the imports in all python files in the project

Syntax: spectra-sort-python [-h]
------------------------------
    -h               Print this help message
"""
    OPTIND=1
    while getopts ":h" opt; do
        case "${opt}" in
            h) echo "${HELP}"; return 0 ;;
        esac
    done

    isort ${SRC_DIR}
}

spectra-typecheck-python() {
    local HELP="""\
Typechecks the python files in the project

Syntax: spectra-typecheck-python [-h]
------------------------------
    -h               Print this help message
"""
    OPTIND=1
    while getopts ":h" opt; do
        case "${opt}" in
            h) echo "${HELP}"; return 0 ;;
        esac
    done
    
    pyright -p "${SRC_DIR}" --warnings
}
