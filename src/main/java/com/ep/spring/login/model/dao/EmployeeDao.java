package com.ep.spring.login.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	//로그인
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	//아이디찾기
	public Employee findId(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.findId", e);
	}
	
	//마이페이지 정보수정
	public int updateEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}
	
	//비번수정
	public int updatePwd(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updatePwd", e);
	}

	//프로필 사진변경
	public int updateProfile(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateProfile", e);
	}
	
	
	
	// [추가] 부서 전체 조회
	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectDeptList");
	}

	public int updateDefaultProfile(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateDefaultProfile", e);
	}
}
