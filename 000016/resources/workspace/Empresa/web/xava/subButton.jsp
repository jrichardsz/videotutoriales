<%@page import="org.openxava.web.Ids"%>
<%@page import="org.openxava.util.Labels"%>
<%@page import="java.util.Collection"%>
<%@page import="org.openxava.controller.meta.MetaAction"%>
<%@page import="org.openxava.controller.meta.MetaController"%>
<%@page import="org.openxava.controller.meta.MetaControllers"%>
<%@page import="org.openxava.controller.meta.MetaSubcontroller"%>

<%@ include file="imports.jsp"%>

<jsp:useBean id="style" class="org.openxava.web.style.Style" scope="request"/>

<%
String controllerName = request.getParameter("controller");
String image = request.getParameter("image");
String id = Ids.decorate(request, "sc-" + controllerName);
String idContainer = Ids.decorate(request, "sc-container-" + controllerName);
String idButton = Ids.decorate(request, "sc-button-" + controllerName);
String idImage = Ids.decorate(request, "sc-image-" + controllerName);
String idA = Ids.decorate(request, "sc-a-" + controllerName);
%>
<span id='<%=idContainer%>'>
	<span id='<%=idButton%>' class="<%=style.getButtonBarButton()%>">
		<a 
			id ='<%=idA%>' 
			onclick="openxava.subcontroller('<%=id%>','<%=idContainer%>','<%=idButton%>','<%=idImage%>','<%=idA%>');return false;" 
			href=""
			>
			<span style="padding:4px; background: url(<%=request.getContextPath()%>/<%=style.getImagesFolder()%>/<%=image%>) no-repeat 5px 50%;">				
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			</span>		
			<%= Labels.get(controllerName)%>
			<img  
				id='<%=idImage%>' 
				src='<%=request.getContextPath()%>/<%=style.getImagesFolder()%>/ascending3.gif'/>
			
		</a>
	</span>
	
	<div id="<%=id%>" class="<%=style.getSubcontroller()%>" style="display:none;">
		<table>
		<%
		MetaController controller = MetaControllers.getMetaController(controllerName);
		Collection<MetaAction> actions = controller.getMetaActions();
		
		for (MetaAction action : actions){
		%>	
			<tr><td>
				<jsp:include page="barButton.jsp">
					<jsp:param name="action" value="<%=action.getQualifiedName()%>"/>
					<jsp:param name="addSpaceWithoutImage" value="true"/>
				</jsp:include>
			</td></tr>
		<%
		}
		%>
		</table>
	</div>
</span>	