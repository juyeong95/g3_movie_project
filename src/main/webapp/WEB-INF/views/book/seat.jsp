<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>


function requestPay() {
    var date = new Date();
    var time = date.getTime();
	let email = {$}
	
    var IMP = window.IMP; // 생략 가능
	IMP.init("imp36024730"); // 예: imp00000000
	//IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "merchant_"+time,
        name: "영화 예매",
        amount: allMoney,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
    	if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
    	      // jQuery로 HTTP 요청
    	      jQuery.ajax({
    	          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
    	          method: "POST",
    	          headers: { "Content-Type": "application/json" },
    	          data: {
    	              imp_uid: rsp.imp_uid,
    	              merchant_uid: rsp.merchant_uid
    	              //기타 필요한 데이터가 있으면 추가 전달
    	          }
    	         
    	      }).done(function (data) {
    	        // 가맹점 서버 결제 API 성공시 로직
    	      })
    	      fo.submit()
    	    } else {
    	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    	    }
    	  });
  }

</script>

<link rel='stylesheet'
   href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
   src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
   href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- MATERIAL DESIGN ICONIC FONT -->

<link rel="stylesheet" href="${contextPath }/resources/css/seat.css">

<style type="text/css">
/* content */

.select-container {
    margin-top: 140px;
}

.select-wrapper {
    width: 900px;
    background-color: #F2F0E5;
    margin: 0 auto;
    border-left: 1px solid #dddddd;
    border-right: 1px solid #dddddd;
}

.select-title {
    background-color: #444444;
    color: #dddddd;
    font-size: 16px;
    text-align: center;
    padding: 10px;
}

.select-seat-container {
    display: flex;
    /* align-items: center; */
    border-bottom: 2px solid #dddddd;
}

.select-seat-number-container {
    flex-grow: 1;
    border-right: 1px solid #dddddd;
    display: flex;
}

.select-seat-number-wrapper {
    padding: 15px 0 20px 20px;
    flex-grow: 1;
}

.select-seat-ul {
    display: flex;
    list-style:none;
}

.select-seat-ul>li {
    width: 20px;
    height: 20px;
    border: 1px solid #dddddd;
    text-align: center;
    font-weight: bold;
    /* line-height: 15px; */
    /* padding: 5px; */
    padding: 2px;
}

.select-seat-ul>li:hover {
    color: white;
    background-color: #222222;
    cursor: pointer;
}

.select-seat-ul-active {
    color: white;
    background-color: #222222;
}

.select-seat-ul>li:not(:first-child) {
    margin-left: 5px;
}

.select-seat-information {
    flex-grow: 1;
    padding: 15px 0 20px 20px;
}

.select-seat {
    display: flex;
    font-size: 12px;
}

.select-seat:not(:first-child) {
    margin-top: 12px;
}

.select-seat-age {
    width: 40px;
}

.select-seat-number {
    margin-left: 15px;
}

.reserve-number-wrapper {
    flex-grow: 1;
    padding-top: 15px;
    border-left: 1px solid #DDDDDD;
    text-align: center;
}

.reserve-number {
    margin-top: 20px;
    font-size: 34px;
    font-weight: bold;
}

.selected-movie {
	font-size: 20px;
    margin-bottom: 5px;
    font-weight: bold;
}

.select-seat-information-wrapper {
    display: flex;
}

.select-theater-place {
    font-size: 12px;
}

.select-theater-place:not(:last-child) {
    width: 55px;
    border-right: 1px solid #dddddd;
}

.select-theater-place:last-child {
    width: 150px;
    /* border-right: 1px solid #dddddd; */
}

.select-theater-place:not(:first-child) {
    margin-left: 12px;
}

.select-theater-date {
    /*  font-size: 18px;
    margin-top: 8px;
    font-weight: bold; */
    display: flex;
}

.select-theater-date>div {
    font-size: 18px;
    margin-top: 8px;
    font-weight: bold;
}

.theater-time {
    margin-left: 5px;
}

