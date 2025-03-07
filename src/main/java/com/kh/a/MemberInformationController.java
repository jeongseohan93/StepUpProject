package com.kh.a;

import common.Common;
import dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vo.StepupMemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
public class MemberInformationController {

    LoginDao loginDao;

    @Autowired
    HttpSession session;


    @Autowired
    HttpServletRequest request;

    public void setLoginDao(LoginDao loginDao) {
        this.loginDao = loginDao;
    }

    @RequestMapping("/member_edit.do")
    public String editMember(String stepup_id, Model model) {

        StepupMemberVO memberInfo = loginDao.getMemberById(stepup_id);
        model.addAttribute("memberInfo", memberInfo); // 이름을 "memberInfo"로 지정
        return Common.stepupinformation.VIEW_PATH + "memberEdit.jsp";
    }

    @RequestMapping("/member_update.do")
    public String updateMember(StepupMemberVO stepupMemberVO) {

        loginDao.updateMember(stepupMemberVO);

        session.removeAttribute("member");

        return "redirect:/login_page.do";
    }


}
