package com.kh.a;

import common.Common;
import dao.AcademyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import vo.AcademyVO;
import vo.InstructorVO;
import vo.PicVO;
import vo.RatingVO;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    AcademyDao academyDao = new AcademyDao();

    public void setAcademyDao(AcademyDao academyDao) {
        this.academyDao = academyDao;
    }

    @RequestMapping(value = {"/", "/mainhome.do" })
    public String mainHome(Model model) {
        int pageSize = 18;
        int startIndex = 0;

        //학원 전체 조회
        List<AcademyVO> list = academyDao.selectAcademy(startIndex, pageSize);

        //지역 버튼 조회
        List<AcademyVO> region = academyDao.selectRegion();

        //카테고리 버튼 조회
        List<AcademyVO> category = academyDao.selectCategory();

        for(AcademyVO academy : list) {
            RatingVO ratingVO = academyDao.academyRating(academy.getAcademy_idx());

            float averageRating = (ratingVO != null ) ? ratingVO.getRating() : 0.0f;

            academy.setAcademy_rating(averageRating);

        }

        model.addAttribute("list", list);
        model.addAttribute("region", region);
        model.addAttribute("category", category);

        return common.Common.main.VIEW_PATH + "stepupMainPage.jsp";
    }

    @RequestMapping(value = "academyList.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String academyList(int page, HttpServletRequest request) {
        System.out.println(page);
        int pageSize = 18;
        int startIndex = (page - 1) * pageSize;

        List<AcademyVO> list = academyDao.selectAcademy(startIndex, pageSize);

        for (AcademyVO academy : list) {
            RatingVO ratingVO = academyDao.academyRating(academy.getAcademy_idx());
            float averageRating = (ratingVO != null) ? ratingVO.getRating() : 0.0f;
            academy.setAcademy_rating(averageRating);
        }

        String contextPath = request.getContextPath();

        StringBuilder html = new StringBuilder();

        for (AcademyVO vo : list) {
            html.append("<div class='academy_content' onclick=\"location.href='")
                    .append(contextPath)
                    .append("/academy_detail.do?academy_idx=")
                    .append(vo.getAcademy_idx())
                    .append("'\">")
                    .append("<div class='img_tag'>")
                    .append("<img src='")
                    .append(contextPath)
                    .append(vo.getAcademy_profile())
                    .append("' class='academy_img' style='width: 265px; height: 260px;' alt='?'>")
                    .append("</div>")
                    .append("<span class='content2'>").append(vo.getAcademy_category()).append("</span>")
                    .append("<span class='content'>").append(vo.getAcademy_name()).append("</span>")
                    .append("<span class='content2'>").append(vo.getAcademy_region()).append("</span>")
                    .append("<div class='star'><i class='fa-solid fa-star'></i>")
                    .append("<span id='star_score'>").append(vo.getAcademy_rating()).append("</span>")
                    .append("</div></div>");
        }

        return html.toString();

    }


    @RequestMapping("search_name.do")
    public String searchName(@RequestParam String keyword, Model model) {
        //지역 버튼 조회
        List<AcademyVO> region = academyDao.selectRegion();

        //카테고리 버튼 조회
        List<AcademyVO> category = academyDao.selectCategory();

        //이름으로 학원 검색
        List<AcademyVO> search_name = academyDao.searchName(keyword);

        for(AcademyVO academy : search_name) {
            RatingVO ratingVO = academyDao.academyRating(academy.getAcademy_idx());

            float averageRating = (ratingVO != null ) ? ratingVO.getRating() : 0.0f;

            academy.setAcademy_rating(averageRating);
        }

        model.addAttribute("region", region);
        model.addAttribute("category", category);
        model.addAttribute("search_name", search_name);
        model.addAttribute("result","검색된 이름 : " + search_name);

        return Common.search.VIEW_PATH + "stepupSearchDetail.jsp";
    }

    @RequestMapping("search_subject.do")
    public String searchSubject(@RequestParam String keyword, Model model) {
        //지역 버튼 조회
        List<AcademyVO> region = academyDao.selectRegion();

        //카테고리 버튼 조회
        List<AcademyVO> category = academyDao.selectCategory();

        //과목으로 학원 검색
        List<AcademyVO> search_region = academyDao.searchSubject(keyword);

        for(AcademyVO academy : search_region) {
            RatingVO ratingVO = academyDao.academyRating(academy.getAcademy_idx());

            float averageRating = (ratingVO != null ) ? ratingVO.getRating() : 0.0f;

            academy.setAcademy_rating(averageRating);
        }

        model.addAttribute("region", region);
        model.addAttribute("category", category);
        model.addAttribute("search_name", search_region);
        model.addAttribute("result","검색된 이름 : " + search_region);

        return Common.search.VIEW_PATH + "stepupSearchDetail.jsp";
    }

    @RequestMapping("search_region.do")
    public String searchRegion(@RequestParam String keyword, Model model) {
        //지역 버튼 조회
        List<AcademyVO> region = academyDao.selectRegion();

        //카테고리 버튼 조회
        List<AcademyVO> category = academyDao.selectCategory();

        //지역으로 학원 검색
        List<AcademyVO> search_region = academyDao.searchRegion(keyword);

        for(AcademyVO academy : search_region) {
            RatingVO ratingVO = academyDao.academyRating(academy.getAcademy_idx());

            float averageRating = (ratingVO != null ) ? ratingVO.getRating() : 0.0f;

            academy.setAcademy_rating(averageRating);
        }

        model.addAttribute("region", region);
        model.addAttribute("category", category);
        model.addAttribute("search_name", search_region);
        model.addAttribute("result","검색된 이름 : " + search_region);

        return Common.search.VIEW_PATH + "stepupSearchDetail.jsp";
    }


}
