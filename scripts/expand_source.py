#!/usr/bin/env python

# conda execute
# env:
#  - python >3
#  - pyyaml

import glob
import os
import shutil
import subprocess
import yaml


root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def fetch_source(recipe_dir):
    with open(os.path.join(recipe_dir, 'source.txt')) as fh:
        source = yaml.safe_load(fh)

    expected = set(['gh-repo', 'contents', 'git-tag'])

    unexpected_keys = set(source.keys()) - expected
    if unexpected_keys:
        raise RuntimeError('Unexpected keys {}'.format(unexpected_keys))

    missing = set(source.keys()) ^ expected
    if missing:
        raise RuntimeError('Missing keys {}'.format(missing))

    cache_dir = os.path.join(root_dir, '.cache')
    if not os.path.exists(cache_dir):
        os.mkdir(cache_dir)

    repo_dir = os.path.join(cache_dir, source['gh-repo'].replace('/', '_'))

    if os.path.exists(repo_dir):
        subprocess.check_call(['git', 'pull'], cwd=repo_dir)
    else:
        subprocess.check_call(['git', 'clone', 'https://github.com/{}.git'.format(source['gh-repo']), repo_dir])

    subprocess.check_call(['git', 'checkout', source['git-tag']], cwd=repo_dir)

    for fname in glob.glob(os.path.join(repo_dir, source['contents'])):
        shutil.copy(fname, os.path.join(recipe_dir, os.path.basename(fname)))


if __name__ == '__main__':
    for recipe_source in glob.glob(os.path.join(root_dir, '*', 'source.txt')):
        recipe_name = os.path.basename(os.path.dirname(recipe_source))
        print('Fetching: {}'.format(recipe_name))
        fetch_source(os.path.dirname(recipe_source))

