; --------------------------------------------------------------------------------
; Math Vector2 Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Vector2
  
  Structure sVector2i Align #PB_Structure_AlignC
    x.i
    y.i
  EndStructure
  
  Structure sVector2q Align #PB_Structure_AlignC
    x.q
    y.q
  EndStructure
  
  Structure sVector2f Align #PB_Structure_AlignC
    x.f
    y.f
  EndStructure
  
  Structure sVector2d Align #PB_Structure_AlignC
    x.d
    y.d
  EndStructure
  
  Declare InitVector2i(*Vector.sVector2i, X.i = 0, Y.i = 0)
  Declare InitVector2q(*Vector.sVector2q, X.q = 0, Y.q = 0)
  Declare InitVector2f(*Vector.sVector2f, X.f = 0, Y.f = 0)
  Declare InitVector2d(*Vector.sVector2d, X.d = 0, Y.d = 0)
  
  Declare Vector2i_Add(*LH.sVector2i, *RH.sVector2i, *Result.sVector2i)
  Declare Vector2q_Add(*LH.sVector2q, *RH.sVector2q, *Result.sVector2q)
  Declare Vector2f_Add(*LH.sVector2f, *RH.sVector2f, *Result.sVector2f)
  Declare Vector2d_Add(*LH.sVector2d, *RH.sVector2d, *Result.sVector2d)
  
  Declare Vector2i_Sub(*LH.sVector2i, *RH.sVector2i, *Result.sVector2i)
  Declare Vector2q_Sub(*LH.sVector2q, *RH.sVector2q, *Result.sVector2q)
  Declare Vector2f_Sub(*LH.sVector2f, *RH.sVector2f, *Result.sVector2f)
  Declare Vector2d_Sub(*LH.sVector2d, *RH.sVector2d, *Result.sVector2d)
  
EndDeclareModule

Module Vector2
    
  Macro ImplementMethods(Type)
    
    Procedure InitVector2#Type(*Vector.sVector2#Type, X.Type = 0, Y.Type = 0)
      *Vector\x = X
      *Vector\y = Y
    EndProcedure
    
    Procedure Vector2#Type#_Add(*LH.sVector2#Type, *RH.sVector2#Type, *Result.sVector2#Type)
      *Result\X = *LH\X + *RH\X
      *Result\Y = *LH\Y + *RH\Y
    EndProcedure
    
    Procedure Vector2#Type#_Sub(*LH.sVector2#Type, *RH.sVector2#Type, *Result.sVector2#Type)
      *Result\X = *LH\X - *RH\X
      *Result\Y = *LH\Y - *RH\Y
    EndProcedure
    
  EndMacro
  
  ImplementMethods(i)
  ImplementMethods(q)
  ImplementMethods(f)
  ImplementMethods(d)
  
EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 26
; Folding = -
; EnableXP