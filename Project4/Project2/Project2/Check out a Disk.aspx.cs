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
        //get database error
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }
    protected void dvLoan_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            //show the error message
            lblMessage.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
        //reload the page when an item is checked out, so that the dropdown will repopulate 
        //and still show only checked in disks
        Response.Redirect("~/Check%20out%20a%20Disk.aspx"); //note to self: do not put spaces in file names ;}
    }
}