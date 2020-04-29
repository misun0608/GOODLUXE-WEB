<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.goodluxe.voes.MemberVO" %>
<%@ page import = "java.util.StringTokenizer" %>
<%@ page import="java.util.ArrayList"%>
<% 
	MemberVO memberVO = new MemberVO(); 
	memberVO = (MemberVO)request.getAttribute("memberVO");
	System.out.println(memberVO);
	
%>




<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	
	<title>GOODLUXE :: 굿럭스</title>
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script>
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
	</script>
	
    
    <!--  my_info   -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_info.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/my_info.js"></script>
	<script>
		$(document).ready(function(){
			$("#mypage_menu").load("mypageMenu.do", function(){
				$('.menu_container').children('a').eq(7).children().children('.icon').addClass('selected_menu');
			});
		});
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function submitCheck(){
			var txtpw1;
			var txtpw2;
			txtpw1 = document.member_my_info_form.member_pw.value;
			txtpw2 = document.member_my_info_form.password2.value;
			
			
			if(!(txtpw1.length>9 && txtpw1.length<17)){
				alert("비밀번호를 10~16글자로 입력하세요.");	
				return false;
			}
			if(!(txtpw2.length>9 && txtpw2.length<17)){
				alert("비밀번호를 확인하세요.");	
				return false;
			}else if(txtpw1 != txtpw2){
				alert("비밀번호가 다릅니다");
				return false;
			}
		}
	
		//전화번호를 입력했는지 확인
		if(document.input_form.tel1.value ==""){ 
			alert("전화번호를 입력하세요!!(첫번째)");
			document.input_form.tel1.focus();
			return false;
		}
		else if(document.input_form.tel2.value ==""){ 
			alert("전화번호를 입력하세요!!(두번째)");
			document.input_form.tel2.focus();
			return false;
		}
		else if( document.input_form.tel3.value == "")
		{
			alert("전화번호를 입력하세요(세번째)");
			document.input_form.tel3.focus();
			return false;
		}
		//전부 숫자인지 확인
		else{
			var styleCheckno = /[0-9]/;
			for(i = 0 ; i<telNum.length; i++){
				ch = telNum.substring(i,i+1);
				if(styleCheckno.test(ch)==false){
					alert("숫자만 사용가능");
					return false;
				}
			}
		}
	
	
	
	
	
	</script>

