function f1() {
  // 폼에 입력된 값들을 불러온다.
  var a1 = "이름 : " + document.form11.hw_name.value + "\n";
  var a2 = "이메일 : " + document.form11.hw_email.value + "\n";

  var a3;

  switch (document.form11.hw_tel_1.value) {
    case "0":
      a3 = "010";
      break;
    case "1":
      a3 = "011";
      break;
    case "2":
      a3 = "016";
      break;
    case "3":
      a3 = "017";
      break;
    case "4":
      a3 = "019";
      break;
    default:
      break;
  }

  var a4 =
    "전화번호 : " +
    a3 +
    "-" +
    document.form11.hw_tel_2.value +
    "-" +
    document.form11.hw_tel_3.value +
    "\n";

  alert(a1 + a2 + a4);
}

function submit_check() {
  var form11 = document.forms["form11"];

  if (form11["hw_name"].value.length < 3) {
    alert("hw_name 입력 경고");
    return false;
  }
  if (form11["hw_email"].value.length < 3) {
    alert("hw_email 입력 경고");
    return false;
  }
  if (form11["hw_pw"].value.length < 3) {
    alert("hw_pw 입력 경고");
    return false;
  }
  if (form11["hw_post_num"].value.length < 3) {
    alert("hw_post_num 입력 경고");
    return false;
  }
  if (form11["hw_address"].value.length < 3) {
    alert("hw_address 입력 경고");
    return false;
  }
  if (form11["hw_tel_2"].value.length < 3) {
    alert("hw_tel_2 입력 경고");
    return false;
  }
  if (form11["hw_tel_3"].value.length < 3) {
    alert("hw_tel_3 입력 경고");
    return false;
  }
  if (form11["hw_pw"].value != form11["hw_pw_confirm"].value) {
    alert("비번 != 비번확인 불일치 경고");
    return false;
  }

  return true;
}

/*
<form class="form1"
method="POST"
action="../0318/form01.js">
*/

// 이름
// hw_name
// hw_email
// hw_pw  hw_pw_confirm

// hw_post_num
// hw_address

// hw_tel_1
//     <option value="1">010</option>
//     <option value="2">011</option>
//     <option value="3">016</option>
//     <option value="4">017</option>
//     <option value="5">019</option>
// hw_tel_2
// hw_tel_3

// 버튼
// name="hw_join" value="JOIN"
// name="hw_cancel" value="CANCLE"

// form에서  submit  vs  button 차이?
// 기능은 동일하나, button쪽이 css유리하다.
// 웹표준 지향 > button을 이용하자
