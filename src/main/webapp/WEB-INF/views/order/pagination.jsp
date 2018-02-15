<%--
  Created by IntelliJ IDEA.
  User: niblack
  Date: 06.02.18
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<div class="container">
    <ul class="pagination">
        <c:choose>
            <c:when test="${currentPage == 1}">
                <li class="page-item disabled"><a href="/order/page/1" class="page-link"> << </a></li>
                <li class="page-item disabled"><a href="/order/page/1" class="page-link"> < </a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a href="/order/page/1" class="page-link"> << </a></li>
                <li class="page-item"><a href="/order/page/${currentPage-1}" class="page-link"> < </a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="${paginationStart}" end="${paginationEnd}">
            <c:url var="pageUrl" value="/order/page/${i}" />
            <c:choose>
                <c:when test="${i == currentPage}">
                    <li class="page-item active"><a href="${pageUrl}" class="page-link"><c:out value="${i}" /></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a href="${pageUrl}" class="page-link"><c:out value="${i}" /></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${currentPage == paginationEnd}">
                <li class="page-item disabled"><a href="/order/page/${paginationEnd}" class="page-link"> > </a></li>
                <li class="page-item disabled"><a href="/order/page/${paginationEnd}" class="page-link"> >> </a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a href="/order/page/${currentPage+1}" class="page-link"> > </a></li>
                <li class="page-item"><a href="/order/page/${paginationEnd}" class="page-link"> >> </a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>