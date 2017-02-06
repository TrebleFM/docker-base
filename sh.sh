#!/bin/dash

if [ "$PPID" = "0" ]; then
    # Use bash login shell for Docker RUN/CMD/ENTRYPOINT
    exec "/bin/bash" "-l" "$@"
else
    # Use dash for everything else
    exec "/bin/dash" "$@"
fi
