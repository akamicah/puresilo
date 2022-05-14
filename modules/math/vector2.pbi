; --------------------------------------------------------------------------------
; Math Vector2 Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Vector2

  Structure sVec2i Align #PB_Structure_AlignC
    x.i
    y.i
  EndStructure

  Structure sVec2q Align #PB_Structure_AlignC
    x.q
    y.q
  EndStructure

  Structure sVec2f Align #PB_Structure_AlignC
    x.f
    y.f
  EndStructure

  Structure sVec2d Align #PB_Structure_AlignC
    x.d
    y.d
  EndStructure
  
  ; Initialise Vectors
  Declare InitVec2i(*Vector.sVec2i, X.i = 0, Y.i = 0)
  Declare InitVec2q(*Vector.sVec2q, X.q = 0, Y.q = 0)
  Declare InitVec2f(*Vector.sVec2f, X.f = 0, Y.f = 0)
  Declare InitVec2d(*Vector.sVec2d, X.d = 0, Y.d = 0)
  
  ; Create a string that represents the supplied vector using the format provided
  Declare.s Vec2i_ToString(*Vec.sVec2i, Format.s = "<x, y>")
  Declare.s Vec2q_ToString(*Vec.sVec2q, Format.s = "<x, y>")
  Declare.s Vec2f_ToString(*Vec.sVec2f, Format.s = "<x, y>", NbDecimals = 4)
  Declare.s Vec2d_ToString(*Vec.sVec2d, Format.s = "<x, y>", NbDecimals = 4)
  
  ; Add two vectors together
  Declare Vec2i_Add(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Add(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Add(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Add(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  ; Subtract two vectors
  Declare Vec2i_Sub(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Sub(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Sub(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Sub(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  ; Multiply two vectors
  Declare Vec2i_Mul(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Mul(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Mul(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Mul(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  ; Divide two vectors
  Declare Vec2i_Div(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Div(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Div(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Div(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  ; Normalise a vector
  Declare Vec2i_Normalise(*Vec.sVec2i, *Result.sVec2i)
  Declare Vec2q_Normalise(*Vec.sVec2q, *Result.sVec2q)
  Declare Vec2f_Normalise(*Vec.sVec2f, *Result.sVec2f)
  Declare Vec2d_Normalise(*Vec.sVec2d, *Result.sVec2d)
    
  ; Calculate the length of vector
  Declare.d Vec2i_Length(*Vec.sVec2i)
  Declare.d Vec2q_Length(*Vec.sVec2q)
  Declare.d Vec2f_Length(*Vec.sVec2f)
  Declare.d Vec2d_Length(*Vec.sVec2d)
  
  ; Calculate the squared length of vector
  Declare.d Vec2i_LengthSq(*Vec.sVec2i)
  Declare.d Vec2q_LengthSq(*Vec.sVec2q)
  Declare.d Vec2f_LengthSq(*Vec.sVec2f)
  Declare.d Vec2d_LengthSq(*Vec.sVec2d)
  
  ; Calculate the dot product of two vectors
  Declare.d Vec2i_DotProduct(*LH.sVec2i, *RH.sVec2i)
  Declare.d Vec2q_DotProduct(*LH.sVec2q, *RH.sVec2q)
  Declare.d Vec2f_DotProduct(*LH.sVec2f, *RH.sVec2f)
  Declare.d Vec2d_DotProduct(*LH.sVec2d, *RH.sVec2d)
  
  ; Calculate the distance between two vectors
  Declare.d Vec2i_Distance(*LH.sVec2i, *RH.sVec2i)
  Declare.d Vec2q_Distance(*LH.sVec2q, *RH.sVec2q)
  Declare.d Vec2f_Distance(*LH.sVec2f, *RH.sVec2f)
  Declare.d Vec2d_Distance(*LH.sVec2d, *RH.sVec2d)
  
  ; Calculate the squared distance between two vectors
  Declare.d Vec2i_DistanceSq(*LH.sVec2i, *RH.sVec2i)
  Declare.d Vec2q_DistanceSq(*LH.sVec2q, *RH.sVec2q)
  Declare.d Vec2f_DistanceSq(*LH.sVec2f, *RH.sVec2f)
  Declare.d Vec2d_DistanceSq(*LH.sVec2d, *RH.sVec2d)

EndDeclareModule

Module Vector2

  Macro ImplementMethods(Type)

    Procedure InitVec2#Type(*Vector.sVec2#Type, X.Type = 0, Y.Type = 0)
      *Vector\x = X
      *Vector\y = Y
    EndProcedure

    Procedure Vec2#Type#_Add(*LH.sVec2#Type, *RH.sVec2#Type, *Result.sVec2#Type)
      *Result\x = *LH\x + *RH\x
      *Result\y = *LH\y + *RH\y
    EndProcedure

    Procedure Vec2#Type#_Sub(*LH.sVec2#Type, *RH.sVec2#Type, *Result.sVec2#Type)
      *Result\x = *LH\x - *RH\x
      *Result\y = *LH\y - *RH\y
    EndProcedure

    Procedure Vec2#Type#_Mul(*LH.sVec2#Type, *RH.sVec2#Type, *Result.sVec2#Type)
      *Result\x = *LH\x * *RH\x
      *Result\y = *LH\y * *RH\y
    EndProcedure

    Procedure Vec2#Type#_Div(*LH.sVec2#Type, *RH.sVec2#Type, *Result.sVec2#Type)
      *Result\x = *LH\x / *RH\x
      *Result\y = *LH\y / *RH\y
    EndProcedure

    Procedure Vec2#Type#_Normalise(*Vec.sVec2#Type, *Result.sVec2#Type)
      Protected.d length = Vec2#Type#_LengthSq(*Vec)
      If length = 0
        ProcedureReturn #False
      EndIf
      *Result\x = *Vec\x / length
      *Result\y = *Vec\y / length
    EndProcedure

    Procedure.d Vec2#Type#_Length(*Vec.sVec2#Type)
      ProcedureReturn Sqr(*Vec\x * *Vec\x + *Vec\y * *Vec\y)
    EndProcedure

    Procedure.d Vec2#Type#_LengthSq(*Vec.sVec2#Type)
      ProcedureReturn (*Vec\x * *Vec\x + *Vec\y * *Vec\y)
    EndProcedure

    Procedure.d Vec2#Type#_DotProduct(*LH.sVec2#Type, *RH.sVec2#Type)
      ProcedureReturn (*LH\x * *RH\x) + (*LH\y * *RH\y)
    EndProcedure

    Procedure.d Vec2#Type#_Distance(*LH.sVec2#Type, *RH.sVec2#Type)
      Protected.d vx, vy
      vx = *LH\x - *RH\x
      vy = *LH\y - *RH\y
      ProcedureReturn Sqr(vx * vx + vy * vy)
    EndProcedure
    
    Procedure.d Vec2#Type#_DistanceSq(*LH.sVec2#Type, *RH.sVec2#Type)
      Protected.d vx, vy
      vx = *LH\x - *RH\x
      vy = *LH\y - *RH\y
      ProcedureReturn (vx * vx + vy * vy)
    EndProcedure
    
  EndMacro

  Procedure.s Vec2i_ToString(*Vec.sVec2i, Format.s = "<x, y>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Vec\y), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec2q_ToString(*Vec.sVec2q, Format.s = "<x, y>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Vec\y), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec2f_ToString(*Vec.sVec2f, Format.s = "<x, y>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrF(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrF(*Vec\y, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec2d_ToString(*Vec.sVec2d, Format.s = "<x, y>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrD(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrD(*Vec\y, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  ImplementMethods(i)
  ImplementMethods(q)
  ImplementMethods(f)
  ImplementMethods(d)

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 71
; FirstLine = 49
; Folding = --
; EnableXP