<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.alert-success {
	width: 360px;
}
</style>
<script>
	function inputNumberAutoComma(obj) {
		// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
		var deleteComma = obj.value.replace(/\,/g, "");
		// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
		if (isFinite(deleteComma) == false) {
			alert("문자는 입력하실 수 없습니다.");
			obj.value = "";
			return false;
		}
		// 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
		obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
	}
	// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
	function inputNumberWithComma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	}
	// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
	function inputNumberRemoveComma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, "");
	}
</script>
<script>
/* 이거왜 안되노 */
$(document).ready(function() {
    $('#contact_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	hsc_name: {
                validators: {
                        notEmpty: {
                        message: '쿠폰명 입력하세요'
                    }
                }
            },
            hsc_issuedate: {
                validators: {
                    notEmpty: {
                        message: '유효기간입력하세요'
                    }
                }
            },
            hsc_expiredate: {
                validators: {
                    notEmpty: {
                        message: '유효기간입력하세요'
                    }
                
                }
            },
            hsc_coupon_quantity: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your phone number'
                    }
                  
                }
            },
            address: {
                validators: {
                     stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Please supply your street address'
                    }
                }
            },
            hsc_maxdiscount_pay: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your city'
                    }
                }
            },
            hsc_discount_rate: {
                validators: {
                    notEmpty: {
                        message: 'Please select your state'
                    }
                }
            },
  
            comment: {
                validators: {
                      stringLength: {
                        min: 10,
                        max: 200,
                        message:'Please enter at least 10 characters and no more than 200'
                    },
                    notEmpty: {
                        message: 'Please supply a description of your project'
                    }
                    }
                }
            }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#contact_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});


</script>
</head>
<body>
	<div class="container">
	<br><br><br>
		<form method="post"
			action="${pageContext.request.contextPath}/hairshop/HairshopCouponInsertCtrl.do"
			id="contact_form" class="well form-horizontal" name="frm"
			onsubmit="return checkValue();">

			<fieldset>

				<!-- Form Name -->
				<legend>쿠폰 등록</legend>
				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">쿠폰명</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="hsc_name"
								placeholder="쿠폰명 입력하세요" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">쿠폰사용 기간</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input
								name="hsc_issuedate" class="form-control" type="date"> <input
								name="hsc_expiredate" class="form-control" type="date">
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">쿠폰갯수</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input
								name="hsc_coupon_quantity" min="0" max="100"
								placeholder="쿠폰갯수 입력하세요" class="form-control" type="number">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">최대 할인금액</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input
								name="hsc_maxdiscount_pay" placeholder="" class="form-control"
								onKeyup="inputNumberAutoComma(this);" value="" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">할인율(%)</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-home"></i></span> <input
								name="hsc_discount_rate" placeholder="" class="form-control"
								type="number" min="0" max="100">
						</div>
					</div>
				</div>

				<!-- Success message -->
				<div class="alert alert-success" role="alert" id="success_message">
					Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for
					contacting us, we will get back to you shortly.
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" class="btn btn-warning">
							Send <span class="glyphicon glyphicon-send"></span>
						</button>
						<button type="reset" class="btn btn-warning">
							Reset <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>

			</fieldset>
		</form>
	</div>
	
	<!-- /.container -->
</body>
</html>