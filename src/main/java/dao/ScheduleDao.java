package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import vo.ScheduleVO;

import java.util.List;

public class ScheduleDao {

    @Autowired
    SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<ScheduleVO> academySchedules(int academy_idx) {

        return sqlSession.selectList("schedule.academySchedules", academy_idx);
    }

    public List<ScheduleVO> schedulesView(int instructor_idx) {

        return sqlSession.selectList("schedule.viewSchedules", instructor_idx);

    }

    public void deleteSchedule(int schedule_idx) {
        sqlSession.delete("schedule.deleteSchedule", schedule_idx);
    }

    public int insertSchedule(ScheduleVO schedule) {
        return sqlSession.insert("schedule.insertSchedule", schedule);
    }
}