.remain-seats {
    margin-left: 3px;
    color: rgba(255, 0, 0, 0.6);
    font-weight: bold;
}

.selected-seats-wrapper {
    margin-top: 5px;
}

.selected-seats {
    font-size: 13px;
    word-spacing: 2px;
    margin-left: 20px;
}

.selected-seats-title {
    color: black;
    font-size: 13px;
    font-weight: bold;
}

.ticket-price-wrapper{
	margin-top: 5px;
	display: flex;
	align-items: center;
}
.ticket-price-wrapper>div{	
	font-weight: bold;
}
.ticket-price-title{
	font-size: 13px;
}

.ticket-price {
	margin-left: 47px;
	font-size:20px;
}

.reserve-button {
    margin-top: 5px;
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 13px;
    padding: 0;
}

.reserve-button img {
    margin-left: 20px;
    width: 60px;
}

.seat-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.screen-view {
    width: 140px;
    color: #777777;
    padding-top: 30px;
    font-size: 30px;
    text-align: center;
    margin: 0 auto 30px auto;
    border-bottom: 1px solid #666666;
    letter-spacing: 4px;
}

.seat-wrapper {
    background-color: #222222;
    width: 700px;
    height: 460px;
    /* padding-top: 120px; */
}

.seat {
    width: 30px;
    height: 30px;
}

.seat {
    font-size: 13px;
    background-color: #555555;
    color: white;
    border: 1px solid rgba(255, 0, 0, 0.6);
}

.seat:hover {
    background-color: red;
    color: white;
    cursor: pointer;
}

.seat:active {
    background-color: red;
    color: white;
}

.dis {
   
   width: 30px;
   height: 30px;
   opacity: 0.6;
   cursor: not-allowed;
}


.clicked {
    background-color: red;
    color: white;
}

.seatButtonWrapper {
    text-align: center;
}

.seatButtonWrapper>input {
    width: 30px;
    height: 30px;
}

.left-margin {
    margin-left: 30px;
}

.right-margin {
    margin-right: 30px;
}

.top-margin {
    margin-top: 30px;
} 
</style>

</head>

<body>
<c:import url="../default/header.jsp"/>

  <div class="wrap">
 
   
   <div class="select-container">
      <div class="select-wrapper">
         <div class="select-title">인원/좌석</div>
         <div class="select-seat-container">
            <div class="select-seat-number-container">
               <div class="select-seat-number-wrapper">
                  <div class="select-seat">
                     <div class="select-seat-age">일반</div>
                     <div class="select-seat-number">
                        <ul class="select-seat-ul select-seat-ul-normal">
                           <li class="select-number-normal ">0</li>
                           <li class="select-number-normal">1</li>
                           <li class="select-number-normal">2</li>
                           <li class="select-number-normal">3</li>
                           <li class="select-number-normal">4</li>
                           <li class="select-number-normal">5</li>
                           <!--  <li class="select-number-normal">6</li>
                                    <li class="select-number-normal">7</li>
                                    <li class="select-number-normal">8</li> -->
                        </ul>
                     </div>
                  </div>
                  <div class="select-seat">
                     <div class="select-seat-age">청소년</div>
                     <div class="select-seat-number">
                        <ul class="select-seat-ul select-seat-ul-teen">
                           <li class="select-number-teen">0</li>
                           <li class="select-number-teen">1</li>
                           <li class="select-number-teen">2</li>
                           <li class="select-number-teen">3</li>
                           <li class="select-number-teen">4</li>
                           <li class="select-number-teen">5</li>
    
                        </ul>
                     </div>
                  </div>

               </div>
               <div class="reserve-number-wrapper">
                  <div class="reserve-number-title">선택된 좌석 수</div>
                  <div class="reserve-number">0</div>
               </div>
            </div>
            <div class="select-seat-information">
               <div class="selected-movie">${title }</div>
               <div class="select-seat-information-wrapper">
               	  
                  
                  <div class="select-theater-place selected-theater-place-info">${theater }관</div>
                  <div class="select-theater-place">
                     <span class="remain-seats" style="display:none"></span><span
                        class="all-seats" style="display:none"></span>
                  </div>

               </div>
               <div class="select-theater-date">
                  <div class="theater-date"></div>
                  <div class="theater-time"></div>
               </div>
               <div class="selected-seats-wrapper">
                  <span class="selected-seats-title">좌석번호</span> <span
                     class="selected-seats">선택한 좌석이 없습니다.</span>
               </div>
               <div class="ticket-price-wrapper">
                  <div class="ticket-price-title">가격</div>
                  <div class="ticket-price">0원</div>
               </div>
                 <form id="fo"class="seatForm" action="${pageContext.request.contextPath}/payment" method="get">
                 
                  <input type="hidden" name="title" value="${title }"> 
                  <input type="hidden" name="time" value="${time }"> 
                  <input type="hidden" name="theater" value="${theater }"> 
                  <input type="hidden" name="i" value="${i }"> 
                  <input type="hidden" name="pn" value="${loginUser }"> 
                  <!-- 티켓의수(선택한 좌석) -->
                  <input type="hidden" class="ticketNumber" name="ticketNumber">
                  <input type="hidden" class="selectedSeat" name="selectedSeat">
                  <!-- 결제 정보 -->
                  <input type="hidden" class="payMoney" name="payMoney">
                   <button type = "button"  class="reserve-button">
                     결제하기
               		</button>
                  
               </form>  
               
               
              
            </div>

         </div>
         <div class="seat-container">

            <div class="seat-wrapper">
               <div class="screen-view-wrapper">
                  <div class="screen-view">SCREEN</div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <c:import url="../default/footer.jsp"/>
