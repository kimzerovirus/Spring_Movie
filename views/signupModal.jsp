<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <!-- The Modal -->
  <div class="modal" id="mySignUpModal">
    <div class="modal-dialog">
      <div class="modal-content" style="border-radius:10px;background:#eee;box-shadow:5px 7px rgba(250,250,250,0.5);border:none !important;">
      <form action="${pageContext.request.contextPath }/join" method="POST" onsubmit="return check()" name="mf">
        <!-- Modal Header -->
        <div class="modal-header text-center" style="border:none !important;">
          <h4 class="modal-title text-primary">Login Page</h4>
          <button type="button" class="close"
           data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
        <div class="row m-3">
           <div class="col-md-3 text-right">
            <label for="userid">아 이 디</label>
           </div>
           <div  class="col-md-9">
            <input type="text" class="form-control"
             autofocus="autofocus" onchange="checkId(this.value)"
             name="userid" id="userid" placeholder="User Id">
            </div> 
        </div>
        <p class="text-center" id="msgId"></p>
        <input type="hidden" name="idCheck" id="idCheck">
        <div class="row m-3">
            <div class="col-md-3 text-right">
             <label for="pwd">비밀번호</label>
            </div>  
            <div  class="col-md-9">
             <input type="password" class="form-control"
              name="pwd" id="pwd" placeholder="Password">
             </div> 
         </div>
         <div class="row m-3">
            <div class="col-md-3 text-right">
             <label for="pwdcf">비밀번호 확인</label>
            </div>  
            <div  class="col-md-9">
             <input type="password" class="form-control"
              name="pwdcf" id="pwdcf" placeholder="Password Confirm">
             </div> 
         </div>
      	<div class="row m-3">
           <div class="col-md-3 text-right">
            <label for="name">이      름</label>
           </div>  
           <div  class="col-md-9">
            <input type="text" class="form-control"
             autofocus="autofocus"
             name="name" id="name" placeholder="User Name">
            </div> 
        </div>

        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer" style="border:none !important;">
          <button class="btn btn-success">회원가입</button>  
          <button type="button" class="btn btn-danger"
           data-dismiss="modal">Close</button>
        </div>
       </form>
       <!-- form end----- -->
      </div>
    </div>
  </div>
    </div>
    
    <script>
    function checkId(uid){
 	   var len=uid.length;
 	   if(len<4||len>8){
 			$('#msgId').text('아이디는 4자 이상 8자 이내여야 해요').addClass('text-danger');
 		   return;
 	   }else{
    	$('#msgId').text('').addClass('text-info');
	   $.ajax({
		   type:'Get',
		   url:'idCheck?userid='+uid,
		   dataType:'json',
		   cache:false,
		   success:function(res){
			   //alert(JSON.stringify(res));
			   var n=res.isUse;
			   $('#msgId').removeClass('text-danger');
			   if(parseInt(n)>0){
				   $('#msgId').html(uid+"는 사용 가능합니다.").addClass('text-success');
				   $('#idCheck').val("1");
			   }else{
				   $('#msgId').html(uid+"는 이미 사용중입니다").addClass('text-danger');
				   $('#idCheck').val("-1");
			   }
			   
		   },
		   error:function(err){
				alert("error: "+err.status)
		   }
	    })
    }
    }

    function check(){
		if(!mf.userid.value){
			alert('아이디를 입력해주세요');
			mf.userid.focus();
			return false;
		}

		if(!mf.pwd.value){
	         alert('비밀번호를 입력하세요');
	         mf.pwd.focus();
	         return false;
	      }

		if(!mf.pwdcf.value){
	         alert('비밀번호확인을 입력하세요');
	         mf.pwdcf.focus();
	         return false;
	      }
	      
	      if(mf.pwd.value != mf.pwdcf.value){
	         alert('비밀번호가 달라요');
	         mf.pwd2.select();
	         return false;
	      }

			if(!mf.name.value){
				alert('이름을 입력해주세요');
				mf.name.focus();
				return false;
			}
			
    	if(!mf.idCheck.value || parseInt(mf.idCheck.value) < 0){
            alert('입력하신 아이디는 사용 불가능합니다.');
            mf.userid.select();
            return false;
         }
       
        return true;
    }
    </script>