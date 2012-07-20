<HTML>
<HEAD><TITLE>Cluster - Ha JSP Sample </TITLE></HEAD>
<BODY>

<% String action = request.getParameter("action");
   if (action != null && action.equals("CLEAR SESSION")) {
        session.invalidate();
   }
%>
<BR><BR><BR>
Served From Server: <b><%= request.getServerName() %></b>

<BR><BR>
<B>Instruction</B>
<UL>
<LI>Click on START NEW SESSION to start a new session</LI>
</UL>
<BR>
<A HREF="session.jsp" NAME="Link3">START NEW SESSION</A>
</BODY>
</HTML>
