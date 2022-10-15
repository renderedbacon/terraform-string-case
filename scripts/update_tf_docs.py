#!/usr/bin/env python

from argparse import ArgumentParser
from pathlib import Path
from module_dirs import list_module_paths
from yaml import safe_load, safe_dump


def is_valid_module(module_path: Path) -> bool:
    # check for minimal files
    module_files = [
        "README.md",
        "main.tf",
        "outputs.tf",
        "versions.tf",
    ]

    file_check = all(((module_path / file).exists() for file in module_files))

    return file_check


def generate_hooks_from_modules(module_paths: list[Path]):
    doc_hooks = []
    for module_path in module_paths:
        module_path_str = str(module_path)
        hook = {
            "id": f"terraform-docs-docker",
            "name": f"terraform docs {module_path_str if module_path_str != '.' else 'root'}",
            "args": [
                "--config",
                ".terraform-docs.yaml",
                str(module_path),
            ],
            "pass_filenames": False,
        }
        doc_hooks.append(hook)

    return doc_hooks


def update_pre_commit_config(root: Path, doc_hooks):
    # read in pre-commit-config
    config_path = root / ".pre-commit-config.yaml"
    with open(config_path, "r") as config_file:
        config = safe_load(config_file)

    # update hooks by replacing all tf-docs hooks
    for repo in config["repos"]:
        if repo["repo"] == "https://github.com/terraform-docs/terraform-docs":
            repo["hooks"] = doc_hooks
            break

    # write in pre-commit-config
    with open(config_path, "w") as config_file:
        safe_dump(config, config_file, sort_keys=False)


def main():
    parser = ArgumentParser(description="Find all the Modules and update .pre-commit-config.yaml to render tf docs.")
    parser.add_argument("--root", type=str, default=".", help="Root directory to start searching from")
    args = parser.parse_args()

    root = Path(args.root)

    # get list of validated modules
    module_paths = list_module_paths(root)
    valid_module_paths = [module_path for module_path in module_paths if is_valid_module(module_path)]

    # generate tf-docs hooks for each module
    doc_hooks = generate_hooks_from_modules(valid_module_paths)

    # update the hooks in the config file
    update_pre_commit_config(root, doc_hooks)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
