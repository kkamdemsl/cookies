<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Etape 1 : Créer un formulaire html -->
	<form action="ToDoList.jsp" method="Post">						<!-- action pour le nom de l'url -->
	<label for="Id1">Saisir un nouveau item : </label>
	<input type="text" name="monItem" id="Id1"/>    <!-- Utilité du name est -->
	<input type="submit" value="Soumettre"/>	
	</form>
	
	<br>
	
	<!--  <p>L'item saisi est : <%=request.getParameter("monItem") %></p>-->
	
	
	<!-- Etape 2 : Ajouter un item dans la liste ToDoList -->
	<%
		List<String>items = (List<String>)session.getAttribute("monToDoList");
		if(items==null){
			items = new ArrayList<String>();
			session.setAttribute("monToDoList", items);
		}
		String itemSaisi = request.getParameter("monItem");
		if(items!=null){
			items.add(itemSaisi);
		}
	%>
		
	<!-- Etape 3 : Afficher tous les items de la ToDOList à partir de l'objet session -->
	<hr>
	<h2>Item de ToDoList : </h2>
	<ol>
		<%
			for(String item : items){
				out.println("<li>"+item+"</li>");
			}
		%>	
	</ol>




</body>
</html>