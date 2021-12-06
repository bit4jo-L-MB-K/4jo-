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

</script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dokdo&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="${root}/">Home</a>
                            <a href="${root}/shop/list">Shop</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                            <c:forTokens var="pp" items="${dto.pro_photo }" delims="," begin="0" end="4" varStatus="sts"> 
                            	<c:choose>    
                            		<c:when test="${sts.count==1 }">                             	
                                		 <a class="nav-link active" data-toggle="tab" href="#tabs-${sts.count }" role="tab">
                                   		 	<div class="product__thumb__pic set-bg" data-setbg="../photo/${pp}"></div> 
                               	   		 </a>
                                	</c:when>
                                	<c:otherwise>
                                	 	 <a class="nav-link " data-toggle="tab" href="#tabs-${sts.count }" role="tab">
                                     		<div class="product__thumb__pic set-bg" data-setbg="../photo/${pp}"></div> 
                               		     </a>
                                	</c:otherwise>
                                </c:choose>
                                <br>
                            </c:forTokens>                           
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">                     
                           <c:forTokens var="pp" items="${dto.pro_photo }" delims=","  begin="0" end="4" varStatus="sts">
							   <c:choose>
							   		<c:when test="${sts.count==1 }">
										<div class="tab-pane active" id="tabs-${sts.count }" role="tabpanel">
											<div class="product__details__pic__item">
                                    			<img src="../photo/${pp}" alt="">
                                			</div>                               
	                            		</div>	
	                                </c:when>
		                            <c:otherwise>
		                            		<div class="tab-pane" id="tabs-${sts.count }" role="tabpanel">
												<div class="product__details__pic__item">
	                                    			<img src="../photo/${pp}" alt="">
	                                			</div>                               
		                           		    </div>	
		                            </c:otherwise>
	                            </c:choose>                                                         
							</c:forTokens>
                                                                                                        
                        </div>                       
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${dto.pro_name }</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3><fmt:formatNumber value="${dto.price}" pattern="#,###,###"/> ￦</h3>
                            <p>${dto.pro_content }</p>
                            <p>조회수 : ${dto.readcount }</p>
                            <!--  <p>${dto2.color }</p>--><p>색깔 :</p>
                             <c:forEach var="po" items="${list2}">
                           			 
                           			 <p>${po.color }</p>
                           			 
                            	</c:forEach>
                           
                            
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Size:</span>
                                    <label for="s">S
                                        <input type="radio" id="s">
                                    </label>
                                    <label class="active" for="m">M
                                        <input type="radio" id="m">
                                    </label>
                                    <label for="l">L
                                        <input type="radio" id="l">
                                    </label>
                                   
                                </div>
                                <div class="product__details__option__color">
                                    <span>Color: </span>
                                    	<c:forEach var="po" items="${list2}">
                                    		<span id="colorbox" style="border:3px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${po.color}; float: right; margrin-right:5px;" >
                           						        			 
              
              
                                			</span>
                            			</c:forEach>
                                </div>
                            </div>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                                <a href="#" class="primary-btn">add to cart</a>
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="${root}/img/shop-details/details-payment.png" alt="">
                                <ul>
                                    <li><span>아이템 코드:</span> ${dto.pro_id }</li>
                                    <li><span>분류:</span> ${dto.pro_sub }</li>
                                    <li><span>Tag:</span> Clothes, Skin, Body</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Customer
                                    Previews(5)</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">Additional
                                    information</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                                            solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis
                                            ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo
                                        pharetras loremos.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                            a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                            $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                            worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                            a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                            $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                            worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                                            solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis
                                            ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo
                                        pharetras loremos.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                            a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                            $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                            worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
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
                                        <label for="pc-4">
                                            <input type="radio" id="pc-4">
                                        </label>
                                        <label class="active black" for="pc-5">
                                            <input type="radio" id="pc-5">
                                        </label>
                                        <label class="grey" for="pc-6">
                                            <input type="radio" id="pc-6">
                                        </label>
                                    </div>
                                
                                </div>
                            </div>
                        </div>
                    
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Section End -->
</body>
</html>