package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import vo.AcademyVO;
import vo.InstructorVO;

import java.util.List;

public class InstructorDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    //학원에 소속된 강사 조회
    public List<InstructorVO> instructorMember(int academy_idx){

        return sqlSession.selectList("instructor.academyInstructor", academy_idx);

    }

    public List<AcademyVO> instructorAcademySelect(int instructor_idx){

        return sqlSession.selectList("instructor.academySelect", instructor_idx);

    }

    public InstructorVO instructorSelectOne(int instructor_idx){

        return sqlSession.selectOne("instructor.instructorSelectOne", instructor_idx);

    }

    public List<InstructorVO> instructorSelectAll( int academy_idx ){

        return sqlSession.selectList("instructor.academySelectAll", academy_idx);

    }

    public int updateIns(InstructorVO instructorVO) {

        return sqlSession.update("instructor.updInstructor", instructorVO);
    }

}
