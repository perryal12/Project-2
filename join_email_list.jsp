<%@ include file="/includes/header.html" %>

<script language="JavaScript">
function validate(form)
{
    if (form.firstName.value=="") 
    {
        alert("Please fill in your Name");
        form.firstName.focus();
    }
    else if (form.lastName.value=="")
    {
        alert("Please fill in your telephone number");
        form.lastName.focus();
    }
    else if (form.emailAddress.value=="")
    {
        alert("Please fill in your email address");
        form.emailAddress.focus();
    }
    else
    {
        form.submit();
    }
}
</script>

<%@ page import="business.User" %>
<%

    User user = (User) request.getAttribute("user");
    String message = (String) request.getAttribute("message");

    if (user == null) user = new User();
    if (message == null) message = "";
%>

<h1>Come join our class!</h1>
<p>To join our class, please enter your name,
 telephone number, and email address below. <br>
 Then, click on the Submit button.</p>

<p><i><%= message %></i></p>

<form action="addToEmailList" method="post">
<table cellspacing="5" border="0">
<tr>
  <td align="center">Name:</td>
  <td><input type="text" name="firstName" 
        value="<%= user.getFirstName() %>"></td>
</tr>
<tr>
  <td align="center">Telephone Number:</td>
  <td><input type="text" name="lastName" 
        value="<%= user.getLastName() %>"></td>
</tr>
<tr>
  <td align="center">Email address:</td>
  <td><input type="text" name="emailAddress" 
        value="<%= user.getEmailAddress() %>"></td>
</tr>
<tr>
  <td></td>
  <td><br><input type="button" value="Submit"
        onClick="validate(this.form)"></td>
</tr>
</table>
</form>

<%@ include file="/includes/footer.jsp" %>