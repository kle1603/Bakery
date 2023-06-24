<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
        <title>Product List</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .pagination {
                margin-top: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .pagination a, .pagination strong {
                display: inline-block;
                padding: 8px 12px;
                margin-right: 5px;
                text-decoration: none;
                color: #333;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .pagination a:hover {
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <h1>Product List</h1>

        <c:if test="${not empty BREAD_LIST}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Units in Stock</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Bread Type</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bread" items="${BREAD_LIST}">
                        <tr>
                            <td>${bread.breadId}</td>
                            <td>${bread.breadName}</td>
                            <td>${bread.unitsInStock}</td>
                            <td>${bread.description}</td>
                            <td><img src="${bread.imageUrl}" alt="Product Image" height="50"></td>
                            <td>${bread.breadType}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <c:if test="${not empty BREAD_LIST}">
                <!-- Hiển thị danh sách sản phẩm -->

                <!-- Hiển thị nút chuyển trang -->
                <c:if test="${TOTAL_PAGES > 1}">
                    <div class="pagination">
                        <c:if test="${CURRENT_PAGE > 1}">
                            <a href="ProductController?page=${CURRENT_PAGE - 1}">&laquo; Previous</a>
                        </c:if>
                        <c:forEach var="pageNum" begin="1" end="${TOTAL_PAGES}">
                            <c:choose>
                                <c:when test="${pageNum == CURRENT_PAGE}">
                                    <strong>${pageNum}</strong>
                                </c:when>
                                <c:otherwise>
                                    <a href="ProductController?page=${pageNum}">${pageNum}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${CURRENT_PAGE < TOTAL_PAGES}">
                            <a href="ProductController?page=${CURRENT_PAGE + 1}">Next &raquo;</a>
                        </c:if>
                    </div>
                </c:if>
            </c:if>

            <a href="index.jsp">Home</a>
        </c:if>

        <c:if test="${empty BREAD_LIST}">
            <p>No products found.</p>
        </c:if>

    </body>
</html>
