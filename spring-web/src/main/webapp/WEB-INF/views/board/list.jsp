<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Data Tables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">  </li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">  </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>글번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성시간</th>
                  <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="list"> 
                <tr>
                  <td> ${list.bno }</td>
                  <td><a class="bno" href='${list.bno}'>${list.title }</a></td>
                  <td> ${list.writer}</td>
                  <td> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.regdate }"/></td>
                  <td> ${list.viewcnt }</td>
                </tr>
                </c:forEach>
                </tbody>
                                  
              </table>
              <br>
              
                <form class="form" method="get" action="board/list">
                	<input class="bno" type="hidden" name="bno"> 
					<input class="page" type="hidden" name="page"value="${pageMaker.current}">
				<div class="row">
	            <div class="col-md-6" >
		        	<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
			        	<ul class="pagination"  >
			        		<c:if test="${pageMaker.prev}"><li class="paginate_button page-item prev" id="example2_prev"> <a href="${pageMaker.start-1}" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link"><</a></li></c:if>
			                	<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="pagege">
					        		<li class='${pagege == pageMaker.current?"paginate_button page-item active":""}'><a href="${pagege}" aria-controls="example" data-dt-idx="${pagege}" tabindex="0" class="page-link">${pagege}</a></li>
						    	</c:forEach> 
			             	<c:if test="${pageMaker.next}"><li class="paginate_button page-item next" id="example2_next"> <a href="${pageMaker.end+1}" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">></a></li></c:if>
						</ul>
		         	</div>
 	          	</div>
 	          	
              
 	          	<div class="col-md-6" >
 	          		<div class="input-group mb-3">
						<select name="type" class="form-control">
							<option value="t" ${cri.type eq 't'?'selected':''}>제목</option>
							<option value="c" ${cri.type eq 'c'?'selected':''}>내용</option>
							<option value="w" ${cri.type eq 'w'?'selected':''}>작성자</option>
							<option value="tc" ${cri.type eq 'tc'?'selected':''}>내용+제목</option>
	                    </select>
	                  <!-- /btn-group -->
	                  <input type="text" class="form-control" name="keyword" id="keywordInput" value="${cri.keyword}">
	                  <span class="input-group-append">
	                    <button type="button" class="btn btn-info btn-flat searchBtn">검색</button>
	                  </span>
	                </div>
 	          	</div>

				</div>
			    </form>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
            </div>
          
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap4.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->


<script type="text/javascript">	

$(document).ready(function(e) {

	var result= '${msg}';
	
	if(result =='SUCCESS'){
		alert("작업이 처리되었습니다.");
	}
	
	/* 	페이지 클릭 */
	$(".pagination a").on("click", function(e) {
		e.preventDefault();
		$(".page").val($(this).attr("href"));
		$(".form").submit();
	})
	
	/*게시글 클릭  */
	$(".bno").on("click", function(e) {
		e.preventDefault();
 		$(".bno").val($(this).attr("href"));
		$(".form").attr("action","board/read").submit(); 
	})
	
 	$(".searchBtn").on("click", function(e) {
		e.preventDefault();
		$(".page").val("1");
		$(".form").submit();
	}) 
	

})
</script>
</body>
</html>
