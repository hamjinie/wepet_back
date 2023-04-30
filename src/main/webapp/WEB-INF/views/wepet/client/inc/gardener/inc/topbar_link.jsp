<%@ page language="java" contentType="text/html;charset=UTF-8"%>

 <%@page import="com.edu.wepet.domain.Member"%>
<div class="container-fluid bg-dark text-light px-0 py-2">
            <div class="row gx-0 d-none d-lg-flex">
                <div class="col-lg-7 px-5 text-start">
                    <div class="h-100 d-inline-flex align-items-center me-4">
                        <span class="fa fa-phone-alt me-2"></span>
                        <span></span>
                    </div>
                    <div class="h-100 d-inline-flex align-items-center">
                        <span class="far fa-envelope me-2"></span>
                        <span></span>
                    </div>
                </div>
                <div class="col-lg-5 px-5 text-end">
                    <div class="h-100 d-inline-flex align-items-center mx-n2">

       					<%if(session.getAttribute("member")==null){%>
                        </div>
                        <a>|</a>
                        <a class="btn btn-link text-light" href="/member/loginform">로그인</a>
                        <a>|</a>
                        <a class="btn btn-link text-light" href="/member/loginform">회원가입</a>
                        <a>|</a>
                            <%}else{%>
                            <%
                                Member member=(Member)session.getAttribute("member");
                            %>
                                <a href="/member/logout">logout</a>
                            <%} %>
                    </div>
                </div>
            </div>
        </div>
        
