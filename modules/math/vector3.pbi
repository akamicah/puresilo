; --------------------------------------------------------------------------------
; Math Vector3 Library
;
; Revision: 14 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

XIncludeFile "math.pbi"

DeclareModule Vector3

  Structure sVec3i Align #PB_Structure_AlignC
    x.i
    y.i
    z.i
  EndStructure

  Structure sVec3q Align #PB_Structure_AlignC
    x.q
    y.q
    z.q
  EndStructure

  Structure sVec3f Align #PB_Structure_AlignC
    x.f
    y.f
    z.f
  EndStructure

  Structure sVec3d Align #PB_Structure_AlignC
    x.d
    y.d
    z.d
  EndStructure
  
  ; Initialise Vectors
  Declare InitVec3i(*Vector.sVec3i, X.i = 0, Y.i = 0, Z.i = 0)
  Declare InitVec3q(*Vector.sVec3q, X.q = 0, Y.q = 0, Z.q = 0)
  Declare InitVec3f(*Vector.sVec3f, X.f = 0, Y.f = 0, Z.f = 0)
  Declare InitVec3d(*Vector.sVec3d, X.d = 0, Y.d = 0, Z.d = 0)
  
  ; Create a string that represents the supplied vector using the format provided
  Declare.s Vec3i_ToString(*Vec.sVec3i, Format.s = "<x, y, z>")
  Declare.s Vec3q_ToString(*Vec.sVec3q, Format.s = "<x, y, z>")
  Declare.s Vec3f_ToString(*Vec.sVec3f, Format.s = "<x, y, z>", NbDecimals = 4)
  Declare.s Vec3d_ToString(*Vec.sVec3d, Format.s = "<x, y, z>", NbDecimals = 4)
  
  ; Add two vectors together
  Declare Vec3i_Add(*LH.sVec3i, *RH.sVec3i, *Result.sVec3i)
  Declare Vec3q_Add(*LH.sVec3q, *RH.sVec3q, *Result.sVec3q)
  Declare Vec3f_Add(*LH.sVec3f, *RH.sVec3f, *Result.sVec3f)
  Declare Vec3d_Add(*LH.sVec3d, *RH.sVec3d, *Result.sVec3d)
  
  ; Subtract two vectors
  Declare Vec3i_Sub(*LH.sVec3i, *RH.sVec3i, *Result.sVec3i)
  Declare Vec3q_Sub(*LH.sVec3q, *RH.sVec3q, *Result.sVec3q)
  Declare Vec3f_Sub(*LH.sVec3f, *RH.sVec3f, *Result.sVec3f)
  Declare Vec3d_Sub(*LH.sVec3d, *RH.sVec3d, *Result.sVec3d)
  
  ; Multiply two vectors
  Declare Vec3i_Mul(*LH.sVec3i, *RH.sVec3i, *Result.sVec3i)
  Declare Vec3q_Mul(*LH.sVec3q, *RH.sVec3q, *Result.sVec3q)
  Declare Vec3f_Mul(*LH.sVec3f, *RH.sVec3f, *Result.sVec3f)
  Declare Vec3d_Mul(*LH.sVec3d, *RH.sVec3d, *Result.sVec3d)
  
  ; Divide two vectors
  Declare Vec3i_Div(*LH.sVec3i, *RH.sVec3i, *Result.sVec3i)
  Declare Vec3q_Div(*LH.sVec3q, *RH.sVec3q, *Result.sVec3q)
  Declare Vec3f_Div(*LH.sVec3f, *RH.sVec3f, *Result.sVec3f)
  Declare Vec3d_Div(*LH.sVec3d, *RH.sVec3d, *Result.sVec3d)
  
  ; Normalise a vector
  Declare Vec3i_Normalise(*Vec.sVec3i, *Result.sVec3i)
  Declare Vec3q_Normalise(*Vec.sVec3q, *Result.sVec3q)
  Declare Vec3f_Normalise(*Vec.sVec3f, *Result.sVec3f)
  Declare Vec3d_Normalise(*Vec.sVec3d, *Result.sVec3d)
  
  ; Calculate the length of vector
  Declare.d Vec3i_Length(*Vec.sVec3i)
  Declare.d Vec3q_Length(*Vec.sVec3q)
  Declare.d Vec3f_Length(*Vec.sVec3f)
  Declare.d Vec3d_Length(*Vec.sVec3d)
  
  ; Calculate the squared length of vector
  Declare.d Vec3i_LengthSq(*Vec.sVec3i)
  Declare.d Vec3q_LengthSq(*Vec.sVec3q)
  Declare.d Vec3f_LengthSq(*Vec.sVec3f)
  Declare.d Vec3d_LengthSq(*Vec.sVec3d)
  
  ; Calculate the dot product of two vectors
  Declare.d Vec3i_DotProduct(*LH.sVec3i, *RH.sVec3i)
  Declare.d Vec3q_DotProduct(*LH.sVec3q, *RH.sVec3q)
  Declare.d Vec3f_DotProduct(*LH.sVec3f, *RH.sVec3f)
  Declare.d Vec3d_DotProduct(*LH.sVec3d, *RH.sVec3d)
  
  ; Calculate the cross product of two vectors
  Declare Vec3i_CrossProduct(*LH.sVec3i, *RH.sVec3i, *Result.sVec3i)
  Declare Vec3q_CrossProduct(*LH.sVec3q, *RH.sVec3q, *Result.sVec3q)
  Declare Vec3f_CrossProduct(*LH.sVec3f, *RH.sVec3f, *Result.sVec3f)
  Declare Vec3d_CrossProduct(*LH.sVec3d, *RH.sVec3d, *Result.sVec3d)
  
  ; Calculate the distance between two vectors
  Declare.d Vec3i_Distance(*LH.sVec3i, *RH.sVec3i)
  Declare.d Vec3q_Distance(*LH.sVec3q, *RH.sVec3q)
  Declare.d Vec3f_Distance(*LH.sVec3f, *RH.sVec3f)
  Declare.d Vec3d_Distance(*LH.sVec3d, *RH.sVec3d)
  
  ; Calculate the squared distance between two vectors
  Declare.d Vec3i_DistanceSq(*LH.sVec3i, *RH.sVec3i)
  Declare.d Vec3q_DistanceSq(*LH.sVec3q, *RH.sVec3q)
  Declare.d Vec3f_DistanceSq(*LH.sVec3f, *RH.sVec3f)
  Declare.d Vec3d_DistanceSq(*LH.sVec3d, *RH.sVec3d)

