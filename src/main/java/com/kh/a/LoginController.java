package com.kh.a;

import common.Common;
import dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.MailSendService;
import vo.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    HttpSession session;

    LoginDao loginDao = new LoginDao();

    public void setLoginDao(LoginDao loginDao) {
        this.loginDao = loginDao;
    }

    //로그인 페이지
    @RequestMapping("/login_page.do")
    public String loginMainPage() {

        return Common.login.VIEW_PATH + "loginMain.jsp";

    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String stepup_login(Model model, String stepup_id, String stepup_pwd, HttpSession session) {

        LoginVO member = loginDao.loginCheck(stepup_id);

        if(member ==  null){
            return "로그인 실패";
        }

        String password = member.getPassword();

        if(password.equals(stepup_pwd)) {
            session.setAttribute("member", member);
            return "로그인 성공";
        }else {
            return "로그인 실패";
        }

    }

    @RequestMapping("/logout.do")
    public String stepup_logout() {

        session.removeAttribute("member");

        return "redirect:/mainhome.do";
    }

    @RequestMapping("/curseView.do")
    public String curseView(Model model, String stepup_id ) {

        List<CurseVO> vo = loginDao.curseList(stepup_id);
        model.addAttribute("vo", vo);

        return Common.stepupinformation.VIEW_PATH + "memberCurseList.jsp";
    }

    @RequestMapping("idFindPage.do")
    public String idFindPage() {

        return Common.login.VIEW_PATH + "idFindPage.jsp";
    }

    @RequestMapping("pwdFindPage.do")
    public String pwdFindPage() {

        return Common.login.VIEW_PATH + "pwdFindPage.jsp";
    }

    @RequestMapping("idFind.do")
    public String idFind( String name, String email, Model model) {
        String s_name = name;
        Map<String, String> map = new HashMap<>();
        map.put("name", name);
        map.put("email", email);

        LoginVO vo = loginDao.idFind(map);
        model.addAttribute("name", s_name);
        model.addAttribute("vo", vo);

        return Common.login.VIEW_PATH + "idFind.jsp";
    }

    @RequestMapping("pwdFind.do")
    public String pwdFind( String id, String email,Model model) {

        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("email", email);

        LoginVO vo = loginDao.pwdFind(map);

        model.addAttribute("vo", vo);

        return Common.login.VIEW_PATH + "pwdFind.jsp";
    }

    @RequestMapping("pwdChaneg.do")
    public String pwdChane(LoginVO loginVO) {

        if(loginVO.getUserType().equals("academy")){

            loginDao.academyPwdC(loginVO);


        }else if(loginVO.getUserType().equals("instructor")){

            loginDao.academyPwdI(loginVO);


        }else if(loginVO.getUserType().equals("stepup")){

            loginDao.academyPwdS(loginVO);

        }
        return "redirect:/login_page.do";
    }
}
