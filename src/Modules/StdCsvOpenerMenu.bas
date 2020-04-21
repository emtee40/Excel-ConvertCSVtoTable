Attribute VB_Name = "StdCsvOpenerMenu"
Option Explicit

Const AddinMenuIsValid = False
' �o���F customUI14.xml �Őݒ肷�邽�߁A������̃��j���[�͖�����
Const AddinName = "CSV�ϊ�"

Public Sub InstallAddIn()
    If Not AddinMenuIsValid Then Exit Sub

    Dim ObjCommandBar As CommandBar
    Dim ObjCommandBarControl As CommandBarControl
    Set ObjCommandBar = Application.CommandBars("Worksheet Menu Bar")
 
    On Error Resume Next
    ObjCommandBar.Controls(AddinName).Delete
    On Error GoTo 0
 
    Set ObjCommandBarControl = ObjCommandBar.Controls.Add(Type:=msoControlPopup, temporary:=True)
    ObjCommandBarControl.Caption = AddinName

    Dim StartAutoFormatButton As CommandBarControl
    Dim StopAutoFormatButton As CommandBarControl
    Dim ManualFormatButton As CommandBarControl

    With ObjCommandBarControl
        Set StartAutoFormatButton = .Controls.Add(Type:=msoControlButton)
        With StartAutoFormatButton
            .Caption = "�������`�̊J�n"
            .OnAction = "StartCsvOpener"
        End With

        Set StopAutoFormatButton = .Controls.Add(Type:=msoControlButton)
        With StopAutoFormatButton
            .Caption = "�������`�̒�~"
            .OnAction = "StopCsvOpener"
        End With

        Set ManualFormatButton = .Controls.Add(Type:=msoControlButton)
        With ManualFormatButton
            .Caption = "�蓮���`"
            .OnAction = "ConvertCsv"
        End With
    End With
End Sub


Public Sub UninstallAddIn()
    If Not AddinMenuIsValid Then Exit Sub
    On Error Resume Next
    Application.CommandBars("Worksheet Menu Bar").Delete
End Sub