</body>
<script>
let test = [];
let selectedSeatsArray = new Array();
const seatWrapper = document.querySelector('.seat-wrapper');
let clicked = '';
let div = '';
let seat = document.querySelectorAll('.seat');
const selectedSeats = document.querySelector('.selected-seats');
const allSeat = document.querySelector('.all-seats');
const remainSeat = document.querySelector('.remain-seats');
const reserveNumber = document.querySelector('.reserve-number');
const selectSeatListNormal = document.querySelectorAll(
    '.select-seat-ul-normal li'
);
const selectSeatListTeen = document.querySelectorAll('.select-seat-ul-teen li');
const selectSeatListOld = document.querySelectorAll('.select-seat-ul-old li');
let selectSeatListUlActive = '';
let normalNumber = 0;
let teenNumber = 0;
let oldNumber = 0;
let allNumber = 0;
let prevNumber = 0;
let normalMoney = 0;
let teenMoney = 0;
let oldMoney = 0;
let allMoney = 0;

const selectNumberNormal = document.querySelectorAll('.select-number-normal');
const selectNumberTeen = document.querySelectorAll('.select-number-teen');
const selectNumberOld = document.querySelectorAll('.select-number-old');

//예약 관련
const selectedMovie = document.querySelector('.selected-movie');
const selectedTheaterPlaceInfo = document.querySelectorAll(
    '.selected-theater-place-info'
);
const theaterTime = document.querySelector('.theater-time');
const theaterDate = document.querySelector('.theater-date');
const ticketPrice = document.querySelector('.ticket-price');
const payMoney = document.querySelector('.payMoney');

const seatForm = document.querySelector('.seatForm');
const reserveButton = document.querySelector('.reserve-button');
const title = document.querySelector('.title');
const selectedTheater = document.querySelector('.selectedTheater');
const reserveDate = document.querySelector('.reserveDate');
const runningTime = document.querySelector('.runningTime');
const ticketNumber = document.querySelector('.ticketNumber');
const selectedSeat = document.querySelector('.selectedSeat');

toastr.options = {
    positionClass: 'toast-top-right',
    progressBar: true,
    timeOut: 1000,
    preventDuplicates: true,
};

