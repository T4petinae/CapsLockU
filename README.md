# CapsLockU

一个基于 AutoHotKey 的 CapsLock 键简易增强方案。

## 前言

CapsLockU 是我自用的一套按键映射方案，主要应用场景为文字办公，意在利用 CapsLock 优化一些需要将手频繁地在鼠标和键盘之间切换的操作。

> 例如，将操作“编辑文字时需要删除某一段”：使用鼠标选中需要删除的文字 - **右手离开鼠标** - **右手寻找键盘右侧的`Delete`键** - 按下 `Delete` 键 - **右手寻找鼠标、回到鼠标**。

> 转变为：鼠标选中需要删除的文字 - 左手按下 `CapsLock`+`d` 组合键。

## 使用

### 直接使用

在 [AutoHotKey 的官方网站](https://www.autohotkey.com/) 下载 AutoHotKey 程序并安装。

下载仓库中的 [CapsLockU.ahk](https://github.com/T4petinae/CapsLockU/blob/main/CapsLockU.ahk) 文件另存为至电脑的任意位置（推荐在习惯用于安装程序的磁盘下新建一个 AutoHotKey 文件夹进行存放），双击它即可使用。

同时可以为 CapsLockU.ahk 创建快捷方式，将快捷方式移动至开始菜单中的启动文件夹实现开机自动启动。

### 编译后使用

使用 [Ahk2Exe](https://github.com/AutoHotkey/Ahk2Exe) 对脚本进行编译后使用，这将提升脚本的运行效率，具体可参考 [Convert a Script to an EXE (Ahk2Exe)](https://www.autohotkey.com/docs/v2/Scripts.htm#ahk2exe) 。

也可以于 [Releases](https://github.com/T4petinae/CapsLockU/releases) 中直接下载已编译的 .exe 文件。

## 功能

| 热键 | 效果 | 注释 |
| --- | --- | --- |
| `CapsLock` | CapsLockU 的修饰键 | 长按时可作为修饰键，触发下面的热键。 |
| `Shift`+`CapsLock` | 原 `CapsLock` | 切换大小写。 |
| `CapsLock`+`a` | `Alt` | 效果等同于 `Alt` 键。这个映射其实不是很有必要，因为在左手尾指按住 `CapsLock` 时，尚可以用左手拇指按左 `Alt` ，只是为了呼应下面 `c` 与 `s` 的映射。 |
| `CapsLock`+`b` | `Backspace` | 删除光标前的文字。 |
| `CapsLock`+`c` | `Crtl` | 效果等同于 `Crtl` 键，在使用 `CapsLock` 作为修饰键时这样更顺手。 |
| `CapsLock`+`d` | `Delete` | 删除光标后的文字，或已被选中的文字与文件。|
| `CapsLock`+`e` | `End` | 将光标移动至当前行的末尾。 |
| `CapsLock`+`f` | `Enter` | 换行、确认。键位取自某些将字母键 `f` 作为确认、交互按键的游戏，因为 `e` 键已经被 `end` 使用了。 |
| `CapsLock`+`h` | `Home` | 将光标移动至当前行的开头。 |
| `CapsLock`+`i` | `Up` | 上方向键。 |
| `CapsLock`+`j` | `Left` | 左方向键。 |
| `CapsLock`+`k` | `Down` | 下方向键。 |
| `CapsLock`+`l` | `Right` | 右方向键 |
| `CapsLock`+`n` | `Page Down` | 将光标或页面下移一个画面。键位取自 Page Dow**n** 。 |
| `CapsLock`+`p` | `Page Up` | 将光标或页面上移一个画面。键位取自 Page U**p**。考虑过使用与 `n` 对称的 `u` 作为热键，但实际使用中 `p` 更为顺手。 |
| `CapsLock`+`q` | `Escape` | 退出、关闭。键位取自单词 **Q**uit 。 |
| `CapsLock`+`s` | `Shift` | 效果等同于 `Shift` 键，在使用 `CapsLock` 作为修饰键时这样更顺手。 |
| `CapsLock`+`w` | 选中单词或段落 | 单击，选中光标所处位置的单词，汉字环境中表现为选中两个标点符号之间的一句话。双击，选中光标所处位置的整个段落。 |

## 其他

### 选中单词或段落相关

`CapsLock`+`w` 的选中单词或段落功能实际上是通过模拟发送 `Ctrl`+`Lift` 或 `Ctrl`+`Shift`+`Right` 等快捷键实现的。虽然泛用，但对部分软件支持不是很好，在部分原生带有选中单词或段落功能的编辑器中，可以将改为优先使用软件原生支持的快捷键。

以 Visual Studio Code 为例，将 `*w::` 部分代码替换为以下，就可以实现在 Visual Studio Code 中将原生的 `Ctrl`+`d` （选中单词）与 `Ctrl`+`l` （选中整行）映射到 `CapsLock`+`w` 上，使各软件之间操作统一。

``` AutoHotKey
*w::
{
    is_w_double_clicks := ThisHotkey == A_PriorHotkey && A_TimeSincePriorHotkey <= 500 ? true : false ; w 键是否双击
    global capslock_modifier_activated := true
    ; 若处于 Visual Studio Code 中则使用其自带的快捷键
    if (WinActive(" - Visual Studio Code") && WinGetProcessName() == "Code.exe")
    {
        if (is_w_double_clicks)
        {
            SendInput "{Blind}^l"
        }
        else
        {
            SendInput "{Blind}^d"
        }
    }
    else
    {
        if (is_w_double_clicks)
        {
            SendInput "{Blind}{Home}{Home}+{End}+{Right}"
        }
        else
        {
            ; 选中光标所在位置的单词
            ; 判断光标所在位置左侧的字符是否为标点符号、空格或制表符等字符
            ClipSaved := ClipboardAll()
            A_Clipboard := ""
            SendInput "{Blind}{Left}{Right}+{Left}^c{Right}"
            ClipWait(1)
            left_char := A_Clipboard
            if (RegExMatch(left_char, "[\w|\p{Han}]")) ; 匹配所有字母、数字、下划线`_`、汉字的字符
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
```

*（施工中）*

## 后记

实际上市面上已经有很多基于 AutoHotKey 的 CapsLock 键映射方案了，这个仓库也参考了很多。但其中有些过度追求“完全键盘操作”了，在 GUI 越做越好的今天，鼠标操作既符合直觉又不需要找一些很不方便按的快捷键，何乐而不用呢？于是我想尝试在键鼠之间找个平衡点，就有了这个仓库。
