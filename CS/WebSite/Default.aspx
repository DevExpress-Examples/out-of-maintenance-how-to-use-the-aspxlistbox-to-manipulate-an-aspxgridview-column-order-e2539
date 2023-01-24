<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Move ASPxGridViews's</title>

    <script type="text/javascript">
        var command;
        function OnBeginCallback(s, e) {
            command = e.command;
        }
        function OnEndCallback(s, e) {
            if (command == 'COLUMNMOVE')
                lst.PerformCallback();
        }

        function btnUp_Click(s, e) {
            var item = lst.GetSelectedItem();
            if (item == null)
                return;
            if (item.index > 0) {
                lst.RemoveItem(item.index);
                lst.InsertItem(item.index - 1, item.text, item.value)
                lst.SetSelectedIndex(item.index - 1);
                grid.PerformCallback(s.GetText());
            }
        }
        function btnDown_Click(s, e) {
            var item = lst.GetSelectedItem();
            if (item == null)
                return;
            if (item.index < lst.GetItemCount() - 1) {
                lst.RemoveItem(item.index);
                lst.InsertItem(item.index + 1, item.text, item.value)
                lst.SetSelectedIndex(item.index + 1);
                grid.PerformCallback(s.GetText());
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        KeyFieldName="ProductID" ClientInstanceName="grid" OnCustomCallback="ASPxGridView1_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="9">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <ClientSideEvents BeginCallback="OnBeginCallback" EndCallback="OnEndCallback" />
    </dx:ASPxGridView>
    <dx:ASPxListBox ID="ASPxListBox1" runat="server" ClientInstanceName="lst" 
        ValueType="System.Int32" Width="130px"
        OnCallback="ASPxListBox1_Callback" oninit="ASPxListBox1_Init">
    </dx:ASPxListBox>
    <dx:ASPxButton ID="btnUp" runat="server" Text="UP" AutoPostBack="False" Width="130px">
        <ClientSideEvents Click="btnUp_Click" />
    </dx:ASPxButton>
    <dx:ASPxButton ID="btnDown" runat="server" Text="DOWN" AutoPostBack="False" Width="130px">
        <ClientSideEvents Click="btnDown_Click" />
    </dx:ASPxButton>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued] FROM [Products]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
