package common;

public class Common {

    public static class main{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/mainPage/";
    }

    public static class detail{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/detailPage/";
    }

    public static class search{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/searchPage/";
    }

    public static class login{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/loginPage/";
    }

    public static class information{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/myInformation/";
    }

    public static class academyinformation{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/myInformation/academyInformation/";
    }

    public static class instructorinformation{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/myInformation/instructorInformation/";
    }

    public static class stepupinformation{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/myInformation/memberInformation/";
    }

    public static class cart{
        public static final String VIEW_PATH = "/WEB-INF/views/Page/cartPage/";
    }

    public static class profile{

        public static final String VIEW_PATH = "/WEB-INF/views/Page/profilePage/";
    }

    //일반게시판
    public static class Board{

        public final static String VIEW_PATH = "/WEB-INF/views/Page/boardPage/";

        //한 페이지에 보여줄 게시글 수
        public final static int BLOCKLIST = 10;

        //하단 페이지 메뉴의 수
        //<- 1 2 3 ->
        public final static int BLOCKPAGE = 3;
    }

    //댓글 페이징
    public static class Comment{

        public final static String VIEW_PATH = "/WEB-INF/views/comment/";

        //한 페이지에 보여줄 게시글 수
        public final static int BLOCKLIST = 5;

        //하단 페이지 메뉴의 수
        //<- 1 2 3 ->
        public final static int BLOCKPAGE = 3;
    }


}





