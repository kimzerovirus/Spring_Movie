<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <!-- The Modal -->
  <div class="modal" id="myLoginModal">
    <div class="modal-dialog">
      <div class="modal-content" style="border-radius:10px;background:#eee;box-shadow:5px 7px rgba(250,250,250,0.5);border:none !important;">
      <form action="${pageContext.request.contextPath }/login" method="POST">
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
            <label for="userid">아이디</label>
           </div>  
           <div  class="col-md-9">
            <input type="text" class="form-control"
             autofocus="autofocus"
             name="userid" id="userid" placeholder="User Id">
            </div> 
        </div>
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
            <div class="col-md-12 text-right form-check">
                <label class="form-check-label">
                    <input type="checkbox"
                     class="form-check-input"
                      name="saveId" id="saveId"> 아이디 저장
                </label>
            </div>    
         </div>

        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer" style="border:none !important;">
          <button class="btn btn-success">로그인</button>  
          <button type="button" class="btn btn-danger"
           data-dismiss="modal">Close</button>
        </div>
       </form>
       <!-- form end----- -->
      </div>
    </div>
  </div>
    </div>