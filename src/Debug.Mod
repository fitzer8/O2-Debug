MODULE Debug;
(*###############################################################
# MODULE:    Debug.
# FUNCTION:    Contains various routines to display various
#            items such as characters and integers.
# AUTHOR:    Fitz
#================================================================
# HISTORY
#================================================================
#   DATE   #    NAME    # COMMENT
#================================================================
# 20021105 # Fitz       # Original. Version: 1.0.
# 20021105 # Fitz       # Added Quote and DQuote.
# 20021105 # Fitz       # Corrected History.
# 20030829 # Fitz       # Added Buffer.
# 20030831 # Fitz       # Corrected Buffer.
# 20030901 # Fitz       # Added buffer name to Buffer display.
# 20030920 # Fitz       # Added HexStr.
# 20031028 # Fitz       # Added Space.
# 20051209 # Fitz       # Added ShowChar and alot of cleanup.
# 20070401 # Fitz       # Added This and test version of Entry.
# 20070411 # Fitz       # Cleaned up some stuff.
# 20070412 # Fitz       # Changed Debug to use internal IL, and
#                       # not supplied.
# 20070821 # Fitz       # Added code to use or not use This in
#                       # Entry and Exit.
# 20101222 # Fitz       # Added code to test the yse of variable
#                       # parameter lists.
# 20101222 # Fitz       # Added lString and lqString;
# 20160917 # Fitz       # Added OutName and GetModuleInfo.
# 20160918 # Fitz       # Lots of cleanup.
# 20160918 # Fitz       # Some more cleanup.
###############################################################*)
IMPORT
    Out, Ascii, CharClass,
    Strings
(*
    Strings, RT0, This;
    Strings;
*)
	;

VAR
	IL*			: INTEGER;
	ModInfo*	: ARRAY 256 OF CHAR;


(*###############################################################
# To out a RT0 string.
###############################################################*)
(*
PROCEDURE OutName(name : RT0.Name);
VAR
	i : INTEGER;
BEGIN
	i := 0;
	WHILE name[i] # 0X DO
		Out.Char(name[i]);
		INC(i);
	END;
END OutName;
*)


(*###############################################################
# To get the RT0 info and massage into the format I want.
###############################################################*)
(*
PROCEDURE GetModuleInfo( file, func : RT0.Name );
VAR
	from, to:        INTEGER;

BEGIN
	from := 0;
	Out.String( "file: " );
	Out.String( file );
	Out.Ln;
	to := 0;
	WHILE to # 255 DO
		ModInfo[ to ] := 0X;
		INC( to );
	END;
	WHILE file[ from ] # "/" DO
		INC( from );
	END;
	INC( from );
	to := 0;
	WHILE file[ from ] # "." DO
		ModInfo[ to ] := file[ from ];
		INC( from );
		INC( to );
	END;
	ModInfo[ to ] := file[ from ];
	INC( to );
	Strings.Append( "Mod:", ModInfo );
	to := Strings.Length( ModInfo );
	from := 0;
	WHILE func[ from ] # "_" DO
		ModInfo[ to ] := func[ from ];
		INC( from );
		INC( to );
	END;
	ModInfo[ to ] := ":";
	INC( to );
	INC( from ); (* Skip past the two _ characters. *)
	INC( from );
	WHILE func[ from ] # 0X DO
		ModInfo[ to ] := func[ from ];
		INC( from );
		INC( to );
	END;
END GetModuleInfo;
*)


(*###############################################################
# Increment IL.
###############################################################*)
PROCEDURE Inc*;
BEGIN
    INC( IL );
END Inc;

(*###############################################################
# Decrement IL.
###############################################################*)
PROCEDURE Dec*;
BEGIN
    DEC( IL );
END Dec;

(*###############################################################
# To put out an indent (2 blanks) IL times.
###############################################################*)
PROCEDURE Indent*;
VAR
    n:    INTEGER;
BEGIN
	FOR n := IL TO 0 BY -1 DO
        Out.String( "  " );
    END;
END Indent;


(*###############################################################
# To put out a new line.
###############################################################*)
PROCEDURE Nl*;
BEGIN
    Out.Ln;
END Nl;


(*###############################################################
# To put out a character.
###############################################################*)
PROCEDURE Char* ( CH: CHAR );
BEGIN
    Out.Char( CH );
END Char;


(*###############################################################
# To put out a string.
###############################################################*)
PROCEDURE String* ( STR: ARRAY OF CHAR );
BEGIN
    Out.String( STR );
END String;


(*###############################################################
# To put out a single quote.
###############################################################*)
PROCEDURE Quote*;
BEGIN
    Char( "'" );
END Quote;


(*###############################################################
# To put out a double quote.
###############################################################*)
PROCEDURE DQuote*;
BEGIN
    Char( '"' );
END DQuote;


(*###############################################################
# To put out a label followed by a ":".
###############################################################*)
PROCEDURE Label* ( LBL: ARRAY OF CHAR );
BEGIN
    String( LBL );
    String( ": " );
END Label;


(*###############################################################
# To put out a quoted character.
###############################################################*)
PROCEDURE QChar* ( CH: CHAR );
BEGIN
    Quote;
    Char( CH );
    Quote;
END QChar;


(*###############################################################
# To put out a labeled quoted character.
###############################################################*)
PROCEDURE LQChar* ( LBL: ARRAY OF CHAR; CH: CHAR );
BEGIN
    Label( LBL );
    QChar( CH );
END LQChar;


(*###############################################################
# To put out a quoted string.
###############################################################*)
PROCEDURE QString* ( STR: ARRAY OF CHAR );
BEGIN
    Quote;
    String( STR );
    Quote;
END QString;


(*###############################################################
# MODULE:    LString.
# FUNCTION:  Prints out the label and a string.
# AUTHOR:    Fitz
#================================================================
# Usage:
#		Debug.LString( "lbl", "This is a labeled String" );
#
#		This will print out: "lbl: This is a labeled String".
#================================================================
# HISTORY
#================================================================
#   DATE   #    NAME    # COMMENT
#================================================================
# 20101222 # Fitz       # Original. Version: 0.0.
###############################################################*)
PROCEDURE LString* ( LBL, STR: ARRAY OF CHAR );
BEGIN
    Label( LBL );
    String( STR );
END LString;


(*###############################################################
# MODULE:    LQString.
# FUNCTION:  Prints out the label and quoted string.
# AUTHOR:    Fitz
#================================================================
# Usage:
#		Debug.LQString( "lbl", "This is a labeled String" );
#
#		This will print out: "lbl: 'This is a labeled String'".
#================================================================
# HISTORY
#================================================================
#   DATE   #    NAME    # COMMENT
#================================================================
# 20101222 # Fitz       # Original. Version: 0.0.
###############################################################*)
PROCEDURE LQString* ( LBL, STR: ARRAY OF CHAR );
BEGIN
    Label( LBL );
    QString( STR );
END LQString;


(*###############################################################
# To put out a label and then the string.
###############################################################*)
(*###############################################################
PROCEDURE String2* ( LBL, STR: ARRAY OF CHAR );
BEGIN
    String( STR );
END String2;
###############################################################*)


(*###############################################################
# To put out a label and then the quoted string.
###############################################################*)
(*###############################################################
PROCEDURE QString2* ( LBL, STR: ARRAY OF CHAR );
BEGIN
    (* Label( LBL ); *)
    QString( STR );
END QString2;
###############################################################*)


(*###############################################################
# To put out a label and then the INT in a N sized field.
###############################################################*)
PROCEDURE LInt* ( LBL: ARRAY OF CHAR; INT: INTEGER; N: LONGINT );
BEGIN
    Out.Int( INT, N );
END LInt;


(*###############################################################
# To put out a label and then the LONGINT in a N sized field.
###############################################################*)
PROCEDURE LLInt* ( LBL: ARRAY OF CHAR; LINT: LONGINT; N: LONGINT );
BEGIN

    Out.Int( LINT, N );
END LLInt;


(*###############################################################
# To put out a hex number in a N sized field.
###############################################################*)
PROCEDURE Hex* ( LINT, N: LONGINT );
BEGIN
    Out.Hex( LINT, N );
END Hex;


(*###############################################################
# To put out a label, and a hex number in a N sized field.
###############################################################*)
PROCEDURE LHex* ( LBL: ARRAY OF CHAR; LINT, N: LONGINT );
BEGIN
	Label( LBL );
    Hex( LINT, N );
END LHex;


(*###############################################################
# To put out a 2 digit hex number.
###############################################################*)
(*###############################################################
PROCEDURE H2* ( N: CHAR );
VAR
    (* tmp: LONGINT; *)
    ans: INTEGER;

BEGIN
    (* Out.Hex( LINT, N ); *)
    ans := ORD( N ) DIV 100H;
END H2;
###############################################################*)


(*###############################################################
# Displays the buffer STR and points to the currently indexed
# ch as shown by IDX. The second line needs to be indented il
# times.
###############################################################*)
(*
PROCEDURE Buffer*( NAME: ARRAY OF CHAR; STR: ARRAY OF CHAR; IDX: LONGINT; IL: INTEGER );
VAR
    tmp:    INTEGER;

BEGIN
    Out.String( " Buffer: " );
    Out.String( NAME );
    Out.Ln;
    INC( IL );

    Indent;
    Out.String( "IDX: " );
    Out.LongInt( IDX, 3 );
    Out.Ln;

    Indent;
    Out.String( 'STR: "' );
    Out.String( STR );
    Out.Char( '"' );
    Out.Ln;

    Indent;
    Out.String( 'IDX:  ' );
    tmp := 0;
    WHILE tmp <= IDX DO
        IF ORD( STR[ tmp ]) = ORD( Ascii.ht ) THEN
            Out.Char( Ascii.ht );
            INC( tmp );
        ELSE;
            Out.Char( " " );
            INC( tmp );
        END;
    END;
    Out.Char( "^" );
END Buffer;
*)


(*###############################################################
# Display a hex string of N bytes after printing out "0x".
###############################################################*)
PROCEDURE HexStr*( LINT, N: LONGINT );
VAR
    (* tmp:    INTEGER; *)

BEGIN
    Out.String( "0x" );
    Out.Hex( LINT, N );
END HexStr;


(*###############################################################
# To put out Num spaces.
###############################################################*)
PROCEDURE Space*;
BEGIN
    Char( " " );
END Space;


(*###############################################################
# To put out Num spaces.
###############################################################*)
PROCEDURE Spaces* ( Num: INTEGER );
BEGIN
    WHILE Num > 0 DO
        Space;
        DEC( Num );
    END;
END Spaces;


(*###############################################################
# Show what this character is.
###############################################################*)
PROCEDURE ShowChar*( ch: CHAR );
BEGIN
    Label( "Show Char" );
	IF(( ORD( ch ) >= 20H ) & ( ORD( ch ) < 07FH )) THEN
        QChar( ch );
    ELSE
        QChar( "." );
    END;
    Space;
    Label( "Hex" );
    HexStr( ORD( ch ), 2 );
END ShowChar;


(*###############################################################
# Print out the Parms string for procedure NAME.
###############################################################*)
PROCEDURE Parms*;
BEGIN
    String( "Parms: " );
END Parms;


(*###############################################################
# To put out a specific "DEBUG" string after indenting by IL.
###############################################################*)
PROCEDURE Debug*;
BEGIN
    Indent;
    String( "DEBUG - " );
END Debug;


(*###############################################################
# Print out the Entering string for procedure NAME.
###############################################################*)
(* PROCEDURE Entry* ( file, func: RT0.Name ); *)
PROCEDURE Entry*( file, proc: ARRAY OF CHAR );
BEGIN
(*
    IF This.Found THEN
*)
        Debug;
        String( "Entering: " );
        (* GetModuleInfo( file, func ); *)
        (* Out.String( ModInfo ); *)
        Out.String( file );
        Out.Char( ":" );
        Out.String( proc );
        Nl;
        Inc;
(*
    ELSE
        Debug();
        String( "Entering: " );
        String( file );
        Char( ":" );
        String( proc );
        Nl;
        Inc;
    END;
*)
END Entry;


(*###############################################################
# Print out the Exiting string for procedure NAME.
# PROCEDURE Exit* ( IL: INTEGER; NAME: ARRAY OF CHAR );
###############################################################*)
(* PROCEDURE Exit* ( file, func: RT0.Name ); *)
PROCEDURE Exit*( file, proc: ARRAY OF CHAR );
BEGIN
	Dec();
	Debug();
	String( "Exiting: " );
    String( file );
    Char( ":" );
    String( proc );
	Nl();
END Exit;

(*###############################################################
# MODULE:    OneLine.
# FUNCTION:  Prints out 1 line for things like ELSE or ELSIF clauses.
# AUTHOR:    Fitz
#================================================================
# Usage:
#		IF something THEN
#			do something here
#		ELSE
#			Debug.OneLine( "ELSE clause of IF something THEN" );
#		END;
# HISTORY
#================================================================
#   DATE   #    NAME    # COMMENT
#================================================================
# 20100409 # Fitz       # Original. Version: 0.0.
###############################################################*)
PROCEDURE OneLine* ( dbg: BOOLEAN; STR: ARRAY OF CHAR );
BEGIN
	IF dbg THEN
		LQString( "DEBUG - ", STR );
		Nl;
	END;
END OneLine;

(*###############################################################
# MODULE:    lString.
# FUNCTION:  Prints out the label and a string.
# AUTHOR:    Fitz
#================================================================
# Usage:
#		Debug.lString( "lbl", "This is a labeled String" );
#
#		This will print out: "lbl: This is a labeled String".
#================================================================
# HISTORY
#================================================================
#   DATE   #    NAME    # COMMENT
#================================================================
# 20101222 # Fitz       # Original. Version: 0.0.
###############################################################*)
(*###############################################################
PROCEDURE lString* ( LBL, STR: ARRAY OF CHAR );
BEGIN
		Debug;
    Out.String( LBL );
    Out.String( ": " );
    Quote;
    Out.String( STR );
    Nl;
END lString;
###############################################################*)

(*###############################################################
# MODULE:    lqString.
# FUNCTION:  Prints out the label and a string.
# AUTHOR:    Fitz
#================================================================
# Usage:
#		Debug.lString( "lbl", "This is a labeled String" );
#
#		This will print out: "lbl: 'This is a labeled String'".
#================================================================
# HISTORY
#================================================================
#   DATE   #    NAME    # COMMENT
#================================================================
# 20101222 # Fitz       # Original. Version: 0.0.
###############################################################*)
(*###############################################################
PROCEDURE lqString* ( LBL, STR: ARRAY OF CHAR );
BEGIN
		Debug;
    Out.String( LBL );
    Out.String( ": " );
    Quote;
    Out.String( STR );
    Quote;
    Nl;
END lqString;
###############################################################*)


BEGIN
    IL := 0;
END Debug.

