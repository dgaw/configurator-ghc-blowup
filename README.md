# Configurator GHC Blowup

A minimum example of a possible bug in Configurator causing GHC to allocate 
an unbounded amount of memory when compiled using Stack with profiling enabled.

## How to reproduce

stack build --profile

Be aware that GHC will start swapping if not caught in time :)
