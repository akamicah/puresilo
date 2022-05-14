; --------------------------------------------------------------------------------
; Types and type aliases for common use
;
; Revision: 14 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Types

  ; Ideally PureBasic would offer unsigned integers

  Macro ptr : i : EndMacro
  Macro size_t : i : EndMacro

  ; For use with interfacing outside PureBasic

  Macro c_bool : b : EndMacro ; 8 bit
  Macro c_int : l : EndMacro  ; 32 bit
  Macro c_uint : l : EndMacro ; 32 bit

  CompilerIf #PB_Compiler_OS = #PB_OS_Linux Or #PB_Compiler_OS = #PB_OS_MacOS
    Macro c_long : i : EndMacro ; 32 or 64 bit
    Macro c_ulong : i : EndMacro; 32 or 64 bit
  CompilerElse
    Macro c_long : l : EndMacro ; 32 bit
    Macro c_ulong : l : EndMacro; 32 bit
  CompilerEndIf

  Macro c_float : f : EndMacro
  Macro c_double: d : EndMacro

EndDeclareModule

Module Types : EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 11
; Folding = ---
; EnableXP