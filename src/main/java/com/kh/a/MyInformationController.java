package com.kh.a;

import common.Common;
import dao.AcademyDao;
import dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vo.AcademyReviewVO;
import vo.AcademyVO;
import vo.InstructorVO;
import vo.StepupMemberVO;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyInformationController {

    LoginDao loginDao;
    @Autowired
    private AcademyDao academyDao;

    public void setLoginDao(LoginDao loginDao) {
        this.loginDao = loginDao;
    }

    @RequestMapping("/member_info.do")
    public String member_info(Model model, String id, String userType, HttpSession session, int idx) {
        System.out.println(userType);
        if(userType.equals("stepup")) {

            StepupMemberVO infor = loginDao.stepupSelect(id);
            model.addAttribute("infor", infor);

            return Common.information.VIEW_PATH + "memberInformatioSelect.jsp";

        } else if(userType.equals("academy")) {

            int count = academyDao.resumeCount(idx);
            AcademyVO infor = loginDao.academySelect(id);

            model.addAttribute("infor", infor);
            model.addAttribute("count", count);

            return Common.information.VIEW_PATH + "academyInformatioSelect.jsp";

        } else if(userType.equals("instructor")) {

            InstructorVO infor = loginDao.instructorSelect(id);
            model.addAttribute("infor", infor);

            return Common.information.VIEW_PATH + "instructorInformatioSelect.jsp";
        }

        return  Common.information.VIEW_PATH + "404.jsp"; // 예외 처리
    }

    @RequestMapping("/reviewSelect.do")
    public String reviewSelect(String stepup_id, Model model) {

        List<AcademyReviewVO> review = academyDao.academyReviewMember(stepup_id);
        model.addAttribute("review", review);
        model.addAttribute("stepup_id", stepup_id);

        return Common.stepupinformation.VIEW_PATH + "stepupMemberReview.jsp";
    }

    @RequestMapping("/reviewDelete.do")
    public String reviewDelete(int review_idx, String stepup_id) {

        academyDao.academyReviewDelete(review_idx);

        return "redirect:/reviewSelect.do?stepup_id=" + stepup_id;

    }

    @RequestMapping("/reviewModifyPage.do")
    public String reviewModifyPage(int review_idx, String stepup_id ,Model model) {

        AcademyReviewVO vo = academyDao.academyReviewSelect(review_idx);
        model.addAttribute("vo", vo);
        model.addAttribute("stepup_id", stepup_id);

        return Common.stepupinformation.VIEW_PATH + "AcademyReviewModify.jsp";
    }

    @RequestMapping("/stepupReviewModify.do")
    public String stepupReviewModify(AcademyReviewVO vo) {

        academyDao.academyReviewUpdate(vo);

        return "redirect:/reviewSelect.do?stepup_id=" + vo.getStepup_id();
    }
}
