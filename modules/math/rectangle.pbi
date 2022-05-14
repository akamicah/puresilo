; --------------------------------------------------------------------------------
; Math Rectangle Library
;
; Revision: 14 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Rectangle
  
  Structure sRecti Align #PB_Structure_AlignC
    x.i
    y.i
    width.i
    height.i
  EndStructure
  
  Structure sRectq Align #PB_Structure_AlignC
    x.q
    y.q
    width.q
    height.q
  EndStructure
  
  Structure sRectf Align #PB_Structure_AlignC
    x.f
    y.f
    width.f
    height.f
  EndStructure
  
  Structure sRectd Align #PB_Structure_AlignC
    x.d
    y.d
    width.d
    height.d
  EndStructure
  
  ; Initialise Rectangles
  Declare InitRecti(*Rect.sRecti, X.i = 0, Y.i = 0, Width.i = 0, Height.i = 0)
  Declare InitRectq(*Rect.sRectq, X.q = 0, Y.q = 0.0, Width.q = 0.0, Height.q = 0.0)
  Declare InitRectf(*Rect.sRectf, X.f = 0.0, Y.f = 0.0, Width.f = 0.0, Height.f = 0.0)
  Declare InitRectd(*Rect.sRectd, X.d = 0.0, Y.d = 0.0, Width.d = 0.0, Height.d = 0.0)
  
  ; Create a string that represents the supplied rectangle using the format provided
  Declare.s Recti_ToString(*Rect.sRecti, Format.s = "<x, y, w, h>")
  Declare.s Rectq_ToString(*Rect.sRectq, Format.s = "<x, y, w, h>")
  Declare.s Rectf_ToString(*Rect.sRectf, Format.s = "<x, y, w, h>", NbDecimals = 4)
  Declare.s Rectd_ToString(*Rect.sRectd, Format.s = "<x, y, w, h>", NbDecimals = 4)
  
EndDeclareModule

Module Rectangle
  
  Macro ImplementMethods(Type)
    
    Procedure InitRect#Type(*Rectangle.sRect#Type, X.Type = 0, Y.Type = 0, Width.Type = 0, Height.Type = 0)
      *Rectangle\x = X
      *Rectangle\y = Y
      *Rectangle\width = Width
      *Rectangle\height = Height
    EndProcedure
    
  EndMacro
  
  Procedure.s Recti_ToString(*Rect.sRecti, Format.s = "<x, y, w, h>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Rect\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Rect\y), #PB_String_NoCase)
    str = ReplaceString(str, "w", Str(*Rect\width), #PB_String_NoCase)
    str = ReplaceString(str, "z", Str(*Rect\height), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  Procedure.s Rectq_ToString(*Rect.sRectq, Format.s = "<x, y, w, h>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Rect\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Rect\y), #PB_String_NoCase)
    str = ReplaceString(str, "w", Str(*Rect\width), #PB_String_NoCase)
    str = ReplaceString(str, "z", Str(*Rect\height), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  Procedure.s Rectf_ToString(*Rect.sRectf, Format.s = "<x, y, w, h>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrF(*Rect\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrF(*Rect\y, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "w", StrF(*Rect\width, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "z", StrF(*Rect\height, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  Procedure.s Rectd_ToString(*Rect.sRectd, Format.s = "<x, y, w, h>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrD(*Rect\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrD(*Rect\y, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "w", StrD(*Rect\width, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "z", StrD(*Rect\height, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  ImplementMethods(i)
  ImplementMethods(q)
  ImplementMethods(f)
  ImplementMethods(d)
  
EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 3
; Folding = --
; EnableXP