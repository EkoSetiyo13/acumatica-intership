<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="PM401000.aspx.cs"
    Inherits="Page_PM401000" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>
<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" TypeName="PX.Objects.PM.TransactionInquiry" PrimaryView="Filter">
        <CallbackCommands>
            <px:PXDSCallbackCommand Name="ViewDocument" Visible="false" DependOnGrid ="grid" />
            <px:PXDSCallbackCommand Name="ViewInventory" Visible="false" DependOnGrid ="grid" />
            <px:PXDSCallbackCommand Name="ViewCustomer" Visible="false" DependOnGrid ="grid" />
            <px:PXDSCallbackCommand Name="ViewInvoice" Visible="false" DependOnGrid ="grid" />
        </CallbackCommands>
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%" Caption="Selection" DataMember="Filter"
        DefaultControlID="edProjectID" NoteField="">
        <Template>
            <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="XM" />
            <px:PXSegmentMask CommitChanges="True" ID="edProjectID" runat="server" DataField="ProjectID" AllowEdit="True"/>
            <px:PXSegmentMask CommitChanges="True" ID="edAccountGroupID" runat="server" DataField="AccountGroupID" />
            <px:PXSegmentMask CommitChanges="True" ID="edProjectTaskID" runat="server" DataField="ProjectTaskID" AllowEdit="True"/>
            <px:PXSelector CommitChanges="True" ID="edCostCode" runat="server" AutoRefresh="True" DataField="CostCode" />
            <px:PXSegmentMask CommitChanges="True" ID="edInventory" runat="server" AutoRefresh="True" DataField="InventoryID"/>
            <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="XM" />
            <px:PXDateTimeEdit CommitChanges="True" ID="edDateFrom" runat="server" DataField="DateFrom" />
            <px:PXDateTimeEdit CommitChanges="True" ID="edDateTo" runat="server" DataField="DateTo" />
            <px:PXSegmentMask CommitChanges="True" ID="edResourceID" runat="server" DataField="ResourceID" />
            <px:PXCheckBox CommitChanges="True" ID="chkOnlyAllocation" runat="server" DataField="OnlyAllocation" />
			<px:PXCheckBox CommitChanges="True" ID="chkIncludeUnreleased" runat="server" DataField="IncludeUnreleased" />
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%" Height="150px" SkinID="PrimaryInquire" AdjustPageSize="Auto"
        AllowPaging="True" Caption="Transactions" FastFilterFields="RefNbr,Description" SyncPosition="True" RestrictFields="True">
        <Levels>
            <px:PXGridLevel DataMember="Transactions">
                <RowTemplate>
                    <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="XM" />
                    <px:PXSegmentMask ID="edResourceID" runat="server" DataField="ResourceID" />
                    <px:PXSegmentMask ID="edAccountGroupID" runat="server" DataField="AccountGroupID" />
                    <px:PXSegmentMask ID="edTaskID" runat="server" DataField="TaskID" AllowEdit="True" />
                    <px:PXSegmentMask ID="edBranchID" runat="server" DataField="BranchID" />
                    <px:PXSelector ID="edBAccountID" runat="server" DataField="BAccountID" />
                    <px:PXSegmentMask ID="edCostCode" runat="server" DataField="CostCodeID" />
                    <px:PXSegmentMask ID="edLocationID" runat="server" DataField="LocationID" />
                    <px:PXSegmentMask ID="edInventoryID" runat="server" DataField="InventoryID" />
                    <px:PXTextEdit ID="edDescription" runat="server" DataField="Description" />
                    <px:PXSelector ID="edUOM" runat="server" DataField="UOM" />
                    <px:PXNumberEdit ID="edQty" runat="server" DataField="Qty" />
                    <px:PXCheckBox ID="chkBillable" runat="server" Checked="True" DataField="Billable" />
                    <px:PXNumberEdit ID="edBillableQty" runat="server" DataField="BillableQty" />
                    <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="XM" />
                    <px:PXNumberEdit ID="edUnitRate" runat="server" DataField="UnitRate" />
                    <px:PXNumberEdit ID="edAmount" runat="server" DataField="Amount" />
                    <px:PXNumberEdit ID="edAmountNormal" runat="server" DataField="AmountNormal" />
                    <px:PXSegmentMask ID="edAccountID" runat="server" DataField="AccountID" />
                    <px:PXSegmentMask ID="edSubID" runat="server" DataField="SubID" />
                    <px:PXSegmentMask ID="edOffsetAccountID" runat="server" DataField="OffsetAccountID" />
                    <px:PXSelector Size="s" ID="edBatchNbr" runat="server" DataField="BatchNbr" AllowEdit="True" />
                    <px:PXSegmentMask ID="edOffsetSubID" runat="server" DataField="OffsetSubID" />
				</RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="BranchID" Label="Branch" />
                    <px:PXGridColumn DataField="PMRegister__Module" Label="Module" RenderEditorText="True" />
                    <px:PXGridColumn DataField="PMRegister__RefNbr" Label="Ref Number" LinkCommand="ViewDocument" />
                    <px:PXGridColumn DataField="TaskID" Label="Task" />
                    <px:PXGridColumn DataField="Date" DataType="DateTime"/>
                    <px:PXGridColumn DataField="FinPeriodID" DataType="DateTime"/>
                    <px:PXGridColumn DataField="Description" Label="Description" />
                    <px:PXGridColumn DataField="InventoryID" Label="InventoryID" LinkCommand="ViewInventory" />
                    <px:PXGridColumn DataField="CostCodeID" AutoCallBack="true" />
                    <px:PXGridColumn DataField="UOM" Label="UOM" />
                    <px:PXGridColumn DataField="Qty" Label="Qty" TextAlign="Right" />
                    <px:PXGridColumn DataField="Billable" Label="Billable" TextAlign="Center" Type="CheckBox" />
                    <px:PXGridColumn DataField="BillableQty" Label="Billable Qty" TextAlign="Right" />
                    <px:PXGridColumn DataField="TranCuryUnitRate" Label="Unit Rate" TextAlign="Right" />
                    <px:PXGridColumn DataField="TranCuryAmount" Label="Amount" TextAlign="Right" />
                    <px:PXGridColumn DataField="TranCuryAmountNormal" Label="Amount Normal" TextAlign="Right" />
					<px:PXGridColumn DataField="TranCuryID" />
					<px:PXGridColumn DataField="ProjectCuryAmount" TextAlign="Right" />
					<px:PXGridColumn DataField="ProjectCuryID" />
                    <px:PXGridColumn DataField="BAccountID" Label="Customer/Vendor" LinkCommand ="ViewCustomer"/>
                    <px:PXGridColumn DataField="ResourceID" Label="Resource" />
                    <px:PXGridColumn DataField="AccountGroupID" Label="Account Group" />
                    <px:PXGridColumn DataField="AccountID" Label="Account" />
                    <px:PXGridColumn DataField="SubID" Label="Subaccount" />
                    <px:PXGridColumn DataField="Account__AccountGroupID" Label="GL Account-Account Group" />
                    <px:PXGridColumn DataField="OffsetAccountID" Label="Offset Account" />
                    <px:PXGridColumn DataField="OffsetSubID" Label="Offset SubAccount" />
                    <px:PXGridColumn DataField="BatchNbr" />
                    <px:PXGridColumn DataField="EarningType" />
                    <px:PXGridColumn DataField="OvertimeMultiplier" />
                    <px:PXGridColumn DataField="Released" Label="Released" TextAlign="Center" Type="CheckBox" />
                    <px:PXGridColumn DataField="Allocated" Label="Allocated" TextAlign="Center" Type="CheckBox" />
					<px:PXGridColumn DataField="Billed" Label="Billed" TextAlign="Center" Type="CheckBox" />
                    <px:PXGridColumn DataField="PMRegister__OrigDocType" Type="DropDownList" />
                    <px:PXGridColumn DataField="PMRegister__OrigDocNbr" />
					<px:PXGridColumn DataField="ARTran__RefNbr" LinkCommand="ViewInvoice" />
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <AutoSize Container="Window" Enabled="True" MinHeight="150" />
    </px:PXGrid>
</asp:Content>
