<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx = request.getContextPath();
	String movieid = request.getParameter("movieid");
%>
<c:import url="/top" />



                <h1 class="mb-5 text-center">The Movie Detail</h1>
                
                <div class="detail_container"></div>
                
                <c:if test="${loginUser ne null }">
                <div class="container">
                <div class="row mt-5 text-center">
                <div class="col-md-10">
                	<form action="<%=myctx%>/write" name="bf" id="bf" method="post">
                		<input name="movieid" type="hidden" value="<%=movieid%>"/>
                		<input name="userid" type="hidden" value="${loginUser.userid}"/>
                		<textarea name="memo" id="memo" rows="5" cols="50"
						class="form-control"></textarea>
                	</form>
                	</div>
                <div class="col-md-2">
                	<button type="button" id="btnWrite" class="btn btn-primary" style="width:100%;height:100%">등 록</button>
                </div>
                </div>
                </div>
                </c:if>
                
            <table class="table mt-5">
            <c:forEach var="board" items="${board}">
				<tr>
					<td class="text-center" width="20%">
						${board.userid}
					</td>
					<td width="60%">
					${board.memo}<br>
					<c:if test="${loginUser ne null }">
						<!-- <button type="button" id="mod" class="btn btn-success" onclick="mod('${board.board_idx}')">수정</button> -->
						<button type="button" id="del" class="btn btn-warning" onclick="del('${board.board_idx}')">삭제</button>
					</c:if>
					</td>
					<td class="text-center" width="20%">	
						<!-- <fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/> -->
						${board.reg_date}
					</td>
				</tr>
			</c:forEach>
			</table>	
                
                </div>
                
                <form name="df" action="<%=myctx%>/delete">
                	<input name="bidx" type="hidden">
                </form>
<c:import url="/foot" />

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
 		//https://api.themoviedb.org/3/movie/popular?api_key=9385cd3d0b82a60e37b1fe52f2ed0d8c&language=ko-KR&page=1
 		//https://api.themoviedb.org/3/movie/602211?api_key=9385cd3d0b82a60e37b1fe52f2ed0d8c&language=ko-KR
 		//https://api.themoviedb.org/3/movie/602211/credits?api_key=9385cd3d0b82a60e37b1fe52f2ed0d8c&language=ko-KR
 		
        const key = "9385cd3d0b82a60e37b1fe52f2ed0d8c";
        const base_url = "https://image.tmdb.org/t/p/w300/";
        const container = document.querySelector(".detail_container");
		let output = '';
		let movieNum = '';
		let genresName = '';
		let actors='';
		
        getMovies = async () => {
            const url = 'https://api.themoviedb.org/3/movie/<%=movieid%>?api_key='+key+'&language=ko-KR';
            const actorUrl = 'https://api.themoviedb.org/3/movie/<%=movieid%>/credits?api_key='+key+'&language=ko-KR';
            const {
                data:{
					genres,
					id,
					poster_path,
					overview,
					release_date,
					runtime,
					title
                }
            } = await axios.get(url);

            const {
                data:{
					cast
                }
            } = await axios.get(actorUrl);
            //console.log(title);
            //console.log(genres);
			movieNum = id;

			for(i=0;i<genres.length;i++){
				if(i==0){
					genresName = genresName+genres[i].name;	
				}else{
					genresName = genresName+' | '+genres[i].name;
				}
			}

			for(i=0;i<7;i++){
				if(i==0){
					actors = actors+cast[i].name;	
				}else{
					actors = actors+' | '+cast[i].name;
				}
			}
			
            output = '<div class="row"><div class="col-md-4"><img src="'+base_url+poster_path+'" width="100%" alt="포스터 이미지"/></div><div class="col-md-8"><h1>'+title+'</h1><br><p>장르: '+genresName+'</p><p>개봉일: '+release_date+'</p>상영시간: '+runtime+' 분</p><p>등장인물: '+actors+'</p><p><br>줄거리: '+overview+'</p></div><div>';
            container.innerHTML = output;
        }
        window.addEventListener('onLoad', getMovies());

		//유효성 체크 등
        $(function() {
    		$('#btnWrite').click(function() {
    			if (!$('#memo').val()) {
    				alert('글내용을 입력하세요');
    				$('#memo').focus();
    				return;
    			}
    			var yn = confirm("글을 등록 하시겠습니까?");
    			if(yn){
    			$('#bf').submit();
            	}
    		});
    	});

    	function del(idx){
    		var yn = confirm("글을 삭제 하시겠습니까?");
			if(yn){
				df.bidx.value = idx;
				df.method = 'post';
				df.submit();
			}
			return;			
       	}

       	function mod(idx){
       		location.href="<%=myctx%>/"
        }    	
</script>