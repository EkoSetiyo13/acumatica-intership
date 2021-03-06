<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="CR508000.aspx.cs"
    Inherits="Page_CR508000" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>
<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" PrimaryView="Filter" TypeName="PX.Objects.CR.PurgeContactsProcess">
		<CallbackCommands>
			<px:PXDSCallbackCommand Visible="false" DependOnGrid="grid" Name="Items_BAccount_ViewDetails" />
		</CallbackCommands>
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Width="100%" DataMember="Filter">
        <Template>
            <px:PXLayoutRule ID="PXLayoutRule1" runat="server" StartColumn="True" LabelsWidth="SM" ControlSize="XXS" />
            <px:PXLayoutRule ID="PXLayoutRule2" runat="server" Merge="True" SuppressLabel="True"/>
            <px:PXCheckBox CommitChanges="True" runat="server" DataField="PurgeOldNotConvertedLeads" ID="edPurgeOldNotConvertedLeads" />
            <px:PXTextEdit ID="edAgeNotConverted" CommitChanges="True" runat="server" DataField="PurgeAgeOfNotConvertedLeads" SuppressLabel="True"/>
            <px:PXLabel ID="PXLabel1" runat="server">Months</px:PXLabel>
            <px:PXLayoutRule ID="PXLayoutRule3" runat="server" />
            <px:PXLayoutRule ID="PXLayoutRule4" runat="server" Merge="True" SuppressLabel="True"/>
            <px:PXCheckBox CommitChanges="True" runat="server" DataField="PurgeOldInertContacts" ID="edPurgeOldInertContacts" />
            <px:PXTextEdit CommitChanges="True" ID="edPeriodWithoutActivity" runat="server" DataField="PurgePeriodWithoutActivity" SuppressLabel="True"/>
            <px:PXLabel ID="PXLabel2" runat="server">Months</px:PXLabel>
            <px:PXLayoutRule ID="PXLayoutRule5" runat="server" SuppressLabel="True"/>
            <px:PXCheckBox CommitChanges="True" runat="server" DataField="PurgeClosedContacts" ID="edPurgeClosedContacts" />
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%" Height="150px" SkinID="Inquire"
        AdjustPageSize="Auto" AllowPaging="True">
        <Levels>
            <px:PXGridLevel DataMember="Items">
                <Columns>
                    <px:PXGridColumn AllowNull="False" DataField="Selected" Label="Selected" TextAlign="Center" Type="CheckBox" AllowCheckAll="True" />
                    <px:PXGridColumn AllowUpdate="False" DataField="ContactType" />
                    <px:PXGridColumn AllowUpdate="False" DataField="CreatedDateTime" />
                    <px:PXGridColumn AllowUpdate="False" DataField="BAccount__LastActivity" />
                    <px:PXGridColumn AllowUpdate="False" DataField="Title" />
                    <px:PXGridColumn AllowUpdate="False" DataField="FirstName" />
                    <px:PXGridColumn AllowUpdate="False" DataField="LastName" />
                    <px:PXGridColumn AllowUpdate="False" DataField="Email" />
					<px:PXGridColumn DataField="BAccountID" LinkCommand="Items_BAccount_ViewDetails" />
					<px:PXGridColumn DataField="BAccount__AcctName" />
                    <px:PXGridColumn AllowUpdate="False" DataField="Status" RenderEditorText="True"/>
                    <px:PXGridColumn AllowUpdate="False" DataField="Resolution" RenderEditorText="True"/>
                    <px:PXGridColumn AllowUpdate="False" DataField="DuplicateStatus" RenderEditorText="True"/>
                    <px:PXGridColumn AllowUpdate="False" DataField="IsActive" TextAlign="Center" Type="CheckBox" />
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <ActionBar PagerVisible="False"/>
        <AutoSize Container="Window" Enabled="True" MinHeight="150" />
    </px:PXGrid>
</asp:Content>
