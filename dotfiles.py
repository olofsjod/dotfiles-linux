# dotfiles.py
# written by Olof Sjödin <me@olofsjodin.se> 2023-07-21

import argparse
import os
import sys
import shutil
import getpass

from subprocess import Popen, PIPE


def copy_file_or_directory(path_from: str, path_to: str):
    """
    This will copy a file or directory given the absolute paths.
    """
    try:
        # Check whether file or directory exists
        if not os.path.isfile(path_to) and not os.path.isdir(path_to):
            # Files and directories have to be copied with different methods
            if os.path.isdir(path_from):
                shutil.copytree(path_from, path_to)
            else:
                shutil.copy2(path_from, path_to)
        else:
            print(f"Skipping {path_from}->{path_to}")

    except:
        print(f"Unexpected error: {sys.exc_info()[0]}")


def get_variants_dictionary_from_dir_list(dir_cont: list[str]) -> dict[str, list[str]]:
    variants = {}
    for fd_name in dir_cont:
        fname = fd_name.split("~")[0]

        if not fname in variants:
            variants[fname] = []

        if "~" in fd_name:
            variant = fd_name.split("~")[1]
            variants[fname].append(variant)

    return variants


def copy_config_files(conf_dir_path: str, to_dir_path: str, variant: str = ""):
    """This will copy all the files in `confdir` to $HOME. If specifying a variant
    e.g. 'bar', then files and directories in confdir with the extension ~bar have
    precedence.
    """
    confdir_content = os.listdir(conf_dir_path)

    confdir_variants = get_variants_dictionary_from_dir_list(confdir_content)

    for fname in filter(lambda f: not "~" in f, confdir_content):
        dstname = os.path.join(to_dir_path, "." + fname)
        print(fname)
        # Check whether variant exist or not
        if variant in confdir_variants[fname]:
            srcname = os.path.join(conf_dir_path, f"{fname}~{variant}")
            copy_file_or_directory(srcname, dstname)
        elif len(confdir_variants[fname]) == 0:
            srcname = os.path.join(conf_dir_path, fname)
            copy_file_or_directory(srcname, dstname)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Copies the dotfiles to the current computer."
    )

    parser.add_argument("--conf-dir-path", default=os.path.join(os.getcwd(), "config_files"))
    parser.add_argument("--to-dir-path", default=os.getenv("HOME"))
    parser.add_argument("--variant", default="")

    args = parser.parse_args()

    copy_config_files(
        args.conf_dir_path, args.to_dir_path, args.variant
    )
