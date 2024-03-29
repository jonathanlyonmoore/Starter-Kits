<%@ Page language="C#" %>

<%--

   The Logoff page is responsible for signing out a user from the cookie authentication, and
   then redirecting the user back to the portal home page.  This page is executed when the user
   clicks the Logoff button at the top of the page.

--%>

<script runat=server>

    void Page_Load(Object sender, EventArgs e) {

        // Log User Off from Cookie Authentication System
        FormsAuthentication.SignOut();
      
        // Invalidate roles token
        Response.Cookies["portalroles"].Value = null;
        Response.Cookies["portalroles"].Expires = new System.DateTime(1999, 10, 12);
        Response.Cookies["portalroles"].Path = "/";
        
        // Redirect user back to the Portal Home Page
        Response.Redirect(Request.ApplicationPath);
    }

</script>