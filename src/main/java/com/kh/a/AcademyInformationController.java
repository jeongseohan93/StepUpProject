package com.kh.a;

import common.Common;
import dao.AcademyDao;
import dao.InstructorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vo.AcademyVO;
import vo.InstructorVO;
import vo.PicVO;
import vo.ResumeVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AcademyInformationController {

    AcademyDao academyDao;
    InstructorDao instructorDao;

    @Autowired
    HttpServletRequest request;

    public void setAcademyDao(AcademyDao academyDao) {
        this.academyDao = academyDao;
    }

    public void setInstructorDao(InstructorDao instructorDao) {
        this.instructorDao = instructorDao;
    }

    @RequestMapping("/resumeView.do")
    public String resumeView(Model model,int academy_idx ) {

        List<ResumeVO> list = academyDao.resumeView(academy_idx);
        model.addAttribute("list", list);

        return Common.academyinformation.VIEW_PATH + "academyResumeView.jsp";
    }

    @RequestMapping("/approve_instructor.do")
    public String approveInstructor(@RequestParam("instructor_idx") Integer instructor_idx,
                                    @RequestParam("academy_idx") Integer academy_idx) {
        // 파라미터를 Map에 넣기
        Map<String, Object> params = new HashMap<>();
        params.put("instructor_idx", instructor_idx);
        params.put("academy_idx", academy_idx);

        // 승인을 처리하고 resume 테이블에 academy_idx와 instructor_idx 연결하기
        academyDao.approveAndLinkInstructor(params);

        // 승인 후 리다이렉트 (승인 후 다시 목록 페이지나 원하는 페이지로 이동)
        return "redirect:mainhome.do";
    }

    @RequestMapping("academyInstructorView.do")
    public String academyInstructor( int academy_idx, String academy_name, Model model) {

        List< InstructorVO> list = instructorDao.instructorSelectAll(academy_idx);

        model.addAttribute("academy", academy_name);
        model.addAttribute("list", list);

        return Common.academyinformation.VIEW_PATH + "academyInstructorView.jsp";
    }

    @RequestMapping("/academyView.do")
    public String academyView(int academy_idx, Model model) {

        AcademyVO vo = academyDao.selectOneAcademy(academy_idx);
        model.addAttribute("vo", vo);

        return Common.academyinformation.VIEW_PATH + "academyInformationView.jsp";
    }

    @RequestMapping("/updateStepupInfo.do")
    public String updStepup(  AcademyVO academyVO, Integer idx ) {

       academyDao.updateAcademyInfor(academyVO);

       return "redirect:login_page.do";

    }

    @RequestMapping("/academyImgAddPage.do")
    public String academyImgAddPage( int academy_idx, Model model ) {

        model.addAttribute("academy_idx", academy_idx);

        return Common.academyinformation.VIEW_PATH + "academyImgAddPage.jsp";
    }

    @RequestMapping("/academyAdd.do")
    public String academyAdd( PicVO picVO ) {

        String webPath = "/resources/upload/academy/pAcademy/";
        String savePath = request.getSession().getServletContext().getRealPath(webPath);
        System.out.println(savePath);

        List<MultipartFile> multipartFile = picVO.getPic_file();

        if (multipartFile != null && !multipartFile.isEmpty()) {
            for (MultipartFile mf : multipartFile) {
                if (mf != null && !mf.isEmpty()) {
                    String filename = mf.getOriginalFilename();
                    File saveFile = new File(savePath, filename);

                    if (saveFile.exists()) {
                        long time = System.currentTimeMillis();
                        filename = String.format("%d_%s", time, filename);
                        saveFile = new File(savePath, filename);
                    }

                    try {
                        mf.transferTo(saveFile);
                        picVO.setPic_name(webPath + filename);
                        academyDao.InsertPic(picVO);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        int academy_idx = picVO.getAcademy_idx();

        return "redirect:academy_detail.do?academy_idx=" + academy_idx;
    }

}
