Rem package getter from all of arch repo's for acreetion repo, includes sig files
Rem Written By:  Darren W. Clift
Rem Copyright [c] 2024
Rem

$ScreenHide
$Console
_Dest _Console


Dim temp$(20000), file$(20000), ver$(20000)

Open "o", #5, "/home/log/"+date$

Shell "sudo pacman -Ss > tempfile.txt"

Open "i", #1, "tempfile.txt"

count = 0

While Not EOF(1)

    count = count + 1
    Line Input #1, temp$(count)
    Line Input #1, aa$

Wend

Close #1

For t = 1 To count

    ll = InStr(temp$(t), "/") + 1
    l3 = Len(temp$(t)) + 1
    tt$ = Mid$(temp$(t), ll, l3)

    l4 = InStr(tt$, " ")

    file$(t) = Mid$(tt$, 1, l4)

Next t

For lp = 1 To count

    Cls

    Print "Grabbing packages from Arch Repo"
    Print
    Print "Total packages to grab "; lp; " of"; count
    Print
    Print "Current package: "; file$(lp) + " #"; lp

    Shell "pacman -Sw --cachedir /drive1/repo/x86_64/  " + file$(lp) + " --noconfirm"

    Print #5, Date$; " - "; flie$(lp)

Next lp

Close #5

System



