<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="EditableDetails._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1, Version=8.1.6.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1, Version=8.1.6.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwgv:ASPxGridView ID="masterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCustomers" KeyFieldName="CustomerID">
			<Columns>
				<dxwgv:GridViewCommandColumn VisibleIndex="0">
					<EditButton Visible="True">
					</EditButton>
					<HeaderTemplate>
						&nbsp;
					</HeaderTemplate>
				</dxwgv:GridViewCommandColumn>
				<dxwgv:GridViewDataTextColumn FieldName="CustomerID" ReadOnly="True" VisibleIndex="1">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="2">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="Country" VisibleIndex="4">
				</dxwgv:GridViewDataTextColumn>
			</Columns>
			<Templates>
				<DetailRow>
						<dxwgv:ASPxGridView ID="detailGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceOrders"
							KeyFieldName="OrderID" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect">
							<Columns>
								<dxwgv:GridViewCommandColumn VisibleIndex="0">
									<EditButton Visible="True">
									</EditButton>
								</dxwgv:GridViewCommandColumn>
								<dxwgv:GridViewDataTextColumn FieldName="OrderID" ReadOnly="True" VisibleIndex="1">
									<EditFormSettings Visible="False" />
								</dxwgv:GridViewDataTextColumn>
								<dxwgv:GridViewDataTextColumn FieldName="CustomerID" VisibleIndex="2">
								</dxwgv:GridViewDataTextColumn>
								<dxwgv:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="3">
								</dxwgv:GridViewDataDateColumn>
								<dxwgv:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="4">
								</dxwgv:GridViewDataTextColumn>
								<dxwgv:GridViewDataTextColumn FieldName="Freight" VisibleIndex="5">
								</dxwgv:GridViewDataTextColumn>
							</Columns>
							<SettingsDetail IsDetailGrid="True" />
						</dxwgv:ASPxGridView>
				</DetailRow>
			</Templates>
			<SettingsDetail ShowDetailRow="True" />
		</dxwgv:ASPxGridView>
		&nbsp;
		<asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
			DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [Country]) VALUES (?, ?, ?, ?)"
			ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Country] FROM [Customers]"
			UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [Country] = ? WHERE [CustomerID] = ?">
			<DeleteParameters>
				<asp:Parameter Name="CustomerID" Type="String" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="CompanyName" Type="String" />
				<asp:Parameter Name="ContactName" Type="String" />
				<asp:Parameter Name="Country" Type="String" />
				<asp:Parameter Name="CustomerID" Type="String" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="CustomerID" Type="String" />
				<asp:Parameter Name="CompanyName" Type="String" />
				<asp:Parameter Name="ContactName" Type="String" />
				<asp:Parameter Name="Country" Type="String" />
			</InsertParameters>
		</asp:SqlDataSource>
		&nbsp;
		<asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
			DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = ?" InsertCommand="INSERT INTO [Orders] ([OrderID], [CustomerID], [OrderDate], [ShipName], [Freight]) VALUES (?, ?, ?, ?, ?)"
			ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate], [ShipName], [Freight] FROM [Orders] WHERE ([CustomerID] = ?)"
			UpdateCommand="UPDATE [Orders] SET [CustomerID] = ?, [OrderDate] = ?, [ShipName] = ?, [Freight] = ? WHERE [OrderID] = ?">
			<DeleteParameters>
				<asp:Parameter Name="OrderID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="CustomerID" Type="String" />
				<asp:Parameter Name="OrderDate" Type="DateTime" />
				<asp:Parameter Name="ShipName" Type="String" />
				<asp:Parameter Name="Freight" Type="Decimal" />
				<asp:Parameter Name="OrderID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="OrderID" Type="Int32" />
				<asp:Parameter Name="CustomerID" Type="String" />
				<asp:Parameter Name="OrderDate" Type="DateTime" />
				<asp:Parameter Name="ShipName" Type="String" />
				<asp:Parameter Name="Freight" Type="Decimal" />
			</InsertParameters>
			<SelectParameters>
				<asp:SessionParameter DefaultValue="ANTON" Name="CustomerID" SessionField="CustomerID"
					Type="String" />
			</SelectParameters>
		</asp:SqlDataSource>
	</div>
	</form>
</body>
</html>
