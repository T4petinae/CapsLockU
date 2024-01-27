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
    *a::
    {
        SendInput "{Alt Down}"
        global capslock_modifier_activated := true
        KeyWait "a"
        SendInput "{Alt Up}"
    }
    *b::
    {
        process_key_mapping("{Backspace}")
    }
    *c::
    {
        SendInput "{Ctrl Down}"
        global capslock_modifier_activated := true
        KeyWait "c"
        SendInput "{Ctrl Up}"
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
    *s::
    {
        SendInput "{Shift Down}"
        global capslock_modifier_activated := true
        KeyWait "s"
        SendInput "{Shift Up}"
    }
    *w::
    {
        is_w_double_clicks := ThisHotkey == A_PriorHotkey && A_TimeSincePriorHotkey <= 500 ? true : false
        global capslock_modifier_activated := true
        if (is_w_double_clicks)
        {
            SendInput "{Blind}{Home}{Home}+{End}+{Right}"
        }
        else
        {
            ; Select the word at the cursor position
            ; Determine whether the character to the left of the cursor position is a punctuation mark, space, tab, etc.
            ClipSaved := ClipboardAll()
            A_Clipboard := ""
            SendInput "{Blind}{Left}{Right}+{Left}^c{Right}"
            ClipWait(1)
            left_char := A_Clipboard
            if (RegExMatch(left_char, "[\w|\p{Han}]")) ; This regular expression matches all Latin letters, numbers, underscores `_`, and Chinese characters.
            {
                SendInput "{Blind}^{Left}^+{Right}"
            }
            else
            {
                SendInput "{Blind}^+{Right}"
            }
            A_Clipboard := ""
            SendInput "^c"
            ClipWait(1)
            current_char := A_Clipboard
            if (RegExMatch(current_char, "[\s]"))
            {
                SendInput "{Blind}{Left}^+{Left}"
            }
            A_Clipboard := ClipSaved
        }
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