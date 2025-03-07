package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import vo.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AcademyDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    //학원 전체
    public List<AcademyVO> selectAcademy(int startIndex,int pageSize) {
        Map<String, Integer> pageMap = new HashMap<>();
        pageMap.put("startIndex", startIndex);
        pageMap.put("pageSize", pageSize);

        return sqlSession.selectList("academy.academyEntire", pageMap);

    }

    public List<PicVO> academyPic( int academy_idx) {

        return sqlSession.selectList("academy.academyPic", academy_idx);
    }

    public List<AcademyVO> selectAcademyName() {
        return sqlSession.selectList("academy.academyName");
    }

    //지역
    public List<AcademyVO> selectRegion(){

        return sqlSession.selectList("academy.academyEntireRegion");

    }

    //카테고리
    public List<AcademyVO> selectCategory(){

        return sqlSession.selectList("academy.academyEntireCategory");

    }

    //학원 한개 조회
    public AcademyVO academyDetail(int academy_idx){

        return sqlSession.selectOne("academy.academyDetail",academy_idx);

    }

    //학원 후기 점수
    public RatingVO academyRating(int academy_idx){

        return sqlSession.selectOne("academy.academyRating",academy_idx);

    }

    //학원 후기
    public List<AcademyReviewVO> academyReview(int academy_idx){

        return sqlSession.selectList("academy.academyReview",academy_idx);

    }

    public List<AcademyReviewVO> academyReviewMember(String stepup_id){

        return sqlSession.selectList("academy.academyReviewMember",stepup_id);

    }

    public List<PicVO> picView(int academy_idx){

        return sqlSession.selectList("academy.picView",academy_idx);

    }


    public List<AcademyVO> searchName(String keyword)
    {
        return sqlSession.selectList("academy.searchName",keyword);

    }

    public List<AcademyVO> searchSubject(String keyword) {

        return sqlSession.selectList("academy.searchSubject",keyword);

    }
    public List<AcademyVO> searchRegion(String keyword) {

        return sqlSession.selectList("academy.searchRegion",keyword);

    }

    public int insertResume(ResumeVO resume) {

        int res = sqlSession.insert("academy.insertResume", resume);
        return res;
    }

    public int resumeCount(int idx){

        return sqlSession.selectOne("academy.resumeCount",idx);

    }

    public List<ResumeVO> resumeView(int academy_idx){

        return sqlSession.selectList("academy.resumeView",academy_idx);

    }

    public void approveAndLinkInstructor(Map<String, Object> params){

        sqlSession.update("academy.approveAndLinkInstructor", params);

        sqlSession.update("academy.linkInstructorToResume", params);
    }

    public AcademyVO selectOneAcademy(int academy_idx){

        return sqlSession.selectOne("academy.selectOneAcademy",academy_idx);

    }

    public int updateAcademyInfor(AcademyVO academyVO){

        return sqlSession.update("academy.updateAcademyInfor",academyVO);

    }

    public void InsertPic(PicVO picVO){

        sqlSession.insert("academy.insertPic", picVO);

    }

    public int rejectResume(int resume_idx) {
        System.out.println("DAO에서 받은 resume_idx: " + resume_idx);
        return sqlSession.update("academy.rejectResume", resume_idx);
    }

    public List<ResumeVO> getResumeList(int instructorIdx) {
        return sqlSession.selectList("academy.resumeList", instructorIdx);
    }

    public void academyReviewDelete(int review_idx) {

        sqlSession.delete("academy.academyReviewDelete", review_idx);
    }

    public void academyReviewWrite(AcademyReviewVO vo){

        sqlSession.insert("academy.academyReviewWrite", vo);

    }

    public AcademyReviewVO academyReviewSelect (int review_idx) {

        return sqlSession.selectOne("academy.academyReviewSelect",review_idx);
    }

    public void academyReviewUpdate(AcademyReviewVO vo){

        sqlSession.update("academy.academyReviewUpdate", vo);
    }

}
