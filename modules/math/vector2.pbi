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
  
  Declare InitVec2i(*Vector.sVec2i, X.i = 0, Y.i = 0)
  Declare InitVec2q(*Vector.sVec2q, X.q = 0, Y.q = 0)
  Declare InitVec2f(*Vector.sVec2f, X.f = 0, Y.f = 0)
  Declare InitVec2d(*Vector.sVec2d, X.d = 0, Y.d = 0)
  
  Declare.s Vec2i_ToString(*Vec.sVec2i, Format.s = "<%X, %Y>")
  Declare.s Vec2q_ToString(*Vec.sVec2q, Format.s = "<%X, %Y>")
  Declare.s Vec2f_ToString(*Vec.sVec2f, Format.s = "<%X, %Y>", NbDecimals = 4)
  Declare.s Vec2d_ToString(*Vec.sVec2d, Format.s = "<%X, %Y>", NbDecimals = 4)
  
  Declare Vec2i_Add(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Add(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Add(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Add(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  Declare Vec2i_Sub(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Sub(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Sub(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Sub(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  Declare Vec2i_Mul(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Mul(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Mul(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Mul(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  Declare Vec2i_Div(*LH.sVec2i, *RH.sVec2i, *Result.sVec2i)
  Declare Vec2q_Div(*LH.sVec2q, *RH.sVec2q, *Result.sVec2q)
  Declare Vec2f_Div(*LH.sVec2f, *RH.sVec2f, *Result.sVec2f)
  Declare Vec2d_Div(*LH.sVec2d, *RH.sVec2d, *Result.sVec2d)
  
  Declare.d Vec2i_Magnitude(*Vec.sVec2i)
  Declare.d Vec2q_Magnitude(*Vec.sVec2q)
  Declare.d Vec2f_Magnitude(*Vec.sVec2f)
  Declare.d Vec2d_Magnitude(*Vec.sVec2d)
  
  Declare.d Vec2i_DotProduct(*LH.sVec2i, *RH.sVec2i)
  Declare.d Vec2q_DotProduct(*LH.sVec2q, *RH.sVec2q)
  Declare.d Vec2f_DotProduct(*LH.sVec2f, *RH.sVec2f)
  Declare.d Vec2d_DotProduct(*LH.sVec2d, *RH.sVec2d)
  
  Declare.d Vec2i_CrossProduct(*LH.sVec2i, *RH.sVec2i)
  Declare.d Vec2q_CrossProduct(*LH.sVec2q, *RH.sVec2q)
  Declare.d Vec2f_CrossProduct(*LH.sVec2f, *RH.sVec2f)
  Declare.d Vec2d_CrossProduct(*LH.sVec2d, *RH.sVec2d)
  
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
    
    Procedure.d Vec2#Type#_Magnitude(*Vec.sVec2#Type)
      Protected mag.d
      mag = Sqr(Pow(*Vec\x, 2) + Pow(*Vec\y, 2))
      If mag = 0
        mag = 1
      EndIf
      ProcedureReturn mag
    EndProcedure
    
    Procedure.d Vec2#Type#_DotProduct(*LH.sVec2#Type, *RH.sVec2#Type)
      ProcedureReturn (*LH\x * *RH\x) + (*LH\y * *RH\y)
    EndProcedure
    
    Procedure.d Vec2#Type#_CrossProduct(*LH.sVec2#Type, *RH.sVec2#Type)
      ProcedureReturn (*LH\x * *RH\x) + (*LH\y * *RH\y)
    EndProcedure
    
  EndMacro
  
  Procedure.s Vec2i_ToString(*Vec.sVec2i, Format.s = "<%X, %Y>")
    Protected str.s = Format
    str = ReplaceString(str, "%X", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "%Y", Str(*Vec\y), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  Procedure.s Vec2q_ToString(*Vec.sVec2q, Format.s = "<%X, %Y>")
    Protected str.s = Format
    str = ReplaceString(str, "%X", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "%Y", Str(*Vec\y), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  Procedure.s Vec2f_ToString(*Vec.sVec2f, Format.s = "<%X, %Y>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "%X", StrF(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "%Y", StrF(*Vec\y, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure
  
  Procedure.s Vec2d_ToString(*Vec.sVec2d, Format.s = "<%X, %Y>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "%X", StrD(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "%Y", StrD(*Vec\y, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str    
  EndProcedure
  
  ImplementMethods(i)
  ImplementMethods(q)
  ImplementMethods(f)
  ImplementMethods(d)
  
EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 158
; FirstLine = 118
; Folding = --
; EnableXP