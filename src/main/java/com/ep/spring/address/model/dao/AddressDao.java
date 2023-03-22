package com.ep.spring.address.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddEdit;
import com.ep.spring.address.model.vo.AddFavorite;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.address.model.vo.Address;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

@Repository
public class AddressDao {

	public ArrayList<AddGroup> selectPersonalAddGroup(SqlSessionTemplate sqlSession, Employee e) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectPersonalAddGroup", e);
	}

	public ArrayList<AddGroup> selectSharedAddGroup(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectSharedAddGroup");
	}

	public ArrayList<Address> selectPersonalFavAddList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectPersonalFavAddList", empNo);
	}

	public ArrayList<Employee> selectEmpFavAddList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectEmpFavAddList", empNo);
	}

	public ArrayList<Address> selectExternalFavAddList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectExternalFavAddList", empNo);
	}

	public int insertPersonalAdd(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.insert("addressMapper.insertPersonalAdd", a);
	}

	public int insertSharedAdd(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.insert("addressMapper.insertSharedAdd", a);
	}
	/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!여기 */ 
	public int insertEditableEmpList(SqlSessionTemplate sqlSession,  Address a) { 
		return sqlSession.update("addressMapper.insertEditableEmpList", a); 
	}
	

	public int selectEntEmpListCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("addressMapper.selectEntEmpListCount", no);
	}

	public ArrayList<Employee> selectEntEmpListCount(SqlSessionTemplate sqlSession, PageInfo pi, int no) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("addressMapper.selectEntEmpList", no, rowBounds);
	}

	public ArrayList<AddFavorite> selectEmpFavList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectEmpFavList", no);
	}

	public int selectDeptEmpListCount(SqlSessionTemplate sqlSession, AddDept ad) {
		return sqlSession.selectOne("addressMapper.selectDeptEmpListCount", ad);
	}

	public ArrayList<Employee> selectDeptEmpList(SqlSessionTemplate sqlSession, PageInfo pi, AddDept ad) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("addressMapper.selectDeptEmpList", ad, rowBounds);
	}

	public Employee selectEmpAddDetail(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("addressMapper.selectEmpAddDetail", no);
	}

	public int selectPsAllAddListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("addressMapper.selectPsAllAddListCount", empNo);
	}

	public ArrayList<Address> selectPsAllAddList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("addressMapper.selectPsAllAddList", empNo, rowBounds);
	}

	public ArrayList<AddFavorite> selectPsFavList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectPsFavList", empNo);
	}

	public int selectPsGroupAddListCount(SqlSessionTemplate sqlSession, AddDept ad) {
		return sqlSession.selectOne("addressMapper.selectPsGroupAddListCount", ad);
	}

	public ArrayList<Address> selectPsGroupAddList(SqlSessionTemplate sqlSession, PageInfo pi, AddDept ad) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("addressMapper.selectPsGroupAddList", ad, rowBounds);
	}

	public AddGroup selectAddGroup(SqlSessionTemplate sqlSession, String group) {
		return sqlSession.selectOne("addressMapper.selectAddGroup", group);
	}

	public int selectExtPersonalGroup(SqlSessionTemplate sqlSession, AddGroup ag) {
		return sqlSession.selectOne("addressMapper.selectExtPersonalGroup", ag);
	}

	public int insertNewPersonalGroup(SqlSessionTemplate sqlSession, AddGroup ag) {
		return sqlSession.insert("addressMapper.insertNewPersonalGroup", ag);
	}

	public ArrayList<AddGroup> selectPersonalGroupList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectPersonalGroupList", empNo);
	}

	public Address selectPsAddDetail(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("addressMapper.selectPsAddDetail", no);
	}

	public int updatePsAdd(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.update("addressMapper.updatePsAdd", a);
	}

	public int selectExtSharedGroup(SqlSessionTemplate sqlSession, AddGroup ag) {
		return sqlSession.selectOne("addressMapper.selectExtSharedGroup", ag);
	}

	public int insertNewSharedGroup(SqlSessionTemplate sqlSession, AddGroup ag) {
		return sqlSession.insert("addressMapper.insertNewSharedGroup", ag);
	}

	public ArrayList<Employee> selectEmployeeList(SqlSessionTemplate sqlSession, Employee e) {
		return (ArrayList) sqlSession.selectList("addressMapper.selectEmployeeList", e);
	}

	public int deleteFavAdd(SqlSessionTemplate sqlSession, AddFavorite ag) {
		return sqlSession.delete("addressMapper.deleteFavAdd", ag);
	}

	public int deleteFavEmp(SqlSessionTemplate sqlSession, AddFavorite ag) {
		return sqlSession.delete("addressMapper.deleteFavEmp", ag);
	}

	public int insertFavAdd(SqlSessionTemplate sqlSession, AddFavorite af) {
		return sqlSession.insert("addressMapper.insertFavAdd", af);
	}

	public int insertFavEmp(SqlSessionTemplate sqlSession, AddFavorite af) {
		return sqlSession.insert("addressMapper.insertFavEmp", af);
	}

	public int selectExternalAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectExternalAllListCount");
	}
	
	public ArrayList<Address> selectExternalAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("addressMapper.selectExternalAllList", null, rowBounds);
	}

	public int selectExternalGroupListCount(SqlSessionTemplate sqlSession, String group) {
		return sqlSession.selectOne("addressMapper.selectExternalGroupListCount", group);
	}
	
	public ArrayList<Address> selectExternalGroupList(SqlSessionTemplate sqlSession, String group, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectExternalGroupList", group, rowBounds);
	}

	public Address selectExternalAddDetail(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("addressMapper.selectExternalAddDetail", no);
	}

	public ArrayList<AddEdit> selectExternalAddEditList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("addressMapper.selectExternalAddEditList", no);
	}
	
	public int selectExternalAddRegListCount(SqlSessionTemplate sqlSession, AddGroup ag) {
		return sqlSession.selectOne("addressMapper.selectExternalAddRegListCount", ag);
	}

	public ArrayList<Address> selectExternalRegList(SqlSessionTemplate sqlSession, AddGroup ag, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectExternalRegList", ag, rowBounds);
	}

	public int deleteAddList(SqlSessionTemplate sqlSession, ArrayList<Address> list) {
		int result = 0;
		for(Address a: list) {
			result += sqlSession.update("addressMapper.deleteAddList", a);
		}
		return result;
	}




	

}
