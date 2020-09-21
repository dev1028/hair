<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴사자 현황</title>
<style type="text/css">
* { box-sizing: border-box; }
body {
  font: 16px Arial;
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;

}
input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}
input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}
input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff;
  border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9;
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important;
  color: #ffffff;
}
</style>

<script>
var employees = [];
var employeelist = null;
$(function(){
 	$("#btnfiremodal").on("click", function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/findEmployees.do", 
			data : {hs_no : "${sessionScope.hsno}"},
			dataType : "json",
			method : "post",
			success : function(data) {
				employeelist = data;
				for(var i = 0; i<data.length; i++){
					employees.push(data[i].designer_name);
				}
			}
		});// end of ajax 
		
		$("#staticBackdrop").modal();
	});//endof btnfiremodal
	
	$("#staticBackdrop").on('hide.bs.modal', function(){
			$("#fireemployeefrm").find("input").val("");
			employeelist = null;
	});
	
	/* var ischangeval = null;
 	$("#firedesigner_name").on("keydown", function(){
 		if(ischangeval != null && ischangeval != $(this).val()){
 			let today = new Date();
 	  		$("#firedli_leave_date").val(today.toLocaleString());
 	  		$("#firehire_date").val("");
			for (var j = 0; j<employeelist.length; j++){
				if($(this).val() == employeelist[j].designer_name){
				$("#firehire_date").val(employeelist[designerindex].hire_date);				
				}					
			}
 		}
	 	ischangeval = $(this).val();
 		 
	});  */
	
	
	function autocomplete(inp, arr) {
		  var currentFocus;
		  /*execute a function when someone writes in the text field:*/
		  inp.addEventListener("input", function(e) {
		      var a, b, i, val = this.value;
		      /*close any already open lists of autocompleted values*/
		      closeAllLists();
		      if (!val) { return false;}
		      currentFocus = -1;
		      /*create a DIV element that will contain the items (values):*/
		      a = document.createElement("DIV");
		      a.setAttribute("id", this.id + "autocomplete-list");
		      a.setAttribute("class", "autocomplete-items");
		      /*append the DIV element as a child of the autocomplete container:*/
		      this.parentNode.appendChild(a);
		      /*for each item in the array...*/
		      for (i = 0; i < arr.length; i++) {
		        /*check if the item starts with the same letters as the text field value:*/
		        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
		          /*create a DIV element for each matching element:*/
		          b = document.createElement("DIV");
		          /*make the matching letters bold:*/
		          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
		          b.innerHTML += arr[i].substr(val.length);
		          /*insert a input field that will hold the current array item's value:*/
		          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
		          /*execute a function when someone clicks on the item value (DIV element):*/
		          b.addEventListener("click", function(e) {
		              /*insert the value for the autocomplete text field:*/
		              inp.value = this.getElementsByTagName("input")[0].value;
		              /*close the list of autocompleted values,
		              (or any other open lists of autocompleted values:*/
		              closeAllLists();
		          });
		          a.appendChild(b);
		        }
		      }
		  });
		  /*execute a function presses a key on the keyboard:*/
		  inp.addEventListener("keydown", function(e) {
		      var x = document.getElementById(this.id + "autocomplete-list");
		      if (x) x = x.getElementsByTagName("div");
		      if (e.keyCode == 40) {
		        /*If the arrow DOWN key is pressed,
		        increase the currentFocus variable:*/
		        currentFocus++;
		        /*and and make the current item more visible:*/
		        addActive(x);
		      } else if (e.keyCode == 38) { //up
		        /*If the arrow UP key is pressed,
		        decrease the currentFocus variable:*/
		        currentFocus--;
		        /*and and make the current item more visible:*/
		        addActive(x);
		      } else if (e.keyCode == 13) {
		        /*If the ENTER key is pressed, prevent the form from being submitted,*/
		        e.preventDefault();
		        if (currentFocus > -1) {
		          /*and simulate a click on the "active" item:*/
		          if (x) {
		        	  x[currentFocus].click();
		        	 
		          }
		        }
		      }
		  });
		  function addActive(x) {
		    /*a function to classify an item as "active":*/
		    if (!x) return false;
		    /*start by removing the "active" class on all items:*/
		    removeActive(x);
		    if (currentFocus >= x.length) currentFocus = 0;
		    if (currentFocus < 0) currentFocus = (x.length - 1);
		    /*add class "autocomplete-active":*/
		    x[currentFocus].classList.add("autocomplete-active");
		  }
		  function removeActive(x) {
		    /*a function to remove the "active" class from all autocomplete items:*/
		    for (var i = 0; i < x.length; i++) {
		      x[i].classList.remove("autocomplete-active");
		    }
		  }
		  function closeAllLists(elmnt) {
		    /*close all autocomplete lists in the document,
		    except the one passed as an argument:*/
		    var x = document.getElementsByClassName("autocomplete-items");
		    for (var i = 0; i < x.length; i++) {
		      if (elmnt != x[i] && elmnt != inp) {
		        x[i].parentNode.removeChild(x[i]);
		      }
		    }
		  }
		  /*execute a function when someone clicks in the document:*/
		  document.addEventListener("click", function (e) {
		      closeAllLists(e.target);
		  });
		}
	
	autocomplete(document.getElementById("firedesigner_name"), employees);
});
</script>
</head>
<body>
	<div class="container">
		<h3 class="font-weight-bold">퇴사자 목록</h3>
		<div class="row">
			<div class="col-sm">
				<hr>
				<div class="btn-group btn-group-sm" role="group"
					aria-label="Basic example">
					<button type="button" class="btn btn-primary"  id="btnfiremodal">퇴사 처리</button>
					<form
						action="${pageContext.request.contextPath}/hairshop/retiredEmployeeList.do">
						<button type="submit" class="btn btn-info"
							id="btnretiredEmployeeList">퇴사자목록으로 이동</button>
					</form>
				</div>
				<hr>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
	<div class="container">
		<div id="codelisttable">
			<table class="table table-bordered table-hover table-sm text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="row">직원번호</th>
						<th scope="row">성명</th>
						<th scope="row">전화번호</th>
						<th scope="row">이메일</th>
						<th scope="row">최종직급</th>
						<th scope="row">입사일</th>
						<th scope="row">퇴사일</th>
						<th scope="row">퇴사사유</th>
					</tr>
				</thead>
				<tbody id="retiredEmp_list_tbody" class="table table-striped">
					<c:if test="${empty rlist}">
						<tr id="emptyEmp">
							<td colspan="8"><span>퇴사한 직원이 없습니다.</span></td>
						</tr>
					</c:if>
					<c:if test="${!empty rlist}">
						<c:forEach items="${rlist}" var="emp">
							<tr id="${emp.designer_no}">
								<td>${emp.designer_no}</td>
								<td>${emp.designer_name}</td>
								<td>${emp.designer_phone}</td>
								<td>${emp.designer_email}</td>
								<td>${emp.fin_position}</td>
								<td>${emp.hire_date}</td>
								<td>${emp.dli_leave_date}</td>
								<td>${emp.dli_reason}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<h3 class="font-weight-bold">퇴사자 목록</h3>
		<div class="row">
			<div class="col-sm">
				<hr>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">퇴사 처리</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="fireemployeefrm"
						action=""
						method="post">
						<div class="form-group autocomplete">
							<label for="firedesigner_name">디자이너 이름</label> 
							<input
								type="text" class="form-control" id="firedesigner_name"
								name="designer_name" placeholder="디자이너 이름을 입력해주세요." autocomplete="off" >
						</div>
						<div class="form-group">
							<label for="firefin_position">최종 직급</label> <input
								type="text" class="form-control" id="firefin_position" placeholder="-"
								name="fin_position" readonly> <small id="firefin_positionsm"
								class="form-text text-muted" >최종 직급이 다를경우 수정 후 다시 처리하세요.</small>
						</div>
						<div class="form-group">
							<label for="firehire_date">입사일</label> <input
								type="text" class="form-control" id="firehire_date" placeholder="-"
								name="hire_date" readonly>
						</div>
						<div class="form-group">
							<label for="firedli_leave_date">퇴사일</label> <input
								type="text" class="form-control" id="firedli_leave_date" placeholder="-"
								name="dli_leave_date"
								readonly> <small id="firedli_leave_datesm"
								class="form-text text-muted">퇴사일은 신청일 기준으로 반영됩니다.</small>
						</div>
						<div class="form-group">
							<label for="firedli_reason">퇴사사유</label> <input
								type="text" class="form-control" id="firedli_reason"
								name="dli_reason" 
								> <small id="firedli_reasonsm"
								class="form-text text-muted">퇴사사유를 간략하게 적어주세요.</small>
								<input type="hidden" name = "designer_no" id="firedesigner_no">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="btnDesignerFire">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>