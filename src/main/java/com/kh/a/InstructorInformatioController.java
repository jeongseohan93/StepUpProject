package com.kh.a;

import common.Common;
import dao.AcademyDao;
import dao.InstructorDao;
import dao.ScheduleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import vo.AcademyVO;
import vo.InstructorVO;
import vo.ResumeVO;
import vo.ScheduleVO;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class InstructorInformatioController {

    @Autowired
    HttpSession session;

    AcademyDao academyDao;
    InstructorDao instructorDao;
    ScheduleDao scheduleDao;

    public void setScheduleDao(ScheduleDao scheduleDao) {
        this.scheduleDao = scheduleDao;
    }

    public void setInstructorDao(InstructorDao instructorDao) {
        this.instructorDao = instructorDao;
    }

    public void setAcademyDao(AcademyDao academyDao) {
        this.academyDao = academyDao;
    }

    @RequestMapping("/lectureViewDelete.do")
    public String lectureViewDelete( int instructor_idx, Model model ) {

        List<ScheduleVO> instr = scheduleDao.schedulesView(instructor_idx);
        model.addAttribute("instr", instr);

        return Common.instructorinformation.VIEW_PATH + "instructorLectureDel.jsp";
    }

    @RequestMapping(value = "/delete_sche.do", method = RequestMethod.POST)
    public String deleteSchedules(@RequestParam("schedule_idx") List<Integer> scheduleIds, int instructor_idx ) {

        for (Integer scheduleIdx : scheduleIds) {
            scheduleDao.deleteSchedule(scheduleIdx);  // schedule_idx로 삭제
        }

        return "redirect:/lectureViewDelete.do?instructor_idx=" + instructor_idx;
    }

    @RequestMapping("/lectureAdd.do")
    public String lectureAddPage(int instructor_idx, Model model) {

        InstructorVO instru = instructorDao.instructorSelectOne(instructor_idx);
        List<AcademyVO> list = instructorDao.instructorAcademySelect(instructor_idx);

        model.addAttribute("list", list);
        model.addAttribute("instru", instru);

        return Common.instructorinformation.VIEW_PATH + "instructorLectureAdd.jsp";
    }

    @RequestMapping("/addSchedule.do")
    public String addSchedule(ScheduleVO schedule, Model model) {

        scheduleDao.insertSchedule(schedule); // 여기서 INSERT하면 schedule_idx는 자동 증가!
        int result = schedule.getInstructor_idx();

        return "redirect:/lectureViewDelete.do?instructor_idx=" + result;
    }

    @RequestMapping("resume.do")
    public String resume(int instructor_idx, Model model) {

        List<AcademyVO> list = academyDao.selectAcademyName();
        InstructorVO instru = instructorDao.instructorSelectOne(instructor_idx);

        model.addAttribute("instru", instru);
        model.addAttribute("list", list);

        return Common.instructorinformation.VIEW_PATH + "instructorResume.jsp";
    }

    @RequestMapping(value = "/resume_send.do", method = RequestMethod.POST)
    public String submitResume(@RequestParam("academy_idx") Integer academy_idx,
                               HttpSession session, // 세션을 받기
                               @RequestParam("instructor_idx") Integer instructor_idx,
                               @RequestParam("self_introduction") String self_introduction) {


        if (instructor_idx == null) {
            // 예외 처리, 기본값 설정 등 추가 (예시로 -1 설정)
            instructor_idx = -1;  // 예시로 기본값 -1을 설정, 실제 예외 처리 로직에 맞게 조정
        }

        // 이력서 정보 객체 생성
        ResumeVO resume = new ResumeVO();
        resume.setAcademy_idx(academy_idx);
        resume.setInstructor_idx(instructor_idx);  // 세션에서 가져온 instructor_idx 설정
        resume.setSelf_introduction(self_introduction);

        // 이력서 저장 (외래키 연결)
        academyDao.insertResume(resume);
        return "redirect:mainhome.do";
    }

    @RequestMapping("/lecture_list.do")
    public String instructorProfile(Model model, int instructor_idx) {

        List<ScheduleVO> schedules = scheduleDao.schedulesView(instructor_idx);
        InstructorVO insvo = instructorDao.instructorSelectOne(instructor_idx);

        model.addAttribute("insvo", insvo);
        model.addAttribute("schedules", schedules);


        return Common.profile.VIEW_PATH + "instructorProfile.jsp";
    }

    @RequestMapping("/ins-modify.do")
    public String updInsModify(@RequestParam("instructor_idx") Integer instructor_idx,
                               @RequestParam(value = "instructor_pwd", required = false) String instructor_pwd,
                               InstructorVO instructorVO) {

        // 비밀번호가 비어있지 않다면 instructorVO에 비밀번호를 설정
        if (instructor_pwd != null && !instructor_pwd.isEmpty()) {
            instructorVO.setInstructor_pwd(instructor_pwd);
        }

        // 나머지 값들이 제대로 설정되었는지 확인
        instructorDao.updateIns(instructorVO);
        return "redirect:/lecture_list.do?instructor_idx=" + instructor_idx;
    }

    @RequestMapping("/instructorInformationChangePage.do")
    public String instructorInformationChangePage(int instructor_idx, Model model) {

        InstructorVO instructorVO = instructorDao.instructorSelectOne(instructor_idx);
        model.addAttribute("instructorVO", instructorVO);

        return Common.instructorinformation.VIEW_PATH + "instructorInformationChangePage.jsp";
    }

    @RequestMapping("/resume_reject.do")
    public String rejectResume(@RequestParam("resume_idx") int resume_idx)
    {
        academyDao.rejectResume(resume_idx);

        return "redirect:mainhome.do";
    }

    @RequestMapping("/resume_list.do")
    public String resumeList(@RequestParam("instructor_idx") int instructorIdx, Model model) {
        List<ResumeVO> resumeList = academyDao.getResumeList(instructorIdx);
        model.addAttribute("resumeList", resumeList);
        return Common.instructorinformation.VIEW_PATH + "instructorNotice.jsp";
    }

}