//버튼클릭시 다른 class 추가 초기화해주기
function selectSeatList(list) {
    allNumber = 0;
    allMoney = 0;
    list.forEach(li => {
        //클릭시에 다른 class초기화해주기
        initList(list, li);
    });
}

function initList(list, li) {
    li.addEventListener('click', function() {
        list.forEach(li => {
            li.classList.remove('select-seat-ul-active');
        });
        li.classList.add('select-seat-ul-active');
        selectSeatListUlActive = document.querySelectorAll(
            '.select-seat-ul-active'
        );
        console.log(selectSeatListUlActive);
        selectListUiFunction(selectSeatListUlActive);
        console.log('머니머니' + allMoney);

        console.log(normalNumber);
        console.log(teenNumber);
        console.log(oldNumber);
        console.log(allNumber);
    });
}

function selectListUiFunction(selectSeatListUlActive) {
    selectSeatListUlActive.forEach(li => {
        if (li.parentNode.classList.contains('select-seat-ul-normal')) {
            normalNumber = Number(li.innerHTML);
            normalMoney = 11000 * normalNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');
                allMoney -= normalMoney;
                allNumber = allNumber - normalNumber;

                selectNumberNormal[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + '원';
            }
        } else if (li.parentNode.classList.contains('select-seat-ul-teen')) {
            teenNumber = Number(li.innerHTML);
            teenMoney = 8000 * teenNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');
                //normalNumber = teenNumber = oldNumber = 0;
                allMoney -= teenMoney;
                allNumber = allNumber - teenNumber;

                selectNumberTeen[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + '원';
            }
        } else if (li.parentNode.classList.contains('select-seat-ul-old')) {
            oldNumber = Number(li.innerHTML);
            oldMoney = 8000 * oldNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');

                allMoney -= oldMoney;
                allNumber = allNumber - oldNumber;

                selectNumberOld[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + '원';
            }
        }

        // allNumber = normalNumber + teenNumber + oldNumber;
        // allMoney = normalMoney + teenMoney + oldMoney;
        console.log(allNumber + '뭥미');
        ticketPrice.innerHTML = allMoney + '원';

        if (allNumber > 16) {
            console.log(li);
            li.classList.remove('select-seat-ul-active');
            // normalNumber = teenNumber = oldNumber = 0;
            toastr.error(
                '<div style="color:white">지정한 인원수를 넘었습니다(최대 8명)</div>',
                '<div style="color:white">인원수 확인</div>', {
                    timeOut: 4000,
                }
            );
          // alert('지정한 인원수를 넘었습니다.');
        }
        payMoney.value = allMoney;
        console.log(allMoney);
    });
}

selectSeatList(selectSeatListNormal);
selectSeatList(selectSeatListTeen);
selectSeatList(selectSeatListOld);


 let seatbook = '${booklist}'; 
 

for (let i = 0; i < 10; i++) {
    div = document.createElement('div');
    div.classList = 'seatButtonWrapper';
    seatWrapper.append(div);

    for (let j = 0; j < 12; j++) {
        const input = document.createElement('input');
        input.type = 'button';
        input.name = 'seats';
        

        // i 0:a 1:b 2:c 3:d 4:e 5:f 6:g 7:h 8:i 9:j

       	 input.classList = 'seat';
      
       
		for (let k=0; k<seatbook.length; k++) {
			if(seatbook[k]=="A" && i==0){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="B" && i==1){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="C" && i==2){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="D" && i==3){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="E" && i==4){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="F" && i==5){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="G" && i==6){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="H" && i==7){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="I" && i==8){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
			if(seatbook[k]=="J" && i==9){
				if(j==seatbook[k+1]){
					input.classList = 'dis';
				}
				
			}
		}

        
        
        
        mapping(input, i, j);
        div.append(input);
        //클릭시 이벤트
        inputClickEvent(input);
        
        
    }

    seat = document.querySelectorAll('.dis , .seat');
    remainSeat.innerHTML = seat.length;
    allSeat.innerHTML = seat.length;
}


seat.forEach(data => {
	
    //console.log(data.value.substring(1, data.value.length));
    // console.log(data.value.substring(0, data.value.length - 1));
    //좌석이 2나 9로 끝나는얘들은 왼쪽이나 오른쪽으로 띄워주기위한 class추가
    if (data.value.substring(1, data.value.length) === '2') {
        data.classList.add('left-margin');
    } else if (data.value.substring(1, data.value.length) === '9') {
        data.classList.add('right-margin');
    }
    //앞자리가 E로끝나는 좌석들에 class 추가
    if (
        data.value.substring(0, data.value.length - 1) === 'E' ||
        data.value.substring(0, data.value.length - 2) === 'E'
    ) {
        data.classList.add('top-margin');
    }
});

//TODO 좌석 2개씩은 커플석으로 분리하기위해서 해당 class를 추가해줘야하는데 value가 2로끝나는얘들이랑 7로끝나는 얘들은 class를 추가해주기

function inputClickEvent(input) {
    input.addEventListener('click', function(e) {
        console.log(e.target.value);
        //중복방지 함수
        selectedSeatsArray = selectedSeatsArray.filter(
            (element, index) => selectedSeatsArray.indexOf(element) != index
        );

        //click class가 존재할때(제거해주는 toggle)
        if (input.classList.contains('clicked')) {
            input.classList.remove('clicked');
            clicked = document.querySelectorAll('.clicked');

            //배열안의 값 제거
            selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
            //class가 존재안할때 추가해주는 toggle
        } else {
            input.classList.add('clicked');
            clicked = document.querySelectorAll('.clicked');
            //선택한 번호의 갯수를 넘기면 동작 못하게 하는 코드
            console.log(allNumber);
            if (clicked.length > allNumber) {
                input.classList.remove('clicked');
               // toastr.error(
                //    '<div style="color:white">지정한 인원수를 넘었습니다</div>',
                //    '<div style="color:white">인원수 확인</div>', {
                //        timeOut: 4000
                //    }
               // );
               alert("지정한 인원수를 넘었습니다.")
                return;
            }

            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
        }

        console.log(selectedSeatsArray.length);
        console.log(selectedSeatsArray);
        //좌석번호의 innerHTML 설정
        selectedSeats.innerHTML = selectedSeatsArray;
        reserveNumber.innerHTML = selectedSeatsArray.length;
        remainSeat.innerHTML = seat.length - selectedSeatsArray.length;
        // if (selectedSeatsArray.length > 4) {
        //     return;
        // }
    });
}

function mapping(input, i, j) {
    if (i === 0) {
        input.value = 'A' + j;
    } else if (i === 1) {
        input.value = 'B' + j;
    } else if (i === 2) {
        input.value = 'C' + j;
    } else if (i === 3) {
        input.value = 'D' + j;
    } else if (i === 4) {
        input.value = 'E' + j;
    } else if (i === 5) {
        input.value = 'F' + j;
    } else if (i === 6) {
        input.value = 'G' + j;
    } else if (i === 7) {
        input.value = 'H' + j;
    } else if (i === 8) {
        input.value = 'I' + j;
    } else if (i === 9) {
        input.value = 'J' + j;
    } else if (i === 10) {
        input.value = 'K' + j;
    }
}

//form 제출시 hidden설정하기
reserveButton.addEventListener('click', function() {
   
    
    ticketNumber.value = reserveNumber.innerHTML;
    selectedSeat.value = selectedSeats.innerHTML;
    console.log(allNumber + '임');
    console.log(ticketNumber.value);
    console.log(allNumber === ticketNumber.value);
    console.log(allNumber === Number(ticketNumber.value));
    if (
        Number(ticketNumber.value) === allNumber &&
        ticketNumber.value !== '0' &&
        ticketNumber.value !== 0
    ) {
    	requestPay();
        
    } else {
        alert('좌석을 모두선택해 주세요!');
    }
}); 







</script>






</html> 