<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet'
   href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
   src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
   href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet" href="${contextPath}/resources/css/seat.css">
</head>

<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
   
   
   <div class="select-container">
      <div class="select-wrapper">
         <div class="select-title">�원/좌석</div>
         <div class="select-seat-container">
            <div class="select-seat-number-container">
               <div class="select-seat-number-wrapper">
                  <div class="select-seat">
                     <div class="select-seat-age">�반</div>
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
                     <div class="select-seat-age">첆�/div>
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
                  <div class="reserve-number-title">�택좌석 /div>
                  <div class="reserve-number">0</div>
               </div>
            </div>
            <div class="select-seat-information">
               <div class="selected-movie">${title }</div>
               <div class="select-seat-information-wrapper">
               	  
                  
                  <div class="select-theater-place selected-theater-place-info">${theater }관</div>
                  <div class="select-theater-place">
                     <span>��좌석</span><span class="remain-seats">152</span>/<span
                        class="all-seats">172</span>
                  </div>

               </div>
               <div class="select-theater-date">
                  <div class="theater-date"></div>
                  <div class="theater-time"></div>
               </div>
               <div class="selected-seats-wrapper">
                  <span class="selected-seats-title">좌석번호</span> <span
                     class="selected-seats">�택좌석�습�다.</span>
               </div>
               <div class="ticket-price-wrapper">
                  <div class="ticket-price-title">가�/div>
                  <div class="ticket-price">0/div>
               </div>
               <form action="moveKakao.do" class="seatForm" method="post">
                  <input type="hidden" class="title" name="title"> <input
                     type="hidden" class="selectedTheater" name="selectedTheater">
                  <input type="hidden" class="reserveDate" name="movieDate">
                  <input type="hidden" class="runningTime" name="runningTime">
                  <input type="hidden" class="movieAge" name="movieAge"
                     value="">
                  <!-- �켓�수(�택좌석) -->
                  <input type="hidden" class="ticketNumber" name="ticketNumber">
                  <input type="hidden" class="selectedSeat" name="selectedSeat">
                  <!-- 결제 �보 -->
                  <input type="hidden" class="payMoney" name="payMoney">
                  <button type="button" class="reserve-button">
                     결제�기<img src="./images/payment_icon_yellow_medium.png">
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
<script >
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

//�약 관
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

//버튼�릭�른 class 추� 초기�해주기
function selectSeatList(list) {
    allNumber = 0;
    allMoney = 0;
    list.forEach(li => {
        //�릭�에 �른 class초기�해주기
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
            ticketPrice.innerHTML = allMoney + ';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');
                allMoney -= normalMoney;
                allNumber = allNumber - normalNumber;

                selectNumberNormal[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + ';
            }
        } else if (li.parentNode.classList.contains('select-seat-ul-teen')) {
            teenNumber = Number(li.innerHTML);
            teenMoney = 8000 * teenNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + ';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');
                //normalNumber = teenNumber = oldNumber = 0;
                allMoney -= teenMoney;
                allNumber = allNumber - teenNumber;

                selectNumberTeen[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + ';
            }
        } else if (li.parentNode.classList.contains('select-seat-ul-old')) {
            oldNumber = Number(li.innerHTML);
            oldMoney = 8000 * oldNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + ';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');

                allMoney -= oldMoney;
                allNumber = allNumber - oldNumber;

                selectNumberOld[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + ';
            }
        }

        // allNumber = normalNumber + teenNumber + oldNumber;
        // allMoney = normalMoney + teenMoney + oldMoney;
        console.log(allNumber + '뭥�');
        ticketPrice.innerHTML = allMoney + ';

        if (allNumber > 16) {
            console.log(li);
            li.classList.remove('select-seat-ul-active');
            // normalNumber = teenNumber = oldNumber = 0;
            toastr.error(
                '<div style="color:white">지�한 �원�� �었�니최� 8�</div>',
                '<div style="color:white">�원�인</div>', {
                    timeOut: 4000,
                }
            );
        }
        payMoney.value = allMoney;
        console.log(allMoney);
    });
}

