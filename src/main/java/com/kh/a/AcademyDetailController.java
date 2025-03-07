package com.kh.a;

import common.Common;
import dao.AcademyDao;
import dao.InstructorDao;
import dao.ScheduleDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import vo.*;

import java.util.List;

@Controller
public class AcademyDetailController {

    AcademyDao academyDao = new AcademyDao();
    ScheduleDao scheduleDao = new ScheduleDao();
    InstructorDao instructorDao = new InstructorDao();

    public void setAcademyDao(AcademyDao academyDao) {
        this.academyDao = academyDao;
    }

    public void setScheduleDao(ScheduleDao scheduleDao) {
        this.scheduleDao = scheduleDao;
    }

    public void setInstructorDao(InstructorDao instructorDao) {
        this.instructorDao = instructorDao;
    }

    @RequestMapping("/academy_detail.do")
    public String academy_detail_page(Model model, int academy_idx) {

        //지역 버튼 조회
        List<AcademyVO> region = academyDao.selectRegion();

        //카테고리 버튼 조회
        List<AcademyVO> category = academyDao.selectCategory();

        //학원 한개 조회
        AcademyVO vo = academyDao.academyDetail(academy_idx);

        //학원 후기 평균
        RatingVO rating_num = academyDao.academyRating(academy_idx);

        //학원 후기
        List<AcademyReviewVO> review = academyDao.academyReview(academy_idx);

        //강사 조회
        List<InstructorVO> insvo = instructorDao.instructorMember(academy_idx);

        //학원 사진 조회
        List<PicVO> pic = academyDao.picView(academy_idx);

        //스케쥴 조회
        List<ScheduleVO> schedules = scheduleDao.academySchedules(academy_idx);
        String[] hours = new String[] {"09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00"};
        String[] days = new String[] {"월", "화", "수", "목", "금", "토"};

        model.addAttribute("vo", vo);
        model.addAttribute("region", region);
        model.addAttribute("category", category);
        model.addAttribute("hours", hours);
        model.addAttribute("days", days);
        model.addAttribute("schedules", schedules);
        model.addAttribute("insvo", insvo);
        model.addAttribute("rating_num", rating_num);
        model.addAttribute("review", review);
        model.addAttribute("pic", pic);

        return Common.detail.VIEW_PATH + "stepupAcademyDetail.jsp";
    }

    @RequestMapping("/reviewWritePage.do")
    public String reviewWritePage(int academy_idx, String stepup_id, String academy_id, Model model) {

        model.addAttribute("stepup_id", stepup_id);
        model.addAttribute("academy_id", academy_idx);
        model.addAttribute("academy_idx", academy_idx);

        return Common.detail.VIEW_PATH + "stepupAcademyReview.jsp";

    }

    @RequestMapping("/reviewWrite.do")
    public String reviewWrite(AcademyReviewVO vo){

        academyDao.academyReviewWrite(vo);

        return "redirect:academy_detail.do?academy_idx=" + vo.getAcademy_idx();

    }
}
