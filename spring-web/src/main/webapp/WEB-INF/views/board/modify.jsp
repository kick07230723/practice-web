<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <style>
    .color-palette {
      height: 35px;
      line-height: 35px;
      text-align: center;
    }

    .color-palette-set {
      margin-bottom: 15px;
    }

    .color-palette span {
      display: none;
      font-size: 12px;
    }

    .color-palette:hover span {
      display: block;
    }

    .color-palette-box h4 {
      position: absolute;
      top: 100%;
      left: 25px;
      margin-top: -40px;
      color: rgba(255, 255, 255, 0.8);
      font-size: 12px;
      display: block;
      z-index: 7;
    }
  </style>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>상세페이지</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Inline Charts</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- COLOR PALETTE -->
        <!-- /.card -->
        <!-- END ALERTS AND CALLOUTS -->

        <!-- START TYPOGRAPHY -->
        <h5 class="mt-4 mb-2"><번호 : ${list.bno}></h5>
        <!-- /.row -->

        <div class="row">
        

          <!-- ./col -->
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                        <div class="card card-default">
              <div class="card-header">
                <h3 class="card-title">게시물을 수정합니다</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              

			<form class="form" action="/jun/board/listAll" method="get">
	          	<input type="hidden" name="bno" value="${list.bno}">
                <div class="card-body">
	                  <div class="form-group">
	                    <label for="exampleInputEmail1">제목</label>
	                    <input type="content" class="form-control" name="title" value="${list.title}">
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">작성자</label>
	                    <input type="content" class="form-control" name="writer" value="${list.writer}">
	                  </div>
					<div class="form-group">
		 				<label>내용</label>
		                <textarea name="content" class="form-control textarea" rows="10">${list.content}</textarea>
					</div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">저장</button>
                  <button type="submit" class="btn btn-danger">취소</button>
                </div>
              </form>
            </div>

              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            
            
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- END TYPOGRAPHY -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/dist/js/demo.js"></script>
</body>
</html>

<script type="text/javascript">

$(document).ready(function(e) {
	
	
	/* 	수정 저장하기*/
	$(".btn-primary").on("click", function(e){
		e.preventDefault();
		$(".form").attr("action","/jun/board/modify").attr("method","post").submit();
	});
	
	
	/* 	취소하고, 목록으로 */
	$(".btn-danger").on("click", function(e){
		e.preventDefault();
		$(".form").submit();
	});

	
	
})

</script>