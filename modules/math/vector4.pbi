; --------------------------------------------------------------------------------
; Math Vector4 Library
;
; Revision: 14 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Vector4

  Structure sVec4i Align #PB_Structure_AlignC
    x.i
    y.i
    z.i
    w.i
  EndStructure

  Structure sVec4q Align #PB_Structure_AlignC
    x.q
    y.q
    z.q
    w.q
  EndStructure

  Structure sVec4f Align #PB_Structure_AlignC
    x.f
    y.f
    z.f
    w.f
  EndStructure

  Structure sVec4d Align #PB_Structure_AlignC
    x.d
    y.d
    z.d
    w.d
  EndStructure
  
  ; Initialise Vectors
  Declare InitVec4i(*Vector.sVec4i, X.i = 0, Y.i = 0, Z.i = 0, W.i = 0.0)
  Declare InitVec4q(*Vector.sVec4q, X.q = 0, Y.q = 0, Z.q = 0, W.q = 0.0)
  Declare InitVec4f(*Vector.sVec4f, X.f = 0.0, Y.f = 0.0, Z.f = 0.0, W.f = 0.0)
  Declare InitVec4d(*Vector.sVec4d, X.d = 0.0, Y.d = 0.0, Z.d = 0.0, W.d = 0.0)
  
  ; Create a string that represents the supplied vector using the format provided
  Declare.s Vec4i_ToString(*Vec.sVec4i, Format.s = "<x, y, z, w>")
  Declare.s Vec4q_ToString(*Vec.sVec4q, Format.s = "<x, y, z, w>")
  Declare.s Vec4f_ToString(*Vec.sVec4f, Format.s = "<x, y, z, w>", NbDecimals = 4)
  Declare.s Vec4d_ToString(*Vec.sVec4d, Format.s = "<x, y, z, w>", NbDecimals = 4)

EndDeclareModule

Module Vector4

  Procedure InitVector4f(*Vector.sVec4f, X.f = 0.0, Y.f = 0.0, Z.f = 0.0, W.f = 0.0)
    With *Vector
      \x = X
      \y = Y
      \z = Z
      \w = W
    EndWith
  EndProcedure

  Macro ImplementMethods(Type)

    Procedure InitVec4#Type(*Vector.sVec4#Type, X.Type = 0, Y.Type = 0, Z.Type = 0, W.Type = 0)
      *Vector\x = X
      *Vector\y = Y
      *Vector\z = Z
      *Vector\w = W
    EndProcedure

  EndMacro
  
  Procedure.s Vec4i_ToString(*Vec.sVec4i, Format.s = "<x, y, z, w>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Vec\y), #PB_String_NoCase)
    str = ReplaceString(str, "z", Str(*Vec\z), #PB_String_NoCase)
    str = ReplaceString(str, "w", Str(*Vec\w), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec4q_ToString(*Vec.sVec4q, Format.s = "<x, y, z, w>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Vec\y), #PB_String_NoCase)
    str = ReplaceString(str, "z", Str(*Vec\z), #PB_String_NoCase)
    str = ReplaceString(str, "w", Str(*Vec\w), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec4f_ToString(*Vec.sVec4f, Format.s = "<x, y, z, w>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrF(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrF(*Vec\y, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "z", StrF(*Vec\z, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "w", StrF(*Vec\w, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec4d_ToString(*Vec.sVec4d, Format.s = "<x, y, z, w>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrD(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrD(*Vec\y, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "z", StrD(*Vec\z, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "w", StrD(*Vec\w, NbDecimals), #PB_String_NoCase)
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