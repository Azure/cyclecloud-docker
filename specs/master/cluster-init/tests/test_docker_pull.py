#!/opt/cycle/jetpack/system/embedded/bin/python -m pytest
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import subprocess


def test_docker_pull():
    # Run a docker pull on busybox, as sanity check
    # This should pull a 1.22 Mb image from the public docker hub
    subprocess.check_call(['docker', 'pull', 'busybox'])
