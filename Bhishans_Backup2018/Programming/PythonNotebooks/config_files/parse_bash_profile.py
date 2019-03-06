import re
import os.path


aliases = []
with open(os.path.expanduser('~/.bash_profile')) as bashrc:
    
    for line in bashrc:
        if line.startswith('alias'):
            parts = re.match(r"""^alias (\w+)=(['"]?)(.+)\2$""", line.strip())
            if parts:
                source, _, target = parts.groups()
                aliases.append((source, target))
                print(source, ' = ', target)


