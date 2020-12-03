function CheckValue() {
	
	var userID = document.getElementById("userID");
	var userPassword = document.getElementById("userPassword");
	var userEmail = document.getElementById("userEmail");
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var email = document.signup.userEmail.value;
	
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (var i = 0; i < userID.value.length; i++) {
    	ch = userID.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
            userID.focus();
            userID.select();
            return false;
        }
    }
	//아이디에 공백 사용하지 않기
    if (userID.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        userID.focus();
        userID.select()
        return false;
    }
  	//아이디 길이 체크 (6~12자)
    if (userID.value.length < 6 || userID.value.length > 12) {
        alert("아이디를 6~12자까지 입력해주세요.")
        userID.focus();
        userID.select();
        return false;
    }
    if (userPassword.value == userID.value) {
        alert("아이디와 비밀번호가 같습니다.")
        userPassword.focus();
        return false;
    }
  	//비밀번호 길이 체크(6~14자 까지 허용)
    if (userPassword.value.length<6 || userPassword.value.length>14) {
        alert("비밀번호를 6~14자까지 입력해주세요.")
        userPassword.focus();
       userPassword.select();
        return false;
    }
    if (regex.test(userEmail) === false) {
        alert("잘못된 이메일 형식입니다.");
        userEmail.value = ""
       userEmail.focus();
        return false;
    }
    for (var i = 0; i < userEmail.value.length; i++) {
        chm = userEmail.value.charAt(i)
        if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
            alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
            userEmail.focus();
            userEmail.select();
            return false;
        }
    }
	document.signup.submit()
}