selectSeatList(selectSeatListNormal);
selectSeatList(selectSeatListTeen);
selectSeatList(selectSeatListOld);

for (let i = 0; i < 10; i++) {
    div = document.createElement('div');
    div.classList = 'seatButtonWrapper';
    seatWrapper.append(div);

    for (let j = 0; j < 12; j++) {
        const input = document.createElement('input');
        input.type = 'button';
        input.name = 'seats';
        input.classList = 'seat';
        //3중포문을 �용�� �기�해
        mapping(input, i, j);
        div.append(input);
        //�릭�벤
        inputClickEvent(input);
    }

    seat = document.querySelectorAll('.seat');
    remainSeat.innerHTML = seat.length;
    allSeat.innerHTML = seat.length;
}

seat.forEach(data => {
    //console.log(data.value.substring(1, data.value.length));
    // console.log(data.value.substring(0, data.value.length - 1));
    //좌석29록나�얘�� �쪽�나 �른쪽으롄워주기�한 class추�
    if (data.value.substring(1, data.value.length) === '2') {
        data.classList.add('left-margin');
    } else if (data.value.substring(1, data.value.length) === '9') {
        data.classList.add('right-margin');
    }
    //�자리� E로끝�는 좌석�에 class 추�
    if (
        data.value.substring(0, data.value.length - 1) === 'E' ||
        data.value.substring(0, data.value.length - 2) === 'E'
    ) {
        data.classList.add('top-margin');
    }
});

//TODO 좌석 2개씩� 커플�으�분리�기�해�당 class�추�줘�하�데 value가 2로끝�는�들�랑 7로끝�는 �들� class�추�주�

function inputClickEvent(input) {
    input.addEventListener('click', function(e) {
        console.log(e.target.value);
        //중복방� �수
        selectedSeatsArray = selectedSeatsArray.filter(
            (element, index) => selectedSeatsArray.indexOf(element) != index
        );

        //click class가 존재�때(�거�주toggle)
        if (input.classList.contains('clicked')) {
            input.classList.remove('clicked');
            clicked = document.querySelectorAll('.clicked');

            //배열�의 개거
            selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
            //class가 존재�할추�주toggle
        } else {
            input.classList.add('clicked');
            clicked = document.querySelectorAll('.clicked');
            //�택번호갈�류기멙작 못하겘는 코드
            console.log(allNumber);
            if (clicked.length > allNumber) {
                input.classList.remove('clicked');
                toastr.error(
                    '<div style="color:white">지�한 �원�� �었�니/div>',
                    '<div style="color:white">�원�인</div>', {
                        timeOut: 4000
                    }
                );
                return;
            }

            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
        }

        console.log(selectedSeatsArray.length);
        console.log(selectedSeatsArray);
        //좌석번호innerHTML �정
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

//form �출hidden�정�기
reserveButton.addEventListener('click', function() {
    title.value = selectedMovie.innerHTML;
    selectedTheater.value =
        selectedTheaterPlaceInfo[0].innerHTML +
        ' ' +
        selectedTheaterPlaceInfo[1].innerHTML;
    reserveDate.value = theaterDate.innerHTML;
    runningTime.value = theaterTime.innerHTML;
    ticketNumber.value = reserveNumber.innerHTML;
    selectedSeat.value = selectedSeats.innerHTML;
    console.log(allNumber + ');
    console.log(ticketNumber.value);
    console.log(allNumber === ticketNumber.value);
    console.log(allNumber === Number(ticketNumber.value));
    if (
        Number(ticketNumber.value) === allNumber &&
        ticketNumber.value !== '0' &&
        ticketNumber.value !== 0
    ) {
        seatForm.submit();
    } else {
        alert('좌석모두�택주세');
    }
}); 
</script>

</html> 