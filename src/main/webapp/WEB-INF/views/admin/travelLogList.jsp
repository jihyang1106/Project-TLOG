<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Custom fonts for this template-->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
<link href="/admintemplate/css/sb-admin-2.min.css" rel="stylesheet"/>
<link href="/css/admin/main.css" rel="stylesheet"/>
<script src="/js/admin/main.js"></script>

<div id="page-top"><!-- end div tag xx -->
	<!-- Page Wrapper -->
	<div id="wrapper"><!-- end div tag xx -->
	    <!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
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
			            <a class="collapse-item" href="/admin/reportMemberList">블랙 리스트</a>
			        </div>
			    </div>
			</li>
		
			<!-- Nav Item 신고관리 -->
			<li class="nav-item">
			    <a class="nav-link" href="/admin/reportList">
			        <i class="fas fa-fw fa-chart-area"></i>
			        <span>신고관리</span></a>
			</li>
	
			<!-- Divider -->
		    <hr class="sidebar-divider d-none d-md-block">
		</ul>
		<!-- End of Sidebar -->
	
		<!-- Content Wrapper (검색창) -->
		<div id="content-wrapper" class="d-flex flex-column"><!-- end div tag xx -->
			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>
		
				<!-- Topbar Search (검색 버튼) -->
				<form
				   class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
				    	<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
				             aria-label="Search" aria-describedby="basic-addon2">
				         <div class="input-group-append">
				             <button class="btn btn-primary" type="button">
				                 <i class="fas fa-search fa-sm"></i>
				             </button>
				         </div>
				     </div>
				 </form>
		
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
				             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				             <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자 이름</span>
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
			</nav>
			<!-- End of Topbar -->
			
			<!-- main page Content -->
			<main class="container-fluid">
				<!-- Page Heading -->
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">여행 일기</h1>
				</div>
			
				<!-- Dash board 내용 -->
				<div class="row">
					<!-- 전체 게시판  -->
                    <div class="card shadow mb-4 col-xl-12">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">전체 게시판</h6>
                        </div>
                        <div class="card-body table-responsive">
                       		<div class="col-sm-12">
                        		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                        			Showing 1 to 10 of 57 entries
                        		</div>
                        	</div>
                        	<br/>
                            <table class="table table-bordered" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>BoardNo.</th>
                                        <th>Content</th>
                                        <th>Date</th>
                                        <th>UserNo.</th>
                                        <th>Nickname</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>3</td>
                                        <td>ㅇㄹㄴㅇㄹㄴㅇㄻ내댜러매ㅓㅈ대ㅑㅓ매더래먀더랴ㅐㅓ대러ㅐㅁㄴㄷ럼ㄷㄴ래ㅜ누래ㅑㅁ둔루대눌먇</td>
                                        <td>2022.06.01</td>
                                        <td>61</td>
                                        <td>방랑자</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>ㄴㅇㄹ머냉러ㅐㅁㄴ러맨야러맺댠루매ㅑㄷ주램ㄷ누랴ㅐㅜㅁㄹㄷ재ㅜ랟누루ㅐㅈ도랴ㅐㅁ대랴ㅜ대ㅑ루맫누ㅜㄹ매ㅑㄷ주</td>
                                        <td>2022.06.03</td>
                                        <td>46</td>
                                        <td>비트위의 나그네</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- end of 테이블 -->
                    </div><!-- end of 전체 게시판 -->
				</div><!-- end of row -->
			</main><!-- end of container-fluid -->
		</div><!-- End of content-wrapper(top nav포함) -->
	</div><!-- End of wrapper(side bar포함) -->
</div><!-- End of page-top -->

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            	로그아웃 하시려면 로그아웃버튼을 눌러주세요.
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <a class="btn btn-primary" href="#">로그아웃</a>
            </div>
        </div>
    </div>
</div>