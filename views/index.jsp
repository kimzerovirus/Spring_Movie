<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx = request.getContextPath();
%>
<c:import url="/top" />



                <h1 class="mb-5 text-center">The Movie Database</h1>
                <div class="data_container"></div>
                
                
                </div>
<c:import url="/foot" />


<style>
	.data_container{
		display:flex;
		flex-flow:row wrap;
		justify-items:center;
		justify-content:center;
		width:100%;
	}
	.data_box:nth-child(4n+1){
		margin-left:0;
	}
	.data_box:nth-child(4n){
		margin-right:0;
	}
	.data_box{
		flex-basis:25%;
		flex:0;
		margin:1%;
		padding:1%;
		cursor:pointer;
		box-sizing:border-box;
		background:white;
		border-radius:10px;top:180px;box-shadow:5px 7px rgba(90,90,100,0.2);
		position:relative;
		top:0;
		left:0;
	}
	.data_box>div{
		position:absolute;
		z-index:10;
		width:100%;
		height:100%;
		border-radius:10px;
		opacity:0;
		top:0;
		left:0;
		over-flow:hidden;
		padding:10% 10% 30%;
	}
	.data_box>div:hover{
		background:black;
		opacity:0.8;
		transition:0.5s;
	}
	
	.data_box img{
	}
	.data_box a{
		text-decoration:none;
	}
	.data_box *{
		padding: 8px 0;
	}
	.text-f{
		color:#fff;
	}
	.detail{
		display:block;
		width:100%;
		height:100%;
		box-sizing:border-box;
		padding:0;
		margin:0;
	}
</style>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
 		//https://api.themoviedb.org/3/movie/popular?api_key=9385cd3d0b82a60e37b1fe52f2ed0d8c&language=ko-KR&page=1
        let page = 1;
        const key = "9385cd3d0b82a60e37b1fe52f2ed0d8c";
        const base_url = "https://image.tmdb.org/t/p/w300/";
        const container = document.querySelector(".data_container");
		let output = '';
		
        getMovies = async () => {
            const url = 'https://api.themoviedb.org/3/movie/popular?api_key='+key+'&language=ko-KR&page='+page;
            const {
                data: {
                    results
                },
            } = await axios.get(url);
             console.log(results);
            for (var i = 0; i < results.length; i++) {
                //console.log(results);
                //console.log(results[i].title);

                output = output + '<div class="data_box"><div><a class="detail" href="<%=myctx%>/detail?movieid='+results[i].id+'" class=""><h3 class="text-f text-center">'+results[i].title+'</h3><br><p class="text-center text-f">'+results[i].overview+'</p></a></div><img src='+base_url + results[i].poster_path+'><h5 class="text-center text-primary">'+results[i].title+'</h5>'+'</div>';
            }
            container.innerHTML = output;
        }
        window.addEventListener('onLoad', getMovies());
</script>