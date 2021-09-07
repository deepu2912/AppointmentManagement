<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginall.aspx.cs" Inherits="Appointment_management_system_integration.Loginall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="text" runat="server" id="txtUserid" />
            <asp:Button runat="server" ID="btnLogin" Text="Log In" OnClick="btnLogin_Click" />

        </div>
        <div>
            <label id="lblMsg" runat="server"></label>
        </div>
    </form>
</body>
</html>