EndDeclareModule

Module Vector3

  Macro ImplementMethods(Type)

    Procedure InitVec3#Type(*Vector.sVec3#Type, X.Type = 0, Y.Type = 0, Z.Type = 0)
      *Vector\x = X
      *Vector\y = Y
      *Vector\z = Z
    EndProcedure

    Procedure Vec3#Type#_Add(*LH.sVec3#Type, *RH.sVec3#Type, *Result.sVec3#Type)
      *Result\x = *LH\x + *RH\x
      *Result\y = *LH\y + *RH\y
      *Result\z = *LH\z + *RH\z
    EndProcedure

    Procedure Vec3#Type#_Sub(*LH.sVec3#Type, *RH.sVec3#Type, *Result.sVec3#Type)
      *Result\x = *LH\x - *RH\x
      *Result\y = *LH\y - *RH\y
      *Result\z = *LH\z - *RH\z
    EndProcedure

    Procedure Vec3#Type#_Mul(*LH.sVec3#Type, *RH.sVec3#Type, *Result.sVec3#Type)
      *Result\x = *LH\x * *RH\x
      *Result\y = *LH\y * *RH\y
      *Result\z = *LH\z * *RH\z
    EndProcedure

    Procedure Vec3#Type#_Div(*LH.sVec3#Type, *RH.sVec3#Type, *Result.sVec3#Type)
      *Result\x = *LH\x / *RH\x
      *Result\y = *LH\y / *RH\y
      *Result\z = *LH\z / *RH\z
    EndProcedure

    Procedure Vec3#Type#_Normalise(*Vec.sVec3#Type, *Result.sVec3#Type)
      Protected.d length = Vec3#Type#_LengthSq(*Vec)
      If length = 0
        ProcedureReturn
      EndIf
      length = Math::RSqr(length)      
      *Result\x = *Vec\x * length
      *Result\y = *Vec\y * length
      *Result\z = *Vec\z * length
    EndProcedure

    Procedure.d Vec3#Type#_Length(*Vec.sVec3#Type)
      ProcedureReturn Sqr(*Vec\x * *Vec\x + *Vec\y * *Vec\y + *Vec\z * *Vec\z)
    EndProcedure

    Procedure.d Vec3#Type#_LengthSq(*Vec.sVec3#Type)
      ProcedureReturn *Vec\x * *Vec\x + *Vec\y * *Vec\y + *Vec\z * *Vec\z
    EndProcedure

    Procedure.d Vec3#Type#_DotProduct(*LH.sVec3#Type, *RH.sVec3#Type)
      ProcedureReturn (*LH\x * *RH\x) + (*LH\y * *RH\y) + (*LH\z * *RH\z)
    EndProcedure

    Procedure Vec3#Type#_CrossProduct(*LH.sVec3#Type, *RH.sVec3#Type, *Result.sVec3#Type)
      *Result\x = *LH\y * *RH\z - *LH\z * *RH\y
      *Result\y = *LH\z * *RH\x - *LH\x * *RH\z
      *Result\z = *LH\x * *RH\y - *LH\y * *RH\x
    EndProcedure

    Procedure.d Vec3#Type#_Distance(*LH.sVec3#Type, *RH.sVec3#Type)
      Protected.d vx, vy
      vx = *LH\x - *RH\x
      vy = *LH\y - *RH\y
      vz = *LH\z - *RH\z
      ProcedureReturn Sqr(vx * vx + vy * vy + vz * vz)
    EndProcedure

    Procedure.d Vec3#Type#_DistanceSq(*LH.sVec3#Type, *RH.sVec3#Type)
      Protected.d vx, vy
      vx = *LH\x - *RH\x
      vy = *LH\y - *RH\y
      vz = *LH\z - *RH\z
      ProcedureReturn (vx * vx + vy * vy + vz * vz)
    EndProcedure

  EndMacro

  Procedure.s Vec3i_ToString(*Vec.sVec3i, Format.s = "<x, y, z>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Vec\y), #PB_String_NoCase)
    str = ReplaceString(str, "z", Str(*Vec\z), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec3q_ToString(*Vec.sVec3q, Format.s = "<x, y, z>")
    Protected str.s = Format
    str = ReplaceString(str, "x", Str(*Vec\x), #PB_String_NoCase)
    str = ReplaceString(str, "y", Str(*Vec\y), #PB_String_NoCase)
    str = ReplaceString(str, "z", Str(*Vec\z), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec3f_ToString(*Vec.sVec3f, Format.s = "<x, y, z>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrF(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrF(*Vec\y, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "z", StrF(*Vec\z, NbDecimals), #PB_String_NoCase)
    ProcedureReturn str
  EndProcedure

  Procedure.s Vec3d_ToString(*Vec.sVec3d, Format.s = "<x, y, z>", NbDecimals = 4)
    Protected str.s = Format
    str = ReplaceString(str, "x", StrD(*Vec\x, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "y", StrD(*Vec\y, NbDecimals), #PB_String_NoCase)
    str = ReplaceString(str, "z", StrD(*Vec\z, NbDecimals), #PB_String_NoCase)
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