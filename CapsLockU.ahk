#SingleInstance Force
#Requires AutoHotkey v2
InstallKeybdHook

global capslock_modifier_activated := false ; flag variable, keep track of whether the CapsLock has been used as a modifier.

; To preserve the original case-switching functionality of the CapsLock.
*CapsLock::
{
    global
    KeyWait "CapsLock" ; Wait for the release of the CapsLock.
    If (capslock_modifier_activated == false)
    {
        SetCapsLockState !GetKeyState("CapsLock", "T")
    }
    else
    {
        capslock_modifier_activated := false
    }
}

; Configure key mapping.
#Hotif GetKeyState("CapsLock", "P") == true
{
    *b::
    {
        process_key_mapping("{Backspace}")
    }
    *d::
    {
        process_key_mapping("{Delete}")
    }
    *e::
    {
        process_key_mapping("{End}")
    }
    *f::
    {
        process_key_mapping("{Enter}")
    }
    *h::
    {
        process_key_mapping("{Home}")
    }
    *i::
    {
        process_key_mapping("{Up}")
    }
    *j::
    {
        process_key_mapping("{Left}")
    }
    *k::
    {
        process_key_mapping("{Down}")
    }
    *l::
    {
        process_key_mapping("{Right}")
    }
    *n::
    {
        process_key_mapping("{PgDn}")
    }
    *p::
    {
        process_key_mapping("{PgUp}")
    }
    *q::
    {
        process_key_mapping("{Escape}")
    }
}
#Hotif

; Modify the flag variable.
; Additionally, introduce a 'Blind Mode' to enable mapped keys to trigger their original functions, such as the selection function of `Shift + arrow keys`.
process_key_mapping(mapped_key)
{
    global
    capslock_modifier_activated := true
    mapped_key := "{Blind}" . mapped_key
    SendInput %"mapped_key"%
}