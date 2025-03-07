package com.kh.a;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CommentDao;
import util.PagingComment;
import vo.CommentVO;

@Controller
public class CommentController {

    @Autowired
    HttpServletRequest request;

    CommentDao commentDao;

    public void setCommentDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    //댓글작성
    @RequestMapping("/comment_insert.do")
    @ResponseBody
    public String comment_ins(CommentVO vo) {
        try {
            // 필수 파라미터 검증
            if (vo.getComment_name() == null || vo.getComment_name().trim().isEmpty() ||
                vo.getComment_content() == null || vo.getComment_content().trim().isEmpty()) {
                return "[{'result':'no'}]";
            }
            
            // IP 설정
            vo.setComment_ip(request.getRemoteAddr());
            
            int res = commentDao.insert(vo);
            return String.format("[{'result':'%s'}]", res == 1 ? "yes" : "no");
            
        } catch (Exception e) {
            return "[{'result':'no'}]";
        }
    }

    
    @RequestMapping(value="/comment_list.do", produces="text/html; charset=UTF-8")
    @ResponseBody
    public String commentList(HttpServletRequest request) {
        int board_idx = Integer.parseInt(request.getParameter("board_idx"));
        String page_str = request.getParameter("page");
        int nowPage = (page_str != null) ? Integer.parseInt(page_str) : 1;
        
        int start = (nowPage - 1) * Common.Comment.BLOCKLIST;
        int end = Common.Comment.BLOCKLIST;

        Map<String, Integer> map = new HashMap<>();
        map.put("board_idx", board_idx);
        map.put("start", start);
        map.put("end", end);

        List<CommentVO> list = commentDao.selectList(map);
        
        // 전체 댓글 수 조회
        int row_total = commentDao.getRowTotal(board_idx);
        
        // 페이징 메뉴 생성
        String pageMenu = PagingComment.getPaging(
            "comment_list",
            nowPage,
            row_total,
            Common.Comment.BLOCKLIST,
            Common.Comment.BLOCKPAGE
        );
        
        StringBuilder sb = new StringBuilder();
        
        // 댓글 목록 HTML 생성
        for(CommentVO vo : list) {
            sb.append("<div class='comlist-item'>");
            sb.append("    <form>");
            sb.append("        <input type='hidden' name='comment_idx' value='" + vo.getComment_idx() + "'>");
            sb.append("        <div class='comlist-item-header'>");
            sb.append("            <span>작성자: " + vo.getComment_name() + "</span>");
            sb.append("            <span> (" + vo.getComment_ip() + ")</span>");
            sb.append("            <span style='float:right'>" + vo.getComment_regdate() + "</span>");
            sb.append("        </div>");
            sb.append("        <pre>" + vo.getComment_content() + "</pre>");
            sb.append("        <div style='text-align: right; margin-top: 5px;'>");
            sb.append("            <input type='button' value='삭제' onclick='del_comment(this.form);'>");
            sb.append("        </div>");
            sb.append("    </form>");
            sb.append("</div>");
        }
        
        // 페이징 메뉴 추가
        sb.append("<div class='paging'>" + pageMenu + "</div>");

        return sb.toString();
    }
    
    //댓글삭제
    @RequestMapping("/comment_del.do")
    @ResponseBody
    public String comment_del(int comment_idx) {
        try {
            int res = commentDao.delete(comment_idx);
            return String.format("[{'result':'%s'}]", res == 1 ? "yes" : "no");
        } catch (Exception e) {
            return "[{'result':'no'}]";
        }
    }
}