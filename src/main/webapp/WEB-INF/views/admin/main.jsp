<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
<link href="/admintemplate/css/sb-admin-2.min.css" rel="stylesheet"/>
<link href="/css/admin/main.css" rel="stylesheet"/>
<script src="/js/admin/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
</script>
<div id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
	    <!-- Sidebar -->
		<ul class="navbar-nav bg-gradient sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar T-LOG -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
			    <span class="sidebar-brand-icon rotate-n-15">
			        <i class="fas fa-laugh-wink"></i>
			    </span>
			    <span class="sidebar-brand-text mx-3">T-LOG</span>
			</a>
			
			<!-- Divider -->
			<div>
				<hr class="sidebar-divider">
				<!-- Heading -->
				<span class="sidebar-heading">게시판 및 멤버</span>
			</div>
			
			<!-- Nav Item 전체 게시판-->
			<li class="nav-item">
			    <a class="nav-link" href="/admin/main">
			        <i class="fas fa-fw fa-cog"></i>
			        <span>전체 게시판</span>
			    </a>
			</li>
		
			<!-- Nav Item 회원 게시판-->
			<li class="nav-item">
			    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
			        aria-expanded="true" aria-controls="collapseUtilities">
			        <i class="fas fa-fw fa-wrench"></i>
			        <span>회원 게시판</span>
			    </a>
			    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
			        data-parent="#accordionSidebar">
			        <div class="bg-white py-2 collapse-inner rounded">
			            <a class="collapse-item" href="/admin/allMemberList">전체 회원</a>
			        </div>
			    </div>
			</li>
	
			<!-- Divider -->
		    <hr class="sidebar-divider d-none d-md-block">
		</ul>
		<!-- End of Sidebar -->
	
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column"><!-- end div tag xx -->
			<!-- Topbar -->
			<div class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				 <!-- Topbar Navbar -->
				 <ul class="navbar-nav ml-auto">
			     <!-- Nav Item - Search Dropdown (Visible Only XS) -->
					 <li class="nav-item dropdown no-arrow d-sm-none">
					         <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
					             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					             <i class="fas fa-search fa-fw"></i>
					         </a>
					 </li>
					 <!-- 관리자 이름 옆에 작대기 -->
				     <span class="topbar-divider d-none d-sm-block"></span>
					 <!-- Nav Item - 관리자 이름 -->
					 <li class="nav-item dropdown no-arrow">
				         <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
				             data-toggle="dropdown" aria-haspopup="true" aria-expanded="fase">
				             <span class="mr-2 d-none d-lg-inline text-gray-600 small">${userInfo.userNick}</span>
				         </a>
			         	<!-- Dropdown : logout -->
			            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
			                aria-labelledby="userDropdown">
			                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
			                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
			                    Logout
			                </a>
			            </div>
				     </li>
				 </ul><!-- End of Topbar Navbar -->
			</div>
			<!-- End of Topbar -->
			
			<!-- main page Content -->
			<main class="container-fluid">
				<!-- Page Heading -->
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">전체 게시판</h1>
				</div>
			
				<!-- Dash board 내용 -->
				<div class="row">

					<!-- 전체 게시판 게시판  -->
					<div class="col-lg-6">
						<div class="col-12 d-sm-flex align-items-centers">
							<div class="card shadow mb-4 col-12">
		                        <div class="card-header py-3">
		                            <h6 class="m-0 font-weight-bold text-primary">전체 게시판 통계</h6>
		                        </div>
		                        <div class="card-body">
		                           <input type="hidden" id="tlogTotal" value="${tlogTotal}">
		                           <input type="hidden" id="boardTotal" value="${boardTotal}">
		                           <div>
		                               <canvas id="myChart" style="margin:0 auto;"></canvas>
		                           </div>
	                            </div>
	                        	<br/>
	                   		</div>
                   		</div>
                   	</div>
                   	<br/>
                   	<!-- 전체 일기 수, 회원 수 -->
                   	<div class="col-lg-6">
                   		<!-- 전체 일기 수 -->
                   		<div class="col-12 d-sm-flex align-items-centers">
							<div class="card border-left-primary shadow h-400 py-2 col-12">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												전체 일기 수
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<c:out value="${total}"></c:out>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br/>
						<!-- 전체 회원 수 -->
						<div class="col-12 d-sm-flex align-items-centers">
							<div class="card border-left-warning  shadow h-400 py-2 col-12">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												전체 회원 수
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<c:out value="${user}"></c:out>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
                   	</div><!-- 전체 일기 수, 회원 수 끝 -->
                   	<br/>
                   	
                   	<!-- 태그 게시판 통계 -->
					<div class="card shadow mb-4 col-12">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">태그 게시판 통계</h6>
						</div>
						<div class="card-body">
							<c:forEach var="t" items="${tagInfo}">
								<input type="hidden" id="tags${t.tagNum}" name='${t.tagCount}'
									value="${t.tagName}">
							</c:forEach>
							<div class="col-6" style="float: left">
								<canvas id="tagChart" class="chart"></canvas>
							</div>
							<div class="col-6" style="float: right">
								<canvas id="tagChartAge" class="chart"></canvas>
							</div>
							<div class="col-6" style="float: left">
								<canvas id="tagChartGroup" class="chart"></canvas>
							</div>
							<div class="col-6" style="float: right">
								<canvas id="tagChartSeason" class="chart"></canvas>
							</div>
						</div>
					</div>
					<br />


					<!-- 여행일기 게시판  -->
                    <div class="card shadow mb-4 col-xl-12">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">여행 일기</h6>
                        </div>
                        <div class="card-body table-responsive">
                            <table class="table table-bordered dataTable" id="dataTable">
                            </table>
                       		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
						  	</div>
                        </div><!-- end of 테이블 -->
                    </div><!-- end of 여행일기 게시판 -->
                    
                   	<!-- 자유일기 게시판  -->
                    <div class="card shadow mb-4 col-xl-12">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">자유 일기</h6>
                        </div>
                        <div class="card-body table-responsive">
                            <table class="table table-bordered dataTable" id="boardTable">
                            </table>
                       		<div class="dataTables_info" id="boardTable_info" role="status" aria-live="polite">
						  	</div>
                        </div><!-- end of 테이블 -->
                    </div><!-- end of 자유일기 게시판 -->
                    
				</div><!-- end of row -->
			</main><!-- end of container-fluid -->
		</div><!-- End of content-wrapper(top nav포함) -->
	</div><!-- End of wrapper(side bar포함) -->
</div><!-- End of page-top -->

<%@ include file="/WEB-INF/views/admin/modal.jsp" %>