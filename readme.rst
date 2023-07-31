******************
 Haskell Examples
******************
The goal of the repo is to collect examples of simple tasks in Haskell for my own future reference.

Tasks can be things like
"Read a csv file and output all fields in the name column", or
"write a message to syslog using the info proprity" or
"iterate over a tree in depth-first fashion".

Examples may either be a stack script store in a flat file,
or a project directory intended to be run with stack.
The files used to create them can be found in ``./templates``.

Examples that are stored in a flat file,
use `stacks script feature <https://www.fpcomplete.com/haskell/tutorial/stack-script/>`_.
To run one, first `install stack <https://docs.haskellstack.org/en/stable/install_and_upgrade/>`_,
set the executable bit with ``chmod +x FileName.hs``,
and run it with ``./FileName.hs``.

For project directories, first ``cd`` into the directory
and then run ``stack run`` or ``stack test``.
