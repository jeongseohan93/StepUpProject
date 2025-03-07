package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import vo.BoardVO;

public class BoardDao {

	@Autowired
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시글 조회
	public List<BoardVO> selectList( Map<String, Object> map ){
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);	
		return list;
	}
	
	//새 글 등록
	public int insert( BoardVO vo ) {

		int res = sqlSession.insert("b.board_insert", vo);		
		return res;
		
	}
	
	//상세보기를 위한 게시글 조회
	public BoardVO selectOne( int board_idx ) {

		BoardVO vo = sqlSession.selectOne("b.board_one", board_idx);	
		return vo;
		
	}
	
	public int update(BoardVO vo) {
		
		int res = sqlSession.update("b.board_update", vo);
		return res;
	}
	
	//조회수 증가
	public int update_readhit( int board_idx ) {
		int res = sqlSession.update("b.board_update_readhit", board_idx);		
		return res;
	}
	
	//댓글 처리를 위한 step + 1
	public int update_step( BoardVO baseVO ) {	

		int res = sqlSession.update("b.board_update_step", baseVO);
		return res;
		
	}
	
	//댓글등록
	public int reply(BoardVO vo) {
		int res = sqlSession.insert("b.board_reply", vo);
		return res;
	}
	
	//삭제(된 것 처럼 업데이트)
	public int del_update( int board_idx ) {

		int res = sqlSession.update("b.board_del_update", board_idx);
		return res;
	}
	
	//게시판의 전체 게시글 수
	public int getRowTotal( Map<String, Object> map ) {
		int count = sqlSession.selectOne("b.board_count", map);
		return count;
	}
	
}