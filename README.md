# qt_project_structure
Repository example with shared libraries and tests (based on qtcreator project 
structure).

### Run tests
Tests are run with `make check`. In order to use tests and show their output 
in Qt Creator, add these build/custom steps:

1. Make step
  * override /usr/bin/make:
  * make arguments: `make -j4 -i check > %{CurrentProject:Path}/bin/tests.log 2>&1`
1. Custom process step
  * command: `%{CurrentProject:Path}/scripts/test2tasks.pl`
  * arguments: `< %{CurrentProject:Path}/bin/tests.log 1>&2`
  * working directory: `%{CurrentProject:Path}`

