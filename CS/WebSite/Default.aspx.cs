using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxClasses;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void ASPxListBox1_Init(object sender, EventArgs e) {
        PopulateListBox();
    }
    protected void ASPxListBox1_Callback(object sender, CallbackEventArgsBase e) {
        PopulateListBox();
    }
    private void PopulateListBox() {
        ASPxListBox1.Items.Clear();
        for (int i = 0; i < ASPxGridView1.VisibleColumns.Count; i++)
            ASPxListBox1.Items.Add((ASPxGridView1.VisibleColumns[i] as GridViewDataColumn).FieldName, i);
    }
    protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
        switch (e.Parameters) {
            case "UP":
                ASPxGridView1.Columns[ASPxListBox1.SelectedItem.Text].VisibleIndex--;
                break;
            case "DOWN":
                ASPxGridView1.Columns[ASPxListBox1.SelectedItem.Text].VisibleIndex++;
                break;
        }
    }
   
}
