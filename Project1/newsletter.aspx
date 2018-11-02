<!--Caleb MacQueen March 2018 Created file
    Caleb MacQueen 11/02/2018 Converted to .aspx file-->
<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "wwiigames"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertList @nameTextBox,@emailTextBox", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = first_name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email_address1.Text;


            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>Newsletter Signup</title>
    <meta name="viewport" content="width=device-width, initialscale=1.0">
    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css" />

    <script type="text/javascript" src="jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="scripts/email_list.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and
    media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page
    via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/
    html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/
    respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div>
        <img src="images/desktopBackground.png" class="bg">
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.html">WWII Games</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <!-- make sure to change class="active" when making new pages -->
                        <!-- remove class="disabled" as pages are added-->
                        <li><a href="index.html">Home</a></li>
                        <li>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="games.html">Games <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="games.html#a&a">Axis and Allies</a></li>
                                <li><a href="games.html#landMinis">Axis and Allies Miniatures</a></li>
                                <li><a href="games.html#seaMinis">War at Sea Miniatures</a></li>
                                <li><a href="games.html#coh2">Company of Heroes 2</a></li>
                            </ul>
                        </li>
                        <li class="active">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="about.html">About Us <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="contact.aspx">Contact Us</a></li>
                                <li><a href="newsletter.aspx">Newsletter</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>

            <header>
                <div class=" container-fluid row">
                    <image src="images/banner.jpg" class="image-responsive bannerImage">
                </div>
            </header>

            <main>
                <div class="row">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-10">
                        <p>Do you want to play? Please sign up to get information about when and where we play.</p>
                        <!--<form class="center">
                          <label>Email Address: <input type="text" name="firstEmail" id="email"></label><span class="errorFirstEmail error"></span><br>
                          <label>Re-enter Email: <input type="text" name="secondEmail" id="secondEmail"></label><span class="errorSecondEmail error"></span><br>
                          <label>First Name: <input type="text" name="firstName" id="fName"></label><span class="errorFName error"></span><br>
                          <input class="formBtn" type="submit" value="Submit">
                          <input class="formBtn" type="reset" value="Reset">
                        </form>
                        <button class="formBtn" onclick="runCheckNewsletter()">Submit</button>
                        <p class="success"></p>-->
                        <form id="email_form" name="email_form" runat="server">
                            <label for="email_address1">Email Address:</label>
                            <%--<input type="text" name="email" id="email"/>--%>
       <asp:TextBox id="email_address1" name="email_address1" runat="server" onblur="joinList()"/>

                            <span id="email1" class="error">*</span><br>

                            <label for="email_address2">Re-enter Email Address:</label>
                            <%--<input type="text" name="email" id="email"/>--%>
       <asp:TextBox id="email_address2" name="email_address2" runat="server" onblur="joinList()"/>

                            <span id="email2" class="error">*</span><br>

                            <label for="first_name">First Name</label>
                            <%--<input type="text" name="name" id="name"/>--%>
                            <asp:TextBox id="first_name" name="first_name" runat="server" onblur="joinList()"/>

                            <span id="fName" class="error">*</span><br>

                            <label>&nbsp;</label>
                            <!--<input type="button" id="join_list" value="Join our List" onclick="joinList()">-->
                            <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
<br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

                        </form>
                        <p id="success"></p>
                    </div>
                    <div class="col-md-1">
                    </div>
                </div>
            </main>

            <footer>
                <p>
                    Want to play with us?<br>Contact us by email: <a href="mailto=@gmail.com">@gmail.com</a><br> Today is:
                    <script src="scripts/date.js"></script>
                </p>
                <!-- finish email address later -->
            </footer>
        </div>
    </div>
</body>
</html>
