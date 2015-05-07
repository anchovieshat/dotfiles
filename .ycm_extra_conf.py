def FlagsForFile(filename, **kwargs):
    return { 'flags': ['-Wall', '-Wextra', '-Werror', '-x', 'c', '-I', '.', '-std=c11'], 'do_cache': True }
