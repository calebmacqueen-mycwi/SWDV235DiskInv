/*Caleb MacQueen 11/29/2018 Page Created*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class disk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void grdCD_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblMessage.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
    }

    protected void grdCD_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblMessage.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
    }

    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }

    protected void dvCD_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblMessage.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
    }
}