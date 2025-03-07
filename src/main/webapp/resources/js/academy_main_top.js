document.addEventListener("DOMContentLoaded", () => {
    let category_button = document.getElementById("category_button");
    let region_button = document.getElementById("region_button");
    let academy_button = document.getElementById("academy_button");
    let category_btn = document.getElementById("category_btn");
    let region_btn = document.getElementById("region_btn");
    let academy_btn = document.getElementById("academy_btn");
    let searchBar = document.querySelector('.search_bar');
    let button_search = document.querySelector('.button_search');
    let main = document.querySelector('.main');
    let category_box = document.querySelector('.category_box');
    let region_box = document.querySelector('.region_box');
    let isSmall = false;
    const head = document.querySelector('.head');
    let icon = document.getElementById('icon');




    let buttons = [category_button, region_button, academy_button];

    function hover_re(button) {
        button.classList.add("hover-r");
    }

    function hover_c(event) {

        if (!buttons.some((button) => button.contains(event.target))) {
            buttons.forEach((button) => button.classList.remove("hover-r"));
        }
        if (!category_box.contains(event.target) && !category_button.contains(event.target)) {
            category_box.classList.remove("show");
        }
        if (!region_box.contains(event.target) && !region_button.contains(event.target)) {
            region_box.classList.remove("show");
        }

    }

    category_button.addEventListener("click", () => {
        hover_re(category_button);
        if (isSmall) {
            toggleSmall();
            isSmall = false;
            main.style.backgroundColor = "rgba(245, 245, 245, 0.5)";


        }
        category_box.classList.add("show");
        category_btn.focus();


    });

    region_button.addEventListener("click", () => {
        hover_re(region_button);
        if (isSmall) {
            toggleSmall();
            isSmall = false;
            main.style.backgroundColor = "rgba(245, 245, 245, 0.5)";


        }
        region_box.classList.add("show");
        region_btn.focus();

    });

    academy_button.addEventListener("click", () => {
        hover_re(academy_button);
        if (isSmall) {
            toggleSmall();
            isSmall = false;
            main.style.backgroundColor = "rgba(245, 245, 245, 0.5)";


        }
        academy_btn.focus();

    });


    document.addEventListener("click", hover_c);



    function toggleSmall() {

        let search_inputs = document.querySelectorAll('.search_input');
        let label = document.querySelector('.label1');
        let icon = document.querySelector('.icon_button');
        let academyButton = document.getElementById("academy_button");

        if (!isSmall) {
            // 작아지는 상태
            search_inputs.forEach((input) => {
                input.style.display = "none";
            });
            if (label) label.style.display = "none";


            icon.style.width = "40px";
            icon.style.height = "40px";
            searchBar.style.width = '510px';
            searchBar.style.height = "50%";
            button_search.style.width = "120px";
            academyButton.style.paddingTop = "5px";
            academy_button.style.width = "140px";
            academy_button.style.paddingLeft = "10px";
            region_button.style.width = "120px";
            head.style.height = "90px";
        } else {
            // 원래 크기로 복원
            search_inputs.forEach((input) => {
                input.style.display = "flex";
            });
            if (label) label.style.display = "flex";

            icon.style.width = "100px";
            icon.style.height = "60px";
            searchBar.style.width = '900px';
            searchBar.style.height = "60%";
            button_search.style.width = "250px";
            academy_button.style.width = "235px";
            academyButton.style.paddingTop = "0px";
            academy_button.style.paddingLeft = "12px";
            academy_button.style.paddingRight = "10px";
            region_button.style.width = "251px";
            head.style.height = "120px";
        }

        isSmall = !isSmall;
    }



    window.addEventListener('scroll', () => {

        const scrollPosition = window.scrollY;


        if (scrollPosition > 100 && !isSmall) {
            toggleSmall();
            main.style.backgroundColor = "";
            category_box.classList.remove("show");
            region_box.classList.remove("show");
            buttons.forEach((button) => {
                button.classList.add("hover-r");
            });


        } else if (scrollPosition <= 100 && isSmall) {
            toggleSmall();
            main.style.backgroundColor = "";
            category_box.classList.remove("show");
            region_box.classList.remove("show");
            buttons.forEach((button) => {
                button.classList.remove("hover-r");
            });
        }


    });
});

function member_drop(){
    const memberInfo = document.querySelector('.member_info');
    if (memberInfo.style.display === 'none' || memberInfo.style.display === '') {
        memberInfo.style.display = 'flex';
    } else {
        memberInfo.style.display = 'none';
    }
}

function search_subject(category) {

    const url = "search_subject.do?keyword=" + encodeURIComponent(category);
    window.location.href = url;
}

function search_region(region) {

    const url = "search_region.do?keyword=" + encodeURIComponent(region);
    window.location.href = url;
}

function search_name() {
    let category_keyword = document.getElementById('category_btn').value.trim();
    let region_keyword = document.getElementById('region_btn').value.trim();
    let academy_keyword = document.getElementById("academy_btn").value.trim();

    if ((category_keyword !== '' && region_keyword !== '') ||
        (category_keyword !== '' && academy_keyword !== '') ||
        (region_keyword !== '' && academy_keyword !== '')) {
        alert("하나의 검색 영역에만 입력해주세요.");
        return;
    }

    // 카테고리 검색이 입력된 경우
    if (category_keyword !== '') {
        const url = "search_subject.do?keyword=" + encodeURIComponent(category_keyword);
        window.location.href = url;
    }
    // 지역 검색이 입력된 경우
    else if (region_keyword !== '') {
        const url = "search_region.do?keyword=" + encodeURIComponent(region_keyword);
        window.location.href = url;
    }
    // 학원 검색이 입력된 경우
    else if (academy_keyword !== '') {
        // JSP에서 academy_keyword를 제대로 처리하기 위해
        const url = "search_name.do?keyword=" + encodeURIComponent(academy_keyword);
        window.location.href = url;
    }
    // 아무것도 입력되지 않은 경우
    else {
        alert("검색어를 입력하세요.");
    }
}

function click_icon(id) {

    const url = "search_subject.do?keyword=" + encodeURIComponent(id);
    window.location.href = url;
    
}