package com.kh.a;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.BoardDao;
import util.Paging;
import vo.BoardVO;

@Controller
public class BoardController {

    @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    BoardDao boardDao;

    public void setBoardDao(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    //전체 게시글 보기
    @RequestMapping("/list.do")
    public String list(Model model, String search, String search_text, Integer page) {
        int nowPage = 1;

        if(page != null) {
            nowPage = page;
        }

        int start = (nowPage - 1) * Common.Board.BLOCKLIST;

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("count", Common.Board.BLOCKLIST);

        // 검색 조건 추가
        if(search != null) {
            map.put("search", search);
            if(search_text != null && !search_text.trim().isEmpty()) {
                map.put("search_text", search_text.trim());
            }
        }

        int row_total = boardDao.getRowTotal(map);
        List<BoardVO> list = boardDao.selectList(map);

        // 검색 파라미터 처리
        String search_param = String.format("search=%s&search_text=%s",
                search == null ? "all" : search,
                search_text == null ? "" : search_text);

        String pageMenu = Paging.getPaging(
                "list.do",
                nowPage,
                row_total,
                search_param,
                Common.Board.BLOCKLIST,
                Common.Board.BLOCKPAGE);

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        session.removeAttribute("show");

        return common.Common.Board.VIEW_PATH + "board_list.jsp";
    }
    //게시글 상세보기
    @RequestMapping("/view.do")
    public String view(Model model, Integer board_idx, String page, String search, String search_text) {
        BoardVO vo = boardDao.selectOne(board_idx);

        //조회수 증가
        String show = (String)session.getAttribute("show");

        if(show == null) {
            int res = boardDao.update_readhit(board_idx);
            session.setAttribute("show", "y");
        }

        model.addAttribute("vo", vo);
        return common.Common.Board.VIEW_PATH + "board_view.jsp";
    }

    //새 글 작성 페이지로 전환
    @RequestMapping("/write_form.do")
    public String writeForm() {
        return common.Common.Board.VIEW_PATH + "board_write.jsp";
    }

    //게시글 등록
    @RequestMapping("/insert.do")
    public String insert(BoardVO vo) {
        String ip = request.getRemoteAddr();
        vo.setBoard_ip(ip);
        int res = boardDao.insert(vo);
        return "redirect:list.do?page=1";  // 페이지 번호를 1로 지정
    }

    //게시글 삭제
    @RequestMapping("/del.do")
    @ResponseBody
    public String delete(Integer board_idx) {
        int res = boardDao.del_update(board_idx);

        String result = "fail";
        if(res == 1) {
            result = "succ";
        }

        String resStr = String.format("[{'result':'%s'}]", result);
        return resStr;
    }
    
    //게시글 수정 페이지로 전환
    @RequestMapping("/modify_form.do")
    public String modifyForm(Integer board_idx, String page, String search, String search_text, Model model) {
        BoardVO vo = boardDao.selectOne(board_idx);
        model.addAttribute("vo", vo);
        return common.Common.Board.VIEW_PATH + "board_modify.jsp";
    }
    
    //게시글 수정
    @RequestMapping("/modify_fin.do")
    public String modify(BoardVO vo, String page, String search, String search_text) {
        String ip = request.getRemoteAddr();
        vo.setBoard_ip(ip);
        int res = boardDao.update(vo);
        return "redirect:list.do?page=" + (page == null ? "1" : page) + 
               "&search=" + (search == null ? "all" : search) + 
               "&search_text=" + (search_text == null ? "" : search_text);
    }
}