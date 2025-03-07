package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import vo.AcademyVO;
import vo.InstructorVO;
import vo.StepupMemberVO;

public class MemberJoinDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public int insertAcademy(AcademyVO academyVO){

        return sqlSession.insert("join.academyInsert",academyVO);

    }

    public int insertInstructor(InstructorVO instructorVO){

        return sqlSession.insert("join.instructorInsert",instructorVO);

    }

    public int insertMember(StepupMemberVO stepupMemberVO) {

        return sqlSession.insert("join.memberInsert", stepupMemberVO);

    }

    public int stepupIdCheck(String stepup_id) {

        return sqlSession.selectOne("join.stepupIdCheck", stepup_id);

    }

    public int academyIdCheck(String academy_id) {

        return sqlSession.selectOne("join.academyIdCheck", academy_id);

    }

    public int instructorIdCheck(String instructor_id) {

        return sqlSession.selectOne("join.instructorIdCheck", instructor_id);

    }

}
