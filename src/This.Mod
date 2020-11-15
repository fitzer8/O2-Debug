MODULE This [INTERFACE "C" ];

IMPORT RT0;

VAR
    Found*    : BOOLEAN;

PROCEDURE ["(&_mid)NOPARAMS"] Module* () : RT0.Module;

PROCEDURE ["(_mid.name)NOPARAMS"] ModName* () : RT0.Name;

PROCEDURE ["(__FILE__)NOPARAMS"] File* () : RT0.Name;

PROCEDURE ["(__FUNCTION__)NOPARAMS"] Func* () : RT0.Name;

PROCEDURE ["(__LINE__)NOPARAMS"] Line* () : LONGINT;

BEGIN;
    Found := TRUE;
END This.