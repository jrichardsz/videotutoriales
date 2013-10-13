<%@ include file="../imports.jsp"%>

<%@page import="org.openxava.web.Actions"%>
<%@page import="org.openxava.web.Ids"%>
<%@page import="org.openxava.model.meta.MetaProperty"%>
<%@page import="org.openxava.tab.Tab"%>

<jsp:useBean id="style" class="org.openxava.web.style.Style" scope="request"/>

<%
String comparator = request.getParameter("comparator");
String prefix = request.getParameter("prefix");
if (prefix == null) prefix = "";
boolean isString = "true".equals(request.getParameter("isString"));
boolean isDate = "true".equals(request.getParameter("isDate"));
boolean isEmpty = "true".equals(request.getParameter("isEmpty"));
String eq = Tab.EQ_COMPARATOR.equals(comparator)?"selected='selected'":"";
String ne = Tab.NE_COMPARATOR.equals(comparator)?"selected='selected'":"";
String ge = Tab.GE_COMPARATOR.equals(comparator)?"selected='selected'":"";
String le = Tab.LE_COMPARATOR.equals(comparator)?"selected='selected'":"";
String gt = Tab.GT_COMPARATOR.equals(comparator)?"selected='selected'":"";
String lt = Tab.LT_COMPARATOR.equals(comparator)?"selected='selected'":"";
String startsWith = Tab.STARTS_COMPARATOR.equals(comparator)?"selected='selected'":"";
String contains = Tab.CONTAINS_COMPARATOR.equals(comparator)?"selected='selected'":"";
String endsWith = Tab.ENDS_COMPARATOR.equals(comparator)?"selected='selected'":""; 
String notContains = Tab.NOT_CONTAINS_COMPARATOR.equals(comparator)?"selected='selected'":"";
String year = Tab.YEAR_COMPARATOR.equals(comparator)?"selected='selected'":"";
String month = Tab.MONTH_COMPARATOR.equals(comparator)?"selected='selected'":"";
String yearMonth = Tab.YEAR_MONTH_COMPARATOR.equals(comparator)?"selected='selected'":"";
String range = Tab.RANGE_COMPARATOR.equals(comparator)?"selected='selected'":"";
String idConditionValue = request.getParameter("idConditionValue");
String idConditionValueTo = request.getParameter("idConditionValueTo");
String propertyKey = request.getParameter("comparatorPropertyKey"); 
String name = null;
String script = null;
if (propertyKey == null) {
	int index = Integer.parseInt(request.getParameter("index"));
	name = Ids.decorate(request, prefix + "conditionComparator." + index);
	script = Actions.getActionOnChangeComparator(name,idConditionValue,idConditionValueTo);
}
else {
	name = propertyKey;
	script = request.getParameter("script");
}
%>
<select id="<%=name%>" name="<%=name%>" class=<%=style.getEditor()%> <%=script%>>
	<% 
	if (!isEmpty) { 
	%>
	<%
	if (isString) {
	%>						
	<option value="<%=Tab.STARTS_COMPARATOR%>" <%=startsWith%>><xava:message key="<%=Tab.STARTS_COMPARATOR%>"/></option>
	<option value="<%=Tab.ENDS_COMPARATOR%>" <%=endsWith%>><xava:message key="<%=Tab.ENDS_COMPARATOR%>"/></option>
	<option value="<%=Tab.CONTAINS_COMPARATOR%>" <%=contains%>><xava:message key="<%=Tab.CONTAINS_COMPARATOR%>"/></option>	
	<option value="<%=Tab.NOT_CONTAINS_COMPARATOR%>" <%=notContains%>><xava:message key="<%=Tab.NOT_CONTAINS_COMPARATOR%>"/></option>
	<%
	}
	%>
	<option value="<%=Tab.EQ_COMPARATOR%>" <%=eq%>>=</option>
	<option value="<%=Tab.NE_COMPARATOR%>" <%=ne%>><></option>
	<option value="<%=Tab.GE_COMPARATOR%>" <%=ge%>>>=</option>
	<option value="<%=Tab.LE_COMPARATOR%>" <%=le%>><=</option>	
	<option value="<%=Tab.GT_COMPARATOR%>" <%=gt%>>></option>
	<option value="<%=Tab.LT_COMPARATOR%>" <%=lt%>><</option>
	<%
	if (isDate) {
	%>
	<option value="<%=Tab.YEAR_COMPARATOR%>" <%=year%>><xava:message key="<%=Tab.YEAR_COMPARATOR%>"/></option>
	<option value="<%=Tab.MONTH_COMPARATOR%>" <%=month%>><xava:message key="<%=Tab.MONTH_COMPARATOR%>"/></option>
	<option value="<%=Tab.YEAR_MONTH_COMPARATOR%>" <%=yearMonth%>><xava:message key="<%=Tab.YEAR_MONTH_COMPARATOR%>"/></option>
	<%
	}	
	%>
	<% 
	if (propertyKey == null) { 
	%>	
	<option value="<%=Tab.RANGE_COMPARATOR%>" <%=range%>><xava:message key="<%=Tab.RANGE_COMPARATOR%>"/></option>
	<%
	}
	%>
	<%
	} // isEmpty
	%>
</select>	
	