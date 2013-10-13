<%@ page import="org.openxava.model.meta.MetaProperty" %>

<jsp:useBean id="style" class="org.openxava.web.style.Style" scope="request"/>
  
 <%
String propertyKey = request.getParameter("propertyKey");
MetaProperty p = (MetaProperty) request.getAttribute(propertyKey);
String fvalue = (String) request.getAttribute(propertyKey + ".fvalue");
String align = p.isNumber()?"right":"left";
boolean editable="true".equals(request.getParameter("editable"));
String disabled=editable?"":"disabled";
String script = request.getParameter("script");
boolean label = org.openxava.util.XavaPreferences.getInstance().isReadOnlyAsLabel();
if (editable || !label) {
%>
<input type="text" name="<%=propertyKey%>" id="<%=propertyKey%>" class=<%=style.getEditor()%> title="<%=p.getDescription(request)%>"
	tabindex="1" 
	align='<%=align%>'
	maxlength="19" 
	size="19"  	
	value="<%=fvalue%>"
	<%=disabled%>
	<%=script%>><%if (editable) {%><a href="javascript:showCalendar('<%=propertyKey%>', '<%=org.openxava.util.Dates.dateTimeFormatForJSCalendar(org.openxava.util.Locales.getCurrent())%>', '12')"><img	
	src="<%=request.getContextPath() %>/xava/images/calendar.gif" alt="..."
	style='vertical-align: middle;'/></a><%} %>		
<%

} else {
%>
<%=fvalue%>&nbsp;	
<%
}
%>
<% if (!editable) { %>
	<input type="hidden" name="<%=propertyKey%>" value="<%=fvalue%>">
<% } %>			
