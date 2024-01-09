# CapsLockU

一个基于 AutoHotKey 的 CapsLock 键简易增强方案。

## 简介

CapsLockU 是我自用的一套按键映射方案，主要应用场景为文字办公，可以简化一些需要将手频繁地在鼠标和键盘之间切换的操作。

例如，编辑文字时需要删除某一段：

> 使用鼠标选中需要删除的文字 - **右手离开鼠标** - **右手寻找键盘右侧的`Delete`键** - 按下 `Delete` 键 - **右手寻找、返回鼠标**。

转变为：

> 鼠标选中需要删除的文字 - 左手按下 `CapsLock`+`d` 组合键（在 CapsLockU 中相当于 `Delete` 键）。

## 使用

在 [AutoHotKey 的官方网站](https://www.autohotkey.com/) 下载 AutoHotKey 程序并安装。

下载仓库中的 [CapsLockU.ahk](https://github.com/T4petinae/CapsLockU/blob/main/CapsLockU.ahk) 文件另存为至电脑的任意位置（推荐在习惯用于安装程序的磁盘下新建一个 AutoHotKey 文件夹进行存放），双击它即可使用。

同时可以为 CapsLockU.ahk 创建快捷方式，将快捷方式移动至开始菜单中的启动文件夹实现开机自动启动。

## 功能

| 热键 | 效果 | 注释 |
| --- | --- | --- |
| `CapsLock` | `CapsLock`/CapsLockU 的修饰键 | 短按时，效果等同于 CapsLock 键。长按时，可作为修饰键，触发下面的热键。 |
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
| `CapsLock`+`q` | `Escape` | 退出、关闭。键位取自单词 **Q**uit 。 |
| `CapsLock`+`s` | `Shift` | 效果等同于 `Shift` 键，在使用 `CapsLock` 作为修饰键时这样更顺手。 |
| `CapsLock`+`t` | 打开 Windows 自带的终端。 | 这在日常办公中也有可能用到，后面详细说明。键位取自单词 **T**erminal 。  |
| `CapsLock`+`u` | `Page Up` | 将光标或页面上移一个画面。键位取自 Page **U**p。 |

## 其他

待施工……
