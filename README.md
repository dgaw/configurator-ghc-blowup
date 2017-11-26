# Configurator GHC Blowup

A minimum example of a possible bug in Configurator causing GHC to allocate 
an excessive amount of memory when compiling with profiling enabled.

## How to reproduce

stack build --profile

GHC will use 6+ GB of RAM to compile this. :)
