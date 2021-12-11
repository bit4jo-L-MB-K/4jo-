<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//상단 분류셀렉트박스 함수
$(function () {
	$("select.selectsort").change(function () {
	      var s=$(this).val();         
	      if(s=="rec"){	    	 
	          $(".seltb").hide();
	          $("#t1").show();
	          localStorage.save="t1";         
	        }else if(s=="lowpri"){        	
	          $(".seltb").hide();
	          $("#t2").show();
	          localStorage.save="t2";     	 
	        }else if(s=="highpri"){        	
	          $(".seltb").hide();
	          $("#t3").show();
	          localStorage.save="t3";     	 
	        }	      
	      });	   
	   var t=localStorage.save;
	   
	   if(t=="t1"){
		  
	      $(".seltb").hide();
	      $("#t1").show();   
	   } else if(t=="t2"){
		  
	      $(".seltb").hide();
	      $("#t2").show();
	   } else if(t=="t3"){
		  
	      $(".seltb").hide();
	      $("#t3").show();
	   }
	   $(".shop__sidebar__color label").click(function(){
		   //alert("1");
		   $(".shop__sidebar__color label").css("border","1px solid black");
		   $(this).css("border","3px solid #288cff");
		   
	   });   
	   
});
</script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dokdo&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">	
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                    
                        <div class="shop__sidebar__search">
                            <form action="search" method="get">
                                <input name="keyword" type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                        	<form action="category" method="get">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse show" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                                              
                                                    <li>
                                                    	<a href="${root}/shop/list">전체</a>
                                                    </li>
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="긴팔" id="pro_sub">
                                                    	<a href="${root}/shop/category?pro_sub=긴팔">긴팔</a>
                                                    </li>
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="반팔">
                                                    	<a href="${root}/shop/category?pro_sub=반팔">반팔</a>
                                                    </li>
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="바지">
                                                    	<a href="${root}/shop/category?pro_sub=바지">바지</a>
                                                    </li> 
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="스커트">
                                                    	<a href="${root}/shop/category?pro_sub=스커트">스커트</a>
                                                    </li>                                              
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="패딩">
                                                    	<a href="${root}/shop/category?pro_sub=패딩">패딩</a>
                                                    </li>
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="코트">
                                                    	<a href="${root}/shop/category?pro_sub=코트">코트</a>
                                                    </li>
                                                    <li>
                                                    	 <input type="radio" name="pro_sub" value="신발">
                                                    	<a href="${root}/shop/category?pro_sub=신발">신발</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse show" data-target="#collapseThree">Filter Price</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                
                                                    <li>
                                                    	 <input type="radio" name="price_n" value="1">
                                                    	 <a href="${root}/shop/pricesort?price_n=1">~ 10,000￦</a>	
                                                    </li>
                                                    <li>
                                                   		 <input type="radio" name="price_n" value="2">
                                                   		 <a href="${root}/shop/pricesort?price_n=2">10,001￦ - 30,000￦</a>
                                                    </li>
                                                    <li>
                                                    	 <input type="radio" name="price_n" value="3">
                                                    	 <a href="${root}/shop/pricesort?price_n=3">30,001￦ - 50,000￦</a>
                                                    </li>
                                                    <li> 
                                                    	 <input type="radio" name="price_n" value="4">
                                                   		 <a href="${root}/shop/pricesort?price_n=4">50,001￦ - 100,000￦</a>
                                                    </li>
                                                    <li> 
                                                         <input type="radio" name="price_n" value="5">
                                                    	 <a href="${root}/shop/pricesort?price_n=5">100,001￦ ~</a>
                                                    </li>
                                               
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse show" data-target="#collapseFive">Colors</a>
                                    </div>
                                    <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__color">
                                                <label class="c-1"  for="sp-1">
                                                    <input type="radio" name="color" value="202020" id="sp-1">
                                                </label>
                                                <label class="c-2" for="sp-2">
                                                    <input type="radio" name="color" value="F6F6F6" id="sp-2">
                                                </label>
                                                <label class="c-3" for="sp-3">
                                                    <input type="radio" name="color" value="cd1039" id="sp-3">
                                                </label>
                                                <label class="c-4" for="sp-4">
                                                    <input type="radio" name="color" value="F5F5DC" id="sp-4">
                                                </label>                                         
                                                <label class="c-5" for="sp-5">
                                                    <input type="radio" name="color" value="006400" id="sp-5">
                                                </label>                                         
                                                <label class="c-6" for="sp-6">
                                                    <input type="radio" name="color" value="323c73" id="sp-6">
                                                </label>
                                                <label class="c-7" for="sp-7">
                                                    <input type="radio" name="color" value="505050;" id="sp-7">
                                                </label>
                                                <label class="c-8" for="sp-8">
                                                    <input type="radio" name="color" value="aaaaaa" id="sp-8">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse show" data-target="#collapseSix">Tags</a>
                                    </div>
                                    <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__tags">
                                                <a href="#">Product</a>
                                                <a href="#">Bags</a>
                                                <a href="#">Shoes</a>
                                                <a href="#">Fashion</a>
                                                <a href="#">Clothing</a>
                                                <a href="#">Hats</a>
                                                <a href="#">Accessories</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <input type="submit" value="Search" style="font-weight:bold;  background-color: white; color: black; text-align: center; margin-top:40px; margin-left: 50px; width: 100px; ">
                        </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                	<!-- 총 갯수중 12개! -->
                                    <p>Showing 1–12 of ${totalCount } results</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by :</p>
                                    <select class="selectsort">
                                        <option value="rec">신상품 순</option>
                                        <option value="highpri">가격 높은 순</option>
                                        <option value="lowpri">가격 낮은 순</option>
                                        <option value="">상품평 많은 순</option>
                                        <option value="">평점 많은 순</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /////////////최신순 리스트/////////////// -->
                    <div class="row seltb" id="t1">
                    		
                      <c:forEach var="p" items="${list}">     
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            	<c:choose>
                            		<c:when test="${fn:substringBefore(p.pro_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${fn:substringBefore(p.pro_photo,',')}">
                                    		<ul class="product__hover">
                                        		<li><a href="#"><img src="${root}/img/icon/heart.png" alt=""></a></li>
                                        		<li><a href="#"><img src="${root}/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                       		    </li>
                                        		<li><a href="${root}/shop/details?idx=${p.idx}&currentPage=${currentPage}&pro_id=${p.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${p.pro_photo}">
                                    		<ul class="product__hover">
                                        		<li><a href="#"><img src="${root}/img/icon/heart.png" alt=""></a></li>
                                        		<li><a href="#"><img src="${root}/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                       		    </li>
                                        		<li><a href="${root}/shop/details?idx=${p.idx}&currentPage=${currentPage}&pro_id=${p.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>                		
                                	</c:otherwise>
                                </c:choose>
                                
                                <div class="product__item__text">      
                                    <h6>${p.pro_name}</h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5><fmt:formatNumber value="${p.price}" pattern="#,###,###"/> ￦ </h5>
                                    
                                    <div class="product__color__select">
                                        <c:forEach var="c" items="${list5}">                                 
                              			<c:if test="${p.pro_id==c.pro_id}">
                              				<div style="float: left;">
                                 				 <span id="colorbox" style="border:2px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${c.color}; float: right; margin-right:5px;" ></span>   
                              				</div> 	
                             	 	    </c:if>          
                                    </c:forEach>      
                                    </div>                                                       
                                </div>
                            </div>
                        </div>       
                </c:forEach>
                </div>
                <!-- //////////////낮은순 가격 리스트///////////////// -->
                <div class="row seltb" id="t2"  style="display:none;">               	
                       <c:forEach var="p2" items="${list2}">     
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            <c:choose>
                            		<c:when test="${fn:substringBefore(p2.pro_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${fn:substringBefore(p2.pro_photo,',')}">
                                    		<ul class="product__hover">
                                        		<li><a href="#"><img src="${root}/img/icon/heart.png" alt=""></a></li>
                                        		<li><a href="#"><img src="${root}/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                       		    </li>
                                        		<li><a href="${root}/shop/details?idx=${p2.idx}&currentPage=${currentPage}&pro_id=${p2.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${p2.pro_photo}">
                                    		<ul class="product__hover">
                                        		<li><a href="#"><img src="${root}/img/icon/heart.png" alt=""></a></li>
                                        		<li><a href="#"><img src="${root}/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                       		    </li>
                                        		<li><a href="${root}/shop/details?idx=${p2.idx}&currentPage=${currentPage}&pro_id=${p2.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>                		
                                	</c:otherwise>
                                </c:choose>
                                
                                <div class="product__item__text">      
                                    <h6>${p2.pro_name}</h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5><fmt:formatNumber value="${p2.price}" pattern="#,###,###"/> ￦ </h5>
                                     <div class="product__color__select">
                                        <c:forEach var="c" items="${list5}">                                 
                              			<c:if test="${p2.pro_id==c.pro_id}">
                              				<div style="float: left;">
                                 				 <span id="colorbox" style="border:2px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${c.color}; float: right; margin-right:5px;" ></span>   
                              				</div> 	
                             	 	    </c:if>          
                                    </c:forEach>      
                                    </div>                                  
                                </div>
                            </div>
                        </div>       
                </c:forEach>
                </div>
                <!-- //////////////높은순 가격 리스트//////////// -->
                <div class="row seltb" id="t3"  style="display:none;">               	
                       <c:forEach var="p3" items="${list3}">     
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            <c:choose>
                            		<c:when test="${fn:substringBefore(p3.pro_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${fn:substringBefore(p3.pro_photo,',')}">
                                    		<ul class="product__hover">
                                        		<li><a href="#"><img src="${root}/img/icon/heart.png" alt=""></a></li>
                                        		<li><a href="#"><img src="${root}/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                       		    </li>
                                        		<li><a href="${root}/shop/details?idx=${p3.idx}&currentPage=${currentPage}&pro_id=${p3.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${p3.pro_photo}">
                                    		<ul class="product__hover">
                                        		<li><a href="#"><img src="${root}/img/icon/heart.png" alt=""></a></li>
                                        		<li><a href="#"><img src="${root}/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                       		    </li>
                                        		<li><a href="${root}/shop/details?idx=${p3.idx}&currentPage=${currentPage}&pro_id=${p3.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>                		
                                	</c:otherwise>
                                </c:choose>
                                
                                <div class="product__item__text">      
                                    <h6>${p3.pro_name}</h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5><fmt:formatNumber value="${p3.price}" pattern="#,###,###"/> ￦ </h5>
                                    <div class="product__color__select">
                                        <c:forEach var="c" items="${list5}">                                 
                              			<c:if test="${p3.pro_id==c.pro_id}">
                              				<div style="float: left;">
                                 				 <span id="colorbox" style="border:2px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${c.color}; float: right; margin-right:5px;" ></span>   
                              				</div> 	
                             	 	    </c:if>          
                                    </c:forEach>      
                                    </div>                                    
                                </div>
                            </div>
                        </div>       
                </c:forEach>
                </div>
            </div>
            
        </div>
      </div>
      
      <c:if test="${totalCount>0 }">
      <div class="row">
          <div class="col-lg-12">
             <div class="product__pagination">
             <!-- 이전 -->
             	<c:if test="${startPage>1 }">
                   <span><a href="list?currentPage=${startPage-1 }"><</a></span>
                </c:if>
                	<c:forEach var="pp" begin="${startPage }" end="${endPage }">
                		<c:if test="${currentPage==pp }">
							<span class="active"><a href="list?currentPage=${pp }">${pp }</a></span>
						</c:if>
						<c:if test="${currentPage!=pp }">
							<span><a href="list?currentPage=${pp }">${pp }</a></span>
						</c:if>
                	</c:forEach>
             <!-- 다음 -->
                <c:if test="${endPage<totalPage }">
						<span><a href="list?currentPage=${endPage+1 }">></a></span>
				</c:if>
             </div>
          </div>
      </div>
      </c:if>              
        
    </section>
    <!-- Shop Section End -->
</body>
</html>