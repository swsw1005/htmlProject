// 1. 이벤트 리스터 설정하는 함수 --------------------------------------------------------
function loadEvents() {
  document.getElementById("add_btn").addEventListener("click", btn_add); // 2. add 버튼 누름 + todo
  document.getElementById("clear").addEventListener("click", btn_clearList); // 3. clear
  document.querySelector(".ul").addEventListener("click", li_click); // 4. ul쿼리셀렉터  클릭
  document.querySelector(".ul").addEventListener("focusout", edit_done); //  4-4. 체크/!체크  style 정리

  document.getElementById("task").focus(); //입력창focus
}

// 2. add 버튼 누름 + todo --------------------------------------------------------
function btn_add(e) {
  console.log("--2. click add");
  e.preventDefault();
  let insert_text = document.querySelector("input");
  if (insert_text.value != "") {
    addTask(insert_text.value);
    console.log("add success");
  }
  insert_text.value = "";

  document.getElementById("task").focus(); //입력창focus
}

// 2-1. 입력된 todo 추가 --------------------------------------------------------
function addTask(task) {
  console.log("--2.1---");
  let newUL = document.querySelector("ul");
  let newLI = document.createElement("li");
  newLI.innerHTML = `<div class="li">
      <div class="content_wrap">
          <input class="chkbox" type="checkbox">  
      </div>
      <div class="content_wrap">
          <input class="content" type="text" value="${task}">
      </div> 
      <a></a>
      <a class="delete"> × </a>
  </div>`;
  newUL.appendChild(newLI);
  // @ts-ignore
  document.querySelector(".tasksBoard").style.display = "block";

  document.getElementById("task").focus(); //입력창focus
}

// 3. clear >>> <ul>의 innerHTML  싹 지운다. --------------------------------------------------------
function btn_clearList(e) {
  console.log("--3.---");
  let ul = (document.querySelector("ul").innerHTML = "");
  all_del(); //전부지워지면 tasksBoard display=none
}

// 4. ul쿼리셀렉터  클릭 --------------------------------------------------------
function li_click(e) {
  console.log("--4.---");
  let temp = e.target.className;
  console.log("당신은 클릭했다 : " + temp);

  if (temp == "delete") {
    deleteTask(e); // 4-1. 삭제
  } else if (temp == "content") {
    edit(e); //4-3. 목록 맨위로
  } else {
    checkTask(e); // 4-2. 체크
  }
  all_del(); //전부지워지면 tasksBoard display=none
}

// 4-1. 삭제 --------------------------------------------------------
function deleteTask(e) {
  console.log("--4-1. 삭제---");
  // 클릭한 아이콘의 부모 노드 ....<li> </li>
  const this_li = e.target.parentNode;
  // 그 부모의 부모 노드.....<ul> </ul>
  const this_parent = this_li.parentNode;
  // <ul>로부터 그 자식인 <li>삭제
  this_parent.removeChild(this_li);
  //
  document.getElementById("task").focus(); //입력창focus
}

// 4-2. 체크 --------------------------------------------------------
function checkTask(e) {
  console.log("--4-2. 체크---");
  const a1 = e.target; // 옆 형제 요소 선택
  const a2 = a1.parentNode;
  const a3 = a2.nextSibling.nextSibling;
  console.log(a1);
  //<input class="chkbox" type="checkbox">
  console.log(a2);
  //<div class="content_wrap"> ...</div>
  console.log(a3);
  //<div class="content_wrap"> <input class="content" type="text" value="1">

  if (a1.checked) {
    //if 체크되있으면
    console.log("checked");
    chk_on_css(a3);
  } else {
    // 체크 아니라면
    console.log("not checked");
    chk_off_css(a3); //a01 a02
  }
}

//4-3 수정 --------------------------------------------------------
function edit(e) {
  console.log("--4-3 수정---");
  const this_li = e.target.parentNode;
  const this_chk = this_li.previousSibling.previousSibling.childNodes[1];
  console.log(e.target); // <input class="content" type="text" value="1111">
  console.log(this_li); // <div> <input class="content" type="text" value="1111"> </div>
  console.log(this_chk); // <input class="chkbox" type="checkbox">

  if (this_chk.checked) {
    console.log("체크된 내용 수정 시도...");
    chk_off_css(this_li); //a01 a02
  }
}

// 4-4. 체크/!체크  style 정리 --------------------------------------------------------
function edit_done(e) {
  console.log("4.4 체크된거 lostfocus? 스타일정리");
  const this_li = e.target.parentNode;
  const this_chk = this_li.previousSibling.previousSibling.childNodes[1];
  console.log(e.target); // <input class="content" type="text" value="1111">
  console.log(this_li); // <div> <input class="content" type="text" value="1111"> </div>
  console.log(this_chk); // <input class="chkbox" type="checkbox">

  if (this_chk.checked) {
    chk_on_css(this_li); //a01 a02
  }
}

//5. 전부삭제되면  .tasksBoard").style.display = "none" --------------------------------------------------------
function all_del() {
  console.log("--5---index check");
  let li_cnt = document.getElementsByClassName("delete").length; // <lil> 길이
  if (li_cnt == 0) {
    //0이면
    document.getElementById("tasksBoard").style.display = "none"; // 감춘다
    console.log("5 clear!!!");
    document.getElementById("task").focus();
  } else {
    console.log(li_cnt + " need to be 0");
  }
}

// 6. 체크된 할일만 지우는 로직 --------------------------------------------------------
function checked_del() {
  let li_cnt = document.getElementsByClassName("chkbox").length;
  console.log("--6.---할일 총 몇개?  " + li_cnt);
  let cnt_checked = 0;
  for (let i = 0; i < li_cnt; i++) {
    const temp = document.getElementsByClassName("chkbox")[i];
    // @ts-ignore
    if (temp.checked) {
      cnt_checked++;
    }
  } // for end() > count checked
  console.log("체크된거 몇개? : " + cnt_checked);
  // a. 체크 갯수만큼 반복
  for (let i = 0; i < cnt_checked; i++) {
    for (let j = 0; j < li_cnt; j++) {
      const temp = document.getElementsByClassName("chkbox")[j];
      // @ts-ignore
      if (temp.checked) {
        console.log(i + " 번 is checked");
        const temp_p = temp.parentNode;
        temp_p.parentElement.remove();
        console.log("지웠다. break!!!");
        break; // 지웠으면 for 그만!!!
      } else {
      }
    } //for j end
    console.log("----" + i + "번째 checked 삭제");
  } //for i end
  all_del(); //전부지워지면 tasksBoard display=none
  console.log("6 job done");
}

//a01. 체크된 서식 적용 --------------------------------------------------------
function chk_on_css(tt) {
  // tt.style.filter = "grayscale(100%)";
  tt.style.filter = "blur(2px)";
}

//a02. 체크풀린 서식 적용 --------------------------------------------------------
function chk_off_css(tt) {
  // tt.style.filter = "grayscale(0%)";
  tt.style.filter = "blur(0px)";
}
