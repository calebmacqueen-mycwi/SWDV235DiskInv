using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Check_out_a_Disk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }
    protected void dvLoan_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblMessage.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
        Response.Redirect("~/Check%20out%20a%20Disk.aspx");
    }
}