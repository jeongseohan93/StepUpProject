package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import vo.*;

import java.util.List;
import java.util.Map;

public class LoginDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public LoginVO loginCheck(String stepup_id) {

        return sqlSession.selectOne("login.loginDate",stepup_id);

    }

    public AcademyVO academySelect(String id) {

        return sqlSession.selectOne("information.academySelect",id);

    }

    public InstructorVO instructorSelect(String id) {

        return sqlSession.selectOne("information.instructorSelect",id);

    }

    public StepupMemberVO stepupSelect(String id) {

        return sqlSession.selectOne("information.stepupSelect",id);

    }

    public StepupMemberVO getMemberById(String stepup_id) {
        return sqlSession.selectOne("login.selectMemberById", stepup_id);
    }

    public List<CurseVO> curseList(String stepup_id) {

        return sqlSession.selectList("login.selectCurseList", stepup_id);

    }

    public LoginVO idFind(Map<String, String> map) {

        return sqlSession.selectOne("login.idFind", map);

    }

    public LoginVO pwdFind(Map<String, String> map) {

        return sqlSession.selectOne("login.pwdFind", map);
    }

    public void academyPwdC ( LoginVO loginVO) {

        sqlSession.insert("login.academyPwdC", loginVO);

    }

    public void academyPwdI ( LoginVO loginVO) {

        sqlSession.insert("login.academyPwdI", loginVO);
    }

    public void academyPwdS( LoginVO loginVO) {

        sqlSession.insert("login.academyPwdS", loginVO);
    }

    public int updateMember(StepupMemberVO vo) {
        return sqlSession.update("login.updateMember", vo);
    }

}
