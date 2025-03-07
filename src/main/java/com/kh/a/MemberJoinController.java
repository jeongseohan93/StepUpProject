package com.kh.a;

import common.Common;
import dao.MemberJoinDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.MailSendService;
import vo.AcademyVO;
import vo.InstructorVO;
import vo.StepupMemberVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
public class MemberJoinController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    MailSendService mss;

    MemberJoinDao memberjoinDao;

    public void setMemberjoinDao(MemberJoinDao memberjoinDao) {
        this.memberjoinDao = memberjoinDao;
    }

    public void setMss(MailSendService mss) {
        this.mss = mss;
    }

    //회원가입 선택 페이지
    @RequestMapping("/member_join.do")
    public String memberSelectPage() {

        return Common.login.VIEW_PATH + "selectJoinPage.jsp";

    }

    @RequestMapping("academy_join.do")
    public String academyJoinPage() {

        return Common.login.VIEW_PATH + "academyJoinPage.jsp";
    }

    @RequestMapping("instructor_join_instructor.do")
    public String instructorJoinPage() {

        return Common.login.VIEW_PATH + "instructorJoinPage.jsp";
    }

    @RequestMapping("member_join_page.do")
    public String memberJoinPage() {

        return Common.login.VIEW_PATH + "memberJoinPage.jsp";

    }

    @RequestMapping("academy_join_insert.do")
    public String academyJoinAction(AcademyVO academyVO) {


        String webPath = "/resources/upload/academy/";
        String savePath = request.getSession().getServletContext().getRealPath(webPath);
        System.out.println(savePath);

        MultipartFile multipartFile = academyVO.getAcademy_pic();
        String filename = "no_file";


        if(!multipartFile.isEmpty()) {
            filename = multipartFile.getOriginalFilename();

            File saveFile = new File(savePath, filename);

            if (!saveFile.exists()) {
                saveFile.mkdirs();
            } else {
                long time = System.currentTimeMillis();
                filename = String.format("%d_%s", time, filename);
                saveFile = new File(savePath, filename);
            }

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        academyVO.setAcademy_profile(webPath + filename);

        int res = memberjoinDao.insertAcademy(academyVO);

        return Common.login.VIEW_PATH + "loginMain.jsp";
    }

    @RequestMapping("instructor_member_insert.do")
    public String instructorJoinAction(InstructorVO instructorVO) {


        String webPath = "/resources/upload/instructor/";
        String savePath = request.getSession().getServletContext().getRealPath(webPath);
        System.out.println(savePath);

        MultipartFile multipartFile = instructorVO.getInstructor_pic();
        String filename = "no_file";


        if(!multipartFile.isEmpty()) {
            filename = multipartFile.getOriginalFilename();

            File saveFile = new File(savePath, filename);

            if (!saveFile.exists()) {
                saveFile.mkdirs();
            } else {
                long time = System.currentTimeMillis();
                filename = String.format("%d_%s", time, filename);
                saveFile = new File(savePath, filename);
            }

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        instructorVO.setInstructor_profile(webPath + filename);

        int res = memberjoinDao.insertInstructor(instructorVO);

        return Common.login.VIEW_PATH + "loginMain.jsp";
    }

    @RequestMapping("/member_insert.do")
    public String memberJoinAction(StepupMemberVO stepupMemberVO) {

        String webPath = "/resources/upload/stepup/";
        String savePath = request.getSession().getServletContext().getRealPath(webPath);
        System.out.println(savePath);

        MultipartFile multipartFile = stepupMemberVO.getStepup_pic();
        String filename = "no_file";


        if(!multipartFile.isEmpty()) {
            filename = multipartFile.getOriginalFilename();

            File saveFile = new File(savePath, filename);

            if (!saveFile.exists()) {
                saveFile.mkdirs();
            } else {
                long time = System.currentTimeMillis();
                filename = String.format("%d_%s", time, filename);
                saveFile = new File(savePath, filename);
            }

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        stepupMemberVO.setStepup_profile(webPath + filename);

        int res = memberjoinDao.insertMember(stepupMemberVO);

        return Common.login.VIEW_PATH + "loginMain.jsp";
    }

    @RequestMapping("/check_stepup_id.do")
    @ResponseBody
    public String stepup_id_check( String stepup_id ) {

        int res = memberjoinDao.stepupIdCheck(stepup_id);

        String str = "no";
        if( res > 0) {
            str = "yes";
        }

        String resultStr =String.format("[{'result':'%s'}]", str);
        return resultStr;
    }

    @RequestMapping("/check_academy_id.do")
    @ResponseBody
    public String id_check( String academy_id ) {

        int res = memberjoinDao.academyIdCheck(academy_id);

        String str = "no";
        if( res > 0) {
            str = "yes";
        }

        String resultStr = String.format("[{'result':'%s'}]", str);
        return resultStr;
    }

    @RequestMapping("/check_instructor_id.do")
    @ResponseBody
    public String id_instructor_id_check( String instructor_id ) {

        int res = memberjoinDao.instructorIdCheck(instructor_id);

        String str = "no";
        if( res > 0) {
            str = "yes";
        }

        String resultStr =String.format("[{'result':'%s'}]", str);
        return resultStr;
    }

    @RequestMapping("/mail_check.do")
    @ResponseBody
    public String mailCheck( String academy_email ) {
        String res = mss.joinEmail( academy_email );
        return res;
    }


}
