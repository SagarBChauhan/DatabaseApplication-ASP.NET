<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DatabaseApplication._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <asp:SqlDataSource runat="server" ID="StudentDataSource" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:StudentDBConnectionString %>" 
        DeleteCommand="DELETE FROM [tblStudent] WHERE [StudentID] = @original_StudentID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName" 
        InsertCommand="INSERT INTO [tblStudent] ([FirstName], [LastName]) VALUES (@FirstName, @LastName)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [tblStudent]" 
        UpdateCommand="UPDATE [tblStudent] SET [FirstName] = @FirstName, [LastName] = @LastName WHERE [StudentID] = @original_StudentID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName">
       <DeleteParameters>
           <asp:Parameter Name="original_StudentID" Type="Int32" />
           <asp:Parameter Name="original_FirstName" Type="String" />
           <asp:Parameter Name="original_LastName" Type="String" />
       </DeleteParameters>
       <InsertParameters>
           <asp:ControlParameter Name="FirstName" Type="String" ControlID="txtFirstName" />
           <asp:ControlParameter Name="LastName" Type="String" ControlID="txtLastName" />
       </InsertParameters>
       <UpdateParameters>
           <asp:Parameter Name="FirstName" Type="String" />
           <asp:Parameter Name="LastName" Type="String" />
           <asp:Parameter Name="original_StudentID" Type="Int32" />
           <asp:Parameter Name="original_FirstName" Type="String" />
           <asp:Parameter Name="original_LastName" Type="String" />
       </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvStudentList" runat="server" AllowPaging="True" 
        AllowSorting="True" DataSourceID="StudentDataSource">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <table>
        <tr>
            <td>First Name:</td>
            <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_click" />
            </td>
        </tr>
    </table>
</asp:Content>
