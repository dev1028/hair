<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<style>
.review-wrapper {
  display: table;
  font-family: "Roboto";
}

.review-image {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  border-radius: 50%;
  -webkit-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  -moz-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
}

.review-image img {
  border-radius: 50%;
  width: 100px;
  height: 100px;
}

.review-info {
  background: #fff;
  margin-left: 50px;
  padding: 10px 10px 50px 90px;
  border-radius: 6px;
  -webkit-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  -moz-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
}

.first-line {
  float: left;
  width: 100%;
  padding-bottom: 15px;
}

.review-stars {
  float: left;
  padding: 5px 0;
}

.review-name {
  float: right;
  padding: 5px 10px 5px 0;
}

.review-name span {
  text-transform: uppercase;
  font-size: 20px;
  color: #757575;
}

.fa-star-o,
.fa-star-half-empty,
.fa-star-half-full,
.fa-star-half-o,
.fa-star {
  padding-right: 10px;
}

.fa-star-o:before,
.fa-star-half-empty:before,
.fa-star-half-full:before,
.fa-star-half-o:before,
.fa-star:before {
  font-size: 25px;
  color: #d4af37;
}

.review-text {
  margin-bottom: 10px;
}

.review-text span {
  display: block;
  background: url(https://ormcanada.com/img/quote.png) no-repeat bottom right;
  color: #666;
  font-size: 16px;
}

.review-time a span {
  float: right;
  font-size: 12px;
  color: #5890ff;
  padding-right: 10px;
}

.review-time a span:hover {
  text-decoration: underline;
}

</style>
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="review-wrapper">
          <div class="review-image">
            <img src="https://yt3.ggpht.com/-R26SxvkNJd8/AAAAAAAAAAI/AAAAAAAAAAA/kNZxeViAELQ/s88-c-k-no-mo-rj-c0xffffff/photo.jpg" alt="Hasan Sumon">
          </div>
          <div class="review-info">
            <div class="first-line">
              <div class="review-stars">
                <i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star-half-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i>
              </div>
              <div class="review-name">
                <span>멤버이름</span>
              </div>
            </div>
            <div class="review-text">
              <span>후기내용</span>
            </div>
            <div class="review-meta">
              <div class="review-time">
                <a><span>후기쓴날짜</span></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>