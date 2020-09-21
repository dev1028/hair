<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap form HAML</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div id='form-container'>
		<form class='form-horizontal' id='components' role='form'>
			<fieldset>
				<div class='tab-content'>
					<!-- Tabs of snippets go here -->
					<div class='tab-pane active' id='input'>
						<div class='component'>
							<!-- Text input -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='textinput'>Text
									Input</label>
								<div class='col-md-4'>
									<input class='form-control input-md' id='textinput'
										name='textinput' placeholder='placeholder'
										style='cursor: auto; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHklEQVQ4EaVTO26DQBD1ohQWaS2lg9JybZ+AK7hNwx2oIoVf4UPQ0Lj1FdKktevIpel8AKNUkDcWMxpgSaIEaTVv3sx7uztiTdu2s/98DywOw3Dued4Who/M2aIx5lZV1aEsy0+qiwHELyi+Ytl0PQ69SxAxkWIA4RMRTdNsKE59juMcuZd6xIAFeZ6fGCdJ8kY4y7KAuTRNGd7jyEBXsdOPE3a0QGPsniOnnYMO67LgSQN9T41F2QGrQRRFCwyzoIF2qyBuKKbcOgPXdVeY9rMWgNsjf9ccYesJhk3f5dYT1HX9gR0LLQR30TnjkUEcx2uIuS4RnI+aj6sJR0AM8AaumPaM/rRehyWhXqbFAA9kh3/8/NvHxAYGAsZ/il8IalkCLBfNVAAAAABJRU5ErkJggg==); background-attachment: scroll; background-position: 100% 50%; background-repeat: no-repeat;'
										type='text'> <span class='help-block'>help</span>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Password input -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='passwordinput'>Password
									Input</label>
								<div class='col-md-4'>
									<input class='form-control input-md' id='passwordinput'
										name='passwordinput' placeholder='placeholder'
										style='background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACIUlEQVQ4EX2TOYhTURSG87IMihDsjGghBhFBmHFDHLWwSqcikk4RRKJgk0KL7C8bMpWpZtIqNkEUl1ZCgs0wOo0SxiLMDApWlgOPrH7/5b2QkYwX7jvn/uc//zl3edZ4PPbNGvF4fC4ajR5VrNvt/mo0Gr1ZPOtfgWw2e9Lv9+chX7cs64CS4Oxg3o9GI7tUKv0Q5o1dAiTfCgQCLwnOkfQOu+oSLyJ2A783HA7vIPLGxX0TgVwud4HKn0nc7Pf7N6vV6oZHkkX8FPG3uMfgXC0Wi2vCg/poUKGGcagQI3k7k8mcp5slcGswGDwpl8tfwGJg3xB6Dvey8vz6oH4C3iXcFYjbwiDeo1KafafkC3NjK7iL5ESFGQEUF7Sg+ifZdDp9GnMF/KGmfBdT2HCwZ7TwtrBPC7rQaav6Iv48rqZwg+F+p8hOMBj0IbxfMdMBrW5pAVGV/ztINByENkU0t5BIJEKRSOQ3Aj+Z57iFs1R5NK3EQS6HQqF1zmQdzpFWq3W42WwOTAf1er1PF2USFlC+qxMvFAr3HcexWX+QX6lUvsKpkTyPSEXJkw6MQ4S38Ljdbi8rmM/nY+CvgNcQqdH6U/xrYK9t244jZv6ByUOSiDdIfgBZ12U6dHEHu9TpdIr8F0OP692CtzaW/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=); background-attachment: scroll; background-position: 100% 50%; background-repeat: no-repeat;'
										type='password'> <span class='help-block'>help</span>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Search input -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='searchinput'>Search
									Input</label>
								<div class='col-md-4'>
									<input class='form-control input-md' id='searchinput'
										name='searchinput' placeholder='placeholder' type='search'>
									<p class='help-block'>help</p>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Prepended text -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='prependedtext'>Prepended
									Text</label>
								<div class='col-md-4'>
									<div class='input-group'>
										<span class='input-group-addon'>prepend</span> <input
											class='form-control' id='prependedtext' name='prependedtext'
											placeholder='placeholder' type='text'>
									</div>
									<p class='help-block'>help</p>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Appended Input -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='appendedtext'>Appended
									Text</label>
								<div class='col-md-4'>
									<div class='input-group'>
										<input class='form-control' id='appendedtext'
											name='appendedtext' placeholder='placeholder' type='text'>
										<span class='input-group-addon'>append</span>
									</div>
									<p class='help-block'>help</p>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Prepended checkbox -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='prependedcheckbox'>Prepended
									Checkbox</label>
								<div class='col-md-4'>
									<div class='input-group'>
										<span class='input-group-addon'> <input type='checkbox'>
										</span> <input class='form-control' id='prependedcheckbox'
											name='prependedcheckbox' placeholder='placeholder'
											type='text'>
									</div>
									<p class='help-block'>help</p>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Appended checkbox -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='appendedcheckbox'>Appended
									Checkbox</label>
								<div class='col-md-4'>
									<div class='input-group'>
										<input class='form-control' id='appendedcheckbox'
											name='appendedcheckbox' placeholder='placeholder' type='text'>
										<span class='input-group-addon'> <input type='checkbox'>
										</span>
									</div>
									<p class='help-block'>help</p>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Button Drop Down -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='buttondropdown'>Button
									Drop Down</label>
								<div class='col-md-4'>
									<div class='input-group'>
										<input class='form-control' id='buttondropdown'
											name='buttondropdown' placeholder='placeholder' type='text'>
										<div class='input-group-btn'>
											<button class='btn btn-default dropdown-toggle'
												data-toggle='dropdown' type='button'>
												Action <span class='caret'></span>
											</button>
											<ul class='dropdown-menu pull-right'>
												<li><a href='#'>Option one</a></li>
												<li><a href='#'>Option two</a></li>
												<li><a href='#'>Option three</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Textarea -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='textarea'>Text
									Area</label>
								<div class='col-md-4'>
									<textarea class='form-control' id='textarea' name='textarea'>default text</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class='tab-pane' id='radioscheckboxes'>
						<div class='component'>
							<!-- Multiple Radios -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='radios'>Multiple
									Radios</label>
								<div class='col-md-4'>
									<div class='radio'>
										<label for='radios-0'> <input checked='checked'
											id='radios-0' name='radios' type='radio' value='1'>
											Option one
										</label>
									</div>
									<div class='radio'>
										<label for='radios-1'> <input id='radios-1'
											name='radios' type='radio' value='2'> Option two
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Multiple Radios (inline) -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='radios'>Inline
									Radios</label>
								<div class='col-md-4'>
									<label class='radio-inline' for='radios-0'> <input
										checked='checked' id='radios-0' name='radios' type='radio'
										value='1'> 1
									</label> <label class='radio-inline' for='radios-1'> <input
										id='radios-1' name='radios' type='radio' value='2'> 2
									</label> <label class='radio-inline' for='radios-2'> <input
										id='radios-2' name='radios' type='radio' value='3'> 3
									</label> <label class='radio-inline' for='radios-3'> <input
										id='radios-3' name='radios' type='radio' value='4'> 4
									</label>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Multiple Checkboxes -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='checkboxes'>Multiple
									Checkboxes</label>
								<div class='col-md-4'>
									<div class='checkbox'>
										<label for='checkboxes-0'> <input id='checkboxes-0'
											name='checkboxes' type='checkbox' value='1'> Option
											one
										</label>
									</div>
									<div class='checkbox'>
										<label for='checkboxes-1'> <input id='checkboxes-1'
											name='checkboxes' type='checkbox' value='2'> Option
											two
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class='component'>
							<!-- Multiple Checkboxes (inline) -->
							<div class='form-group'>
								<label class='col-md-4 control-label' for='checkboxes'>Inline
									Checkboxes</label>
								<div class='col-md-4'>
									<label class='checkbox-inline' for='checkboxes-0'> <input
										id='checkboxes-0' name='checkboxes' type='checkbox' value='1'>
										1
									</label> <label class='checkbox-inline' for='checkboxes-1'> <input
										id='checkboxes-1' name='checkboxes' type='checkbox' value='2'>
										2
									</label> <label class='checkbox-inline' for='checkboxes-2'> <input
										id='checkboxes-2' name='checkboxes' type='checkbox' value='3'>
										3
									</label> <label class='checkbox-inline' for='checkboxes-3'> <input
										id='checkboxes-3' name='checkboxes' type='checkbox' value='4'>
										4
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
</body>

</html>