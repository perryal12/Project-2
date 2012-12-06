package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserIO;

public class AddToEmailListServlet extends HttpServlet
{    
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException
    {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");

        User user = new User(firstName, lastName, emailAddress);

        String message = "";
        String url = "";
        if (firstName.length() == 0 || 
            lastName.length() == 0  ||
            emailAddress.length() == 0)
        {
            message = "Please fill out all three text boxes.";
            url = "/join_email_list.jsp";
        }
        else
        {
            message = "";

            ServletConfig config = this.getServletConfig();
            String relativePath = config.getInitParameter("relativePathToFile");

            ServletContext context = getServletContext();
            String path = context.getRealPath(relativePath);
            UserIO.addRecord(user, path);

            String custServEmail = context.getInitParameter("custServEmail");
            System.out.println("custServEmail: " + custServEmail);

            url = "/display_email_entry.jsp";
        }
        request.setAttribute("user", user);
        request.setAttribute("message", message);

        RequestDispatcher dispatcher =
             getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);        
    }    
}
