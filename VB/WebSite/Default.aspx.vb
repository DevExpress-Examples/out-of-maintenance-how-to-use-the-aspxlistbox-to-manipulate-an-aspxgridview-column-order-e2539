Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxListBox1_Init(ByVal sender As Object, ByVal e As EventArgs)
		PopulateListBox()
	End Sub
	Protected Sub ASPxListBox1_Callback(ByVal sender As Object, ByVal e As CallbackEventArgsBase)
		PopulateListBox()
	End Sub
	Private Sub PopulateListBox()
		ASPxListBox1.Items.Clear()
		For i As Integer = 0 To ASPxGridView1.VisibleColumns.Count - 1
			ASPxListBox1.Items.Add((TryCast(ASPxGridView1.VisibleColumns(i), GridViewDataColumn)).FieldName, i)
		Next i
	End Sub
	Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
		Select Case e.Parameters
			Case "UP"
				ASPxGridView1.Columns(ASPxListBox1.SelectedItem.Text).VisibleIndex -= 1
			Case "DOWN"
				ASPxGridView1.Columns(ASPxListBox1.SelectedItem.Text).VisibleIndex += 1
		End Select
	End Sub

End Class