</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
			<article class="arti_menu" id="mypage_menu"></article> 
		
                <h3 class = "my_info_title">▶기본정보</h3>
                <br/>
                <div class = "cancel_member_container"><a href = "#" class = "cancel_member" ><p>회원탈퇴</p></a></div>
                <form name = "member_my_info_form" action = "./myInfoAction.do" method = "post" onsubmit ="return submitCheck();">
                    <table class = "personal_info_table">
                        <tr>
                            <td>아이디</td>
                            <td><input type = "hidden" name = "member_id" value = "<%=memberVO.getMember_id() %>"><%=memberVO.getMember_id() %></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type = "password" name = "member_pw" placeholder="10~16자 이내로 입력해주세요" minlength="10" maxlength="16">
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td><input type = "password"  name = "password2"></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input type = "hidden" name = "member_name" value = "<%=memberVO.getMember_name() %>"><%=memberVO.getMember_name() %></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type = "button" value="우편번호" class = "zipcode_button" onclick="openZipSearch();">
                                <input type = "text" readonly="readonly" class = "zipcode" value = "<%= memberVO.getMember_zipcode()%>"id = "order_zipcode" name = "member_zipcode" required><br/>
                                <input type = "text" readonly="readonly" placeholder=" 기본주소" class = "addr" value = "<%= memberVO.getMember_addr1()%>" id = "order_addr1" name = "member_addr1" required><br/>
                                <input type = "text" placeholder=" 상세주소" class = "addr" value = "<%= memberVO.getMember_addr2()%>" id = "order_addr2" name = "member_addr2">
                            </td>
                        </tr>
                        <%
                        	String tel_all, tel1, tel2, tel3;
                        	tel_all = memberVO.getMember_phone();
                        	
                        	tel1 = tel_all.substring(0,3);
							tel2 = tel_all.substring(3,7);
							tel3 = tel_all.substring(7,11);
                        %>
                        <tr>
                            <td>휴대전화</td>
                            <td>
                                <input type = "tel" value = "<%=tel1%>" name = "tel1">
                                &nbsp;&nbsp;-&nbsp;&nbsp;
                                <input type = "tel" value = "<%=tel2%>"  name = "tel2">
                                &nbsp;&nbsp;-&nbsp;&nbsp;
                                <input type = "tel" value = "<%=tel3%>"  name = "tel3">
                            </td>
                        </tr>
                        <%
	                        String email_all, email1, email2;
	                    	email_all = memberVO.getMember_email();
	                    	StringTokenizer stemail = new StringTokenizer(email_all,"@");
	                    	email1 = stemail.nextToken();
	                    	email2 = stemail.nextToken();
                        %>
                        <tr>
                            <td>이메일</td>
                            <td class = "grey_letter">
                                <input type = "text" class = "email" id = "email1" value="<%=email1 %>" name = "email1"> &nbsp;&nbsp;@&nbsp;&nbsp;
                                <input type = "text"  class = "email" placeholder="    직접입력" id = "email2" readonly="readOnly"  STYLE="ime-mode: inactive" value="<%=email2 %>" name = "email2">
                                <select id = "email_select" class = "email2" name = "email_select" onchange= "emailAddr();">
                                    <option value="" selected disabled>-이메일 선택-</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="empas.com">empas.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="etc">직접입력</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일 수신 여부</td>
                            <td>
                                <input type = "radio" name = "member_email_receive" id = "agree" checked value = "Y"><label for = "agree">동의</label>
                                <input type = "radio" name = "member_email_receive" id = "disagree" value = "N"><label for = "disagree">비동의</label>
                                <p class = "smaller_grey">&nbsp;&nbsp;쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                            </td>
                        </tr>
                    </table>
                    <br/> <br/> <br/><br/><br/>
                    <h3 class = "my_info_title">▶추가정보</h3>
                    <br/><br/>
                    <table class = "additional_info_table1">
                        <tr>
                            <td>관심상품 분야</td>
                        </tr>
                        <%
	                   		String likecate = memberVO.getMember_like_category();
	                    	
                       		StringTokenizer stcate = new StringTokenizer(likecate,",");
                       	
                       		int count = stcate.countTokens();
                       		
                       		String arrcate[] = new String [count];
                       		
                       		for(int i = 0; i<count ; i++){
                       			arrcate[i] = stcate.nextToken();
                       		}
                       		int j=0;
                        %>
                       <tr>
                            <td>
                                <input type = "checkbox" name = "prefer_category" value="CLOTHES" <%if(arrcate[j].equals("CLOTHES")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 옷</label>
                                <input type = "checkbox" name = "prefer_category" value="JEWELRY" <%if(arrcate[j].equals("JEWELRY")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 쥬얼리</label>
                                <input type = "checkbox" name = "prefer_category" value="WATCH" <%if(arrcate[j].equals("WATCH")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 시계</label>
                                <input type = "checkbox" name = "prefer_category" value="BAG" <%if(arrcate[j].equals("BAG")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 가방</label>
                                <input type = "checkbox" name = "prefer_category" value="WALLET" <%if(arrcate[j].equals("WALLET")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 지갑</label>
                                <input type = "checkbox" name = "prefer_category" value="GLASSES" <%if(arrcate[j].equals("GLASSES")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 안경</label>
                                <input type = "checkbox" name = "prefer_category" value="SHOES" <%if(arrcate[j].equals("SHOES")){j++;%>checked<%if(j==count)j--;}%>><label for = "prefer_category"> 신발</label>
                            </td>
                        </tr>
                    </table>
                    <br/><br/><br/>
                    <table class = "additional_info_table2">
                        <tr>
                            <td>관심 브랜드</td>
                        </tr>
                        <%
	                        String likebrand = memberVO.getMember_like_brand();
	                    	
	                   		StringTokenizer stbrand = new StringTokenizer(likebrand,",");
	                   	
	                   		int countbr = stbrand.countTokens();
	                   		
	                   		String arrbrand[] = new String [countbr];
	                   		
	                   		for(int i = 0; i<countbr ; i++){
	                   			arrbrand[i] = stbrand.nextToken();
	                   		}
	                   		int k=0;
	                   		
	                   		
	                        %>
                        <tr>
                            <td>
                                <div class = "td_brandbox">
                                    <input type = "checkbox" name = "prefer_brand" value = "Armani" <%if(arrbrand[k].equals("Armani")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Armani</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Balenciaga" <%if(arrbrand[k].equals("Balenciaga")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Balenciaga</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Bally" <%if(arrbrand[k].equals("Bally")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Bally</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Balmain" <%if(arrbrand[k].equals("Balmain")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Balmain</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Barluti" <%if(arrbrand[k].equals("Barluti")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Barluti</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" ><label for = "prefer_brand">Bottega Veneta</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "BOUCHERON" <%if(arrbrand[k].equals("BOUCHERON")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">BOUCHERON</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Breguet" <%if(arrbrand[k].equals("Breguet")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Breguet</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "BREITLING" <%if(arrbrand[k].equals("BREITLING")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">BREITLING</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" ><label for = "prefer_brand">Brunello Cucinelli</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Burberrys" <%if(arrbrand[k].equals("Burberrys")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Burberrys</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Bvlgari" <%if(arrbrand[k].equals("Bvlgari")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Bvlgari</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Cartier" <%if(arrbrand[k].equals("Cartier")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Cartier</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Celine" <%if(arrbrand[k].equals("Celine")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Celine</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = "Chanel" <%if(arrbrand[k].equals("Chanel")){k++;%>checked<%if(k==countbr)k--;}%>><label for = "prefer_brand">Chanel</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = ""><label for = "prefer_brand">Christian Dior</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = ""><label for = "prefer_brand">Christian louboutin</label><br/>
                                    <input type = "checkbox" name = "prefer_brand" value = ""><label for = "prefer_brand">Chronoswiss</label><br/>
                                </div>
                                <div class = "td_brandbox">
                                   
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Coach</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Colombo</label><br/>
                           <!--     <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Comme des Garcons</label><br/> -->
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Damiani</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">DELVAUX</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dior Homme</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dolce&Gabbana</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dries Van Noten</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dsquared2</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">DVF</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Ermanno Scervino</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Etro</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Fendi</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Ferragamo</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">For Man</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Franck Muller</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Fred</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Guiseppe Zanotti</label><br/>
                                </div>
                                <div class = "td_brandbox">
                                    
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Giambattista Valli</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Givenchy</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Goyard</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Gucci</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">HarryWinston</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Helen Kaminski</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Hermes</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">HUBLOT</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Isabel Marant</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Jimmy Choo</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Louis Vuitton</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Manolo Blahnik</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Maje</label><br/>
                          		<!--<input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Marc by Marc Jacobs</label><br/> -->
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Marc Jacobs</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Marni</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Martin Margiella</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Max Mara</label><br/>
                                    
                                </div>
                                <div class = "td_brandbox">
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Michael kors</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Miu Miu</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">MONCLERE</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">MontBlanc</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Moschino</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Mulberry</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Omega</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Prada</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Proenza schouler</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Rick owens</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">ROCHAS</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">ROGER DUBUIS</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Roger Vivier</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Rolex</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Sacai</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">See by Chloe</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Stella McDartney</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Stuart Weitzman</label><br/>
                                </div>
                                <div class = "td_brandbox">
                                    
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Syaring</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tagheuer</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tasaki</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">THOM BROWNE</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tiffany</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tod's</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tom ford</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tory burch</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Valentino</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Valexstra</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Vanessa Bruno</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Vivienne westwood</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">YSL Rive Gauche</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Zadig&Voltaire</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">그외브랜드</label><br/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <div class = info_button_container>
                        <input type = "reset" value="취 소" class = "info_table_button">
                        <input type = "submit" value="확 인" class = "info_table_button">
                    </div>
                    
                </form>
                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
       
			</article>
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>