<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>View an Idea</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${contextPath}/resources/images/favicon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/view_ideas.css">
    <script type="application/javascript">
        function handleEdit(id) {
            location.href = "${contextPath}/Ideas/edit/" + id;
        }
    </script>
</head>
<body>
<jsp:include page="${contextPath}/${role}/header.jsp"></jsp:include>
<div class="myDiv">
    <div class="bg"></div>
        <div class="container">
            <div class="product-display">
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <h2>${Idea.name}</h2>
                                <p class="category">${Idea.category}</p>
                                <img class="img-responsive img-centered" src="${Idea.image}" alt="Image">
                                <p>${Idea.description}</p>
                                <ul class="list-inline">
                                    <li>Funds Required: $ ${Idea.fundsRequired}</li>
                                    <li>Collected Funds: $ ${Idea.collectedFunds}</li>
                                    <li>Sub-Category: ${Idea.subCategory}</li>
                                </ul>
                                <button type="button" class="btn btn-primary" onclick="history.back()"><i class="glyphicon glyphicon-arrow-left"></i> Back</button>
                                <c:if test="${role == \"entrepreneur\"}">
                                    <button type="button" class="btn btn-primary edit-button" onclick="handleEdit(${Idea.id})"><i class="glyphicon glyphicon-edit"></i> Edit</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="footer">
        <jsp:include page="${contextPath}/templates/footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
