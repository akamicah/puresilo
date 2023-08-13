; --------------------------------------------------------------------------------
; UUID Generation and Parsing Library (RFC 4122 Compliant)
; DCE 1.1, ISO/IEC 11578:1996 Variant
; Generated UUIDs can be tested with https://www.uuidtools.com/decode
;
; Revision: 13 August 2023
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

UseMD5Fingerprint()
UseSHA1Fingerprint()
OpenCryptRandom()

DeclareModule UUID
  
  ; Result Codes
  #UUID_Result_Success = #True
  #UUID_Result_NullPointer = -1
  #UUID_Result_InvalidString = -2
  #UUID_Result_NameEmpty = -3
  
  Structure sUUID
    byte.a[16]
  EndStructure
  
  Declare   MakeV3UUID(*output.sUUID, name.s, *namespace.sUUID = #Null)   ; - Generate a v3 UUID (MD5)
  Declare   MakeV4UUID(*output.sUUID)                                     ; - Generate a v4 UUID
  Declare   MakeV5UUID(*output.sUUID, name.s, *namespace.sUUID = #Null)   ; - Generate a v5 UUID (SHA1)
  Declare   MakeNilUUID(*output.sUUID)                                    ; - Set data to zero
  Declare.s UUIDToString(*uuid.sUUID, braces = #False)                    ; - Generate a string representation of a UUID
  Declare   ParseUUID(string.s, *output.sUUID)                            ; - Parse a string representation of a UUID to a sUUID
  Declare   CompareUUIDs(*uuid1.sUUID, *uuid2.sUUID)                      ; - Returns true if both UUIDs are equal, false otherwise
  
EndDeclareModule

Module UUID

  Procedure MakeV3UUID(*output.sUUID, name.s, *namespace.sUUID = #Null)
    Protected *strPtr, fprint, hash.s, byteIx.a, byte.a
    
    If *output = #Null
      ProcedureReturn #UUID_Result_NullPointer
    EndIf
    
    If Len(name) = 0
      ProcedureReturn #UUID_Result_NameEmpty
    EndIf
    
    *strPtr = AllocateMemory(Len(name))
    PokeS(*strPtr, name, Len(name), #PB_Ascii | #PB_String_NoZero)
    
    If *namespace = #Null
      Protected uuid.sUUID
      MakeNilUUID(@uuid)
      *namespace = @uuid
    EndIf
    
    fprint = StartFingerprint(#PB_Any, #PB_Cipher_MD5)
    AddFingerprintBuffer(fprint, @*namespace\byte[0], 16)
    AddFingerprintBuffer(fprint, *strPtr, Len(name))
    hash = FinishFingerprint(fprint)
    FreeMemory(*strPtr)

    ParseUUID(hash, *output)
      
    *output\byte[6] = *output\byte[6] & $0f | $30 ; Version
    *output\byte[8] = *output\byte[8] & $03f | $80; Variant
    
    ProcedureReturn #UUID_Result_Success
  EndProcedure
  
  Procedure MakeV4UUID(*output.sUUID)
    Protected byteIx.a
    
    If *output = #Null
      ProcedureReturn #UUID_Result_NullPointer
    EndIf
    
    For byteIx = 0 To 15
      *output\byte[byteIx] = CryptRandom(255)
    Next
    
    *output\byte[6] = *output\byte[6] & $0f | $40  ; Version
    *output\byte[8] = *output\byte[8] & $03f | $80 ; Variant
    
    ProcedureReturn #UUID_Result_Success
  EndProcedure
  
  Procedure MakeV5UUID(*output.sUUID, name.s, *namespace.sUUID = #Null)
    Protected *strPtr, fprint, hash.s, byteIx.a, byte.a
    
    If *output = #Null
      ProcedureReturn #UUID_Result_NullPointer
    EndIf
    
    If Len(name) = 0
      ProcedureReturn #UUID_Result_NameEmpty
    EndIf
    
    *strPtr = AllocateMemory(Len(name))
    PokeS(*strPtr, name, Len(name), #PB_Ascii | #PB_String_NoZero)
    
    If *namespace = #Null
      Protected uuid.sUUID
      MakeNilUUID(@uuid)
      *namespace = @uuid
    EndIf
    
    fprint = StartFingerprint(#PB_Any, #PB_Cipher_SHA1)
    AddFingerprintBuffer(fprint, @*namespace\byte[0], 16)
    AddFingerprintBuffer(fprint, *strPtr, Len(name))
    hash = FinishFingerprint(fprint)
    FreeMemory(*strPtr)
    
    ; Truncate Hash
    hash = Left(hash, 32)
    
    ParseUUID(hash, *output)      
    *output\byte[6] = *output\byte[6] & $0f | $50 ; Version
    *output\byte[8] = *output\byte[8] & $03f | $80; Variant    
    ProcedureReturn #UUID_Result_Success
  EndProcedure
  
  Procedure.s UUIDToString(*uuid.sUUID, braces = #False)
    Protected byteIx.a, result.s    
    If *uuid = #Null
      ProcedureReturn ""
    EndIf    
    For byteIx = 0 To 15
      If byteIx = 4 Or byteIx = 6 Or byteIx = 8 Or byteIx = 10
        result + "-"
      EndIf
      result + RSet(Hex(*uuid\byte[byteIx], #PB_Ascii), 2, "0")
    Next    
    If braces
      result = "{" + result + "}"
    EndIf    
    ProcedureReturn result
  EndProcedure
  
  Procedure ParseUUID(string.s, *output.sUUID)
    Protected byteIx.a, byte.a    
    
    If *output = #Null
      ProcedureReturn #UUID_Result_NullPointer
    EndIf
    
    string = Trim(string)
    string = RemoveString(string, "{")
    string = RemoveString(string, "}")
    string = RemoveString(string, "-")
    
    If Len(string) <> 32
      ProcedureReturn #UUID_Result_InvalidString
    EndIf
    
    For byteIx = 0 To 15
      byte = Val("$" + Mid(string, (byteIx * 2) + 1, 2))
      *output\byte[byteIx] = byte
    Next

    ProcedureReturn #UUID_Result_Success
  EndProcedure
  
  Procedure MakeNilUUID(*output.sUUID)
    Protected byteIx.a
    
    If *output = #Null
      ProcedureReturn #UUID_Result_NullPointer
    EndIf    
    
    For byteIx = 0 To 15
      *output\byte[byteIx] = 0
    Next    
    
    ProcedureReturn #UUID_Result_Success
  EndProcedure
  
  Procedure CompareUUIDs(*uuid1.sUUID, *uuid2.sUUID)
    If *uuid1 = #Null Or *uuid2 = #Null
      ProcedureReturn #UUID_Result_NullPointer
    EndIf    
    
    If CompareMemory(@*uuid1\byte, @*uuid2\byte, 16) <> 0
      ProcedureReturn #True
    EndIf
    
    ProcedureReturn #False    
  EndProcedure
  
EndModule
; IDE Options = PureBasic 6.03 beta 4 LTS (Linux - x64)
; CursorPosition = 191
; FirstLine = 155
; Folding = --
; EnableXP
; DPIAware
