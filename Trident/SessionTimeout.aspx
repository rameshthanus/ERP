<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionTimeout.aspx.cs" Inherits="Trident.SessionTimeout" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
   
       


   
     
    <link href="App_Themes/Blue/NewGroup.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="Javascript/ProgressBar/jsUpdateProgress.js"></script>
  
  
  
</head>
<body>

    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ToolkitScriptManager1" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
          
          
            <div class="box light collapsible size1of1">
                <div class="head box-gradient-4">
                    <a href="#" class="text">
                        <h3 class="h4 strong">
                            Session Timeout</h3>
                    </a>
                </div>
                <div class="content padded-20">
                    <div class="line pricing-values">
                        <div id="mainContainer">


</div>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                             <td class="Trow" style="text-align: left;" colspan="3">
                                             Thank you for using Vertias.<br />
                                              your session has been expired, Please&nbsp;<a href="Default.aspx" target="_parent" runat="server" style="color:Blue;" >Click here</a>&nbsp;to
                                                login
                                                </td>
                                                </tr>
                                        
                                         
                                    
                           
                          
                        </table>
                        
                    </div>
                </div>
            </div>
             
           
          
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upProgress" runat="server">
        <ContentTemplate>
            <script type="text/javascript" language="javascript">
                var ModalProgress = '<%= ModalProgress.ClientID %>';         
            </script>
            
            <asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress">
                <asp:UpdateProgress ID="UpdateProg1" DisplayAfter="0" runat="server">
                    <ProgressTemplate>
                        <img src="../Images/Load Images/loader.gif" style="vertical-align: middle" alt="Processing" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
                PopupControlID="panelUpdateProgress" />
        </ContentTemplate>
    </asp:UpdatePanel>
   
  
       
    </form>
</body>
</html>
