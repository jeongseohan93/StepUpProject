package dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import vo.CommentVO;

public class CommentDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    // 댓글 조회
    public List<CommentVO> selectList(Map<String, Integer> map) {
        try {
            return sqlSession.selectList("c.comment_list", map);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // 댓글 총 개수 조회
    public int getRowTotal(int board_idx) {
        try {
            return sqlSession.selectOne("c.comment_idx_count", board_idx);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    // 댓글 추가
    public int insert(CommentVO vo) {
        try {
            return sqlSession.insert("c.comment_insert", vo);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    // 댓글 삭제
    public int delete(int comment_idx) {
        try {
            return sqlSession.delete("c.comment_delete", comment_idx);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}