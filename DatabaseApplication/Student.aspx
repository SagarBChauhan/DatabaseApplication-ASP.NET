<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="DatabaseApplication.Student" %>
<asp:Content runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <asp:GridView ID="gvStudentList"
     runat="server" AutoGenerateColumns="false">
        <Columns>
       <%-- <asp:BoundField HeaderText="First Name" DataField="FirstName" />
        <asp:BoundField HeaderText="Last Name" DataField="LastName" />--%>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label runat="server">
                    <%# Eval("FirstName") %>&nbsp;
                    <%# Eval("LastName") %>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
