<%--
 Copyright 2006 Sun Microsystems, Inc. All rights reserved.
 Use is subject to license terms.
--%>

<%@page contentType="text/html"%>

<HTML>
<HEAD><TITLE>Cluster - Ha JSP Sample </TITLE></HEAD>
<BODY BGCOLOR="white">
<H1>Cluster - HA JSP Sample </H1>
<B>HttpSession Information:</B>
<UL>
<LI>Served From Server:   <b><%= request.getServerName() %></b></LI>
<LI>Server Port Number:   <b><%= request.getServerPort() %></b></LI>
<LI>Server Port Number(local):   <b><%= request.getLocalPort() %></b></LI>
<LI>Executed From Server: <b><%= java.net.InetAddress.getLocalHost().getHostName() %></b></LI>
<LI>Served From Server instance: <b><%= System.getProperty("com.sun.aas.instanceName") %></b></LI>
<LI>Executed Server IP Address: <b><%= java.net.InetAddress.getLocalHost().getHostAddress() %></b></LI>
<LI>Session ID:    <b><%= session.getId() %></b></LI>
<LI>Session Created:  <%= new java.util.Date(session.getCreationTime())%></LI>
<LI>Last Accessed:    <%= new java.util.Date(session.getLastAccessedTime())%></LI>
<LI>Session will go inactive in  <b><%= session.getMaxInactiveInterval() %> seconds</b></LI>
</UL>
<BR>
<B> Enter session attribute data: </B><BR>
<FORM ACTION="session.jsp" METHOD="POST" NAME="Form1">
    Name of Session Attribute: 
    <INPUT TYPE="text" SIZE="20" NAME="dataName">
    <BR>
    Value of Sesion Attribute: 
    <INPUT TYPE="text" SIZE="20" NAME="dataValue">
    <BR>
    <INPUT TYPE="submit" NAME="action" VALUE="ADD SESSION DATA">
    <INPUT TYPE="submit" NAME="action" VALUE="RELOAD PAGE">
</FORM>
<FORM ACTION="ClearSession.jsp" method="POST" name="Form2" >
    <INPUT TYPE="submit" NAME="action" VALUE="CLEAR SESSION">
</FORM>

<%
    String dataname = request.getParameter("dataName");
    String datavalue = request.getParameter("dataValue");
    if (dataname != null && datavalue != null && !dataname.equals("")) {
        System.out.println("Add to session: " + dataname + " = " + datavalue);
        session.setAttribute(dataname,datavalue);
    }
%>
<HR><BR>
<B>Data retrieved from the HttpSession: </B>
<% 
    java.util.Enumeration valueNames = session.getAttributeNames();
    if (!valueNames.hasMoreElements()) {
        System.out.println("No parameter entered for this request");
    } else {
        out.println("<UL>");
        while (valueNames.hasMoreElements()) {
            String param = (String) valueNames.nextElement();
            String value = session.getAttribute(param).toString();
            out.println("<LI>" + param + " = " + value + "</LI>");
        }
        out.println("</UL>");
    }
%>
<BR><BR>
<HR>
<B>INSTRUCTIONS</B>
<UL>
<LI>Add session data using the form. Upon pressing ADD SESSION DATA, the current session data will be listed.</LI>
<LI>Click on RELOAD PAGE to display the current session data without adding new data.</LI>
<LI>Click on CLEAR SESSION to invalidate the current session.</LI>
</UL>

</BODY>
</HTML>
