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
            comm = new SqlCommand("EXEC InsertComment @nameTextBox,@emailTextBox, @msgTextBox", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

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
    <title>Contact Us</title>
    <meta name="viewport" content="width=device-width, initialscale=1.0">
    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css" />

    <script type="text/javascript" src="jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="scripts/register.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and
    media queries -->
    <!--: Respond.js doesn't work if you view the page
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
                        <p>Do you have any more questions about us? We would like to here what you have to say through the contact form below.</p>
                        <!--<form>
                          add spans with ids to display error messages and acceptance message
                          <label>First Name: <input type="text" name="fname" id="fname"></label><span class="errorFName error"></span><br>
                          <label>Last Name: <input type="text" name="lname" id="lname"></label><span class="errorLName error"></span><br>
                          <label for="comments">Please enter your comments:</label><span class="errorComment error"></span><br>
                                <textarea name="comments" id="comments" rows="6" cols="35"></textarea><br>
                          <input class="formBtn" type="submit" value="Submit" onclick="checkContact()">

                          <input class="formBtn" type="reset" value="Reset">
                        </form>
                        <button class="formBtn" onclick="runCheckContact()">Submit</button>
                        <p class="success"></p>-->
                        <form runat="server" name="registration_form" id="registration_form">

                            <label for="email_address">E-Mail:</label>
                            <%--<input type="text" name="email" id="email"/>--%>
                            <asp:TextBox ID="email" runat="server" onblur="processEntries()" name="email"/>
                            <br/>
                            <label for="name">Name:</label>
                            <%--<input type="text" name="name" id="name"/>--%>
                            <asp:TextBox ID="name" runat="server" onblur="processEntries()" name="name"/>
                            <br/>
                            <label for="message">Comments:</label>
                            <%--<textarea name="message" id="message" cols="45" rows="5"></textarea>--%>
                            <asp:TextBox ID="message" runat="server" Height="100px" Width="200px"  Font-Names="message"/>
                            <br/>
                            <asp:Button ID="submitButton" runat="server" Text="Submit" onclick="submitButton_Click" />

                            <input type="button" id="reset_form" value="Reset" onclick="resetForm()"/>
                            <br />
                            <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

                        </form>
                        <h2 id="registration_header">&nbsp;</h2>
                        <table id="registration_info"></table>
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
