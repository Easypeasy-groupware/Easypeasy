package com.ep.spring.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ep.spring.address.model.dao.AddressDao;
import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddEdit;
import com.ep.spring.address.model.vo.AddFavorite;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.address.model.vo.Address;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressDao aDao;
	

	@Override
	public ArrayList<AddGroup> selectPersonalAddGroup(Employee e) {
		return aDao.selectPersonalAddGroup(sqlSession, e);
	}
	
	@Override
	public ArrayList<AddGroup> selectSharedAddGroup() {
		return aDao.selectSharedAddGroup(sqlSession);
	}
	
	@Override
	public ArrayList<Address> selectPersonalFavAddList(int empNo) {
		return aDao.selectPersonalFavAddList(sqlSession, empNo);
	}

	@Override
	public ArrayList<Employee> selectEmpFavAddList(int empNo) {
		return aDao.selectEmpFavAddList(sqlSession, empNo);
	}

	@Override
	public ArrayList<Address> selectExternalFavAddList(int empNo) {
		return aDao.selectExternalFavAddList(sqlSession, empNo);
	}
	
	@Override
	public int insertPersonalAdd(Address a) {
		return aDao.insertPersonalAdd(sqlSession, a);
	}
	
	@Override public int insertSharedAdd(Address a) {
		int result1 = aDao.insertSharedAdd(sqlSession, a);
		int result2 = aDao.insertEditableEmpList(sqlSession, a);
		return result1*result2; 
	}

	@Override
	public int selectEntEmpListCount(int no) {
		return aDao.selectEntEmpListCount(sqlSession, no);
	}

	@Override
	public ArrayList<Employee> selectEntEmpList(PageInfo pi, int no) {
		return aDao.selectEntEmpListCount(sqlSession, pi, no);
	}
	
	@Override
	public ArrayList<AddFavorite> selectEmpFavList(int no) {
		return aDao.selectEmpFavList(sqlSession, no);
	}
	
	@Override
	public int selectDeptEmpListCount(AddDept ad) {
		return aDao.selectDeptEmpListCount(sqlSession, ad);
	}

	@Override
	public ArrayList<Employee> selectDeptEmpList(PageInfo pi, AddDept ad) {
		return aDao.selectDeptEmpList(sqlSession, pi, ad);
	}

	@Override
	public Employee selectEmpAddDetail(int no) {
		return aDao.selectEmpAddDetail(sqlSession, no);
	}

	@Override
	public int selectPsAllAddListCount(int empNo) {
		return aDao.selectPsAllAddListCount(sqlSession, empNo);
	}

	@Override
	public ArrayList<Address> selectPsAllAddList(PageInfo pi, int empNo) {
		return aDao.selectPsAllAddList(sqlSession, pi, empNo);
	}

	@Override
	public ArrayList<AddFavorite> selectPsFavList(int empNo) {
		return aDao.selectPsFavList(sqlSession, empNo);
	}

	@Override
	public int selectPsGroupAddListCount(AddDept ad) {
		return aDao.selectPsGroupAddListCount(sqlSession, ad);
	}

	@Override
	public ArrayList<Address> selectPsGroupAddList(PageInfo pi, AddDept ad) {
		return aDao.selectPsGroupAddList(sqlSession, pi, ad);
	}

	@Override
	public AddGroup selectAddGroup(String group) {
		return aDao.selectAddGroup(sqlSession, group);
	}

	@Override
	public int selectExtPersonalGroup(AddGroup ag) {
		return aDao.selectExtPersonalGroup(sqlSession, ag);
	}

	@Override
	public int insertNewPersonalGroup(AddGroup ag) {
		return aDao.insertNewPersonalGroup(sqlSession, ag);
	}

	@Override
	public ArrayList<AddGroup> selectPersonalGroupList(int empNo) {
		return aDao.selectPersonalGroupList(sqlSession, empNo);
	}

	@Override
	public Address selectPsAddDetail(int no) {
		return aDao.selectPsAddDetail(sqlSession, no);
	}

	@Override
	public int updatePsAdd(Address a) {
		return aDao.updatePsAdd(sqlSession, a);
	}

	@Override
	public int selectExtSharedGroup(AddGroup ag) {
		return aDao.selectExtSharedGroup(sqlSession, ag);
	}

	@Override
	public int insertNewSharedGroup(AddGroup ag) {
		return aDao.insertNewSharedGroup(sqlSession, ag);
	}

	@Override
	public ArrayList<Employee> selectEmployeeList(Employee e) {
		return aDao.selectEmployeeList(sqlSession, e);
	}

	@Override
	public int deleteFavAdd(AddFavorite af) {
		return aDao.deleteFavAdd(sqlSession, af);
	}

	@Override
	public int deleteFavEmp(AddFavorite af) {
		return aDao.deleteFavEmp(sqlSession, af);
	}

	@Override
	public int insertFavAdd(AddFavorite af) {
		return aDao.insertFavAdd(sqlSession, af);
	}

	@Override
	public int insertFavEmp(AddFavorite af) {
		return aDao.insertFavEmp(sqlSession, af);
	}
	
	@Override
	public int selectExternalAllListCount() {
		return aDao.selectExternalAllListCount(sqlSession);
	}

	@Override
	public ArrayList<Address> selectExternalAllList(PageInfo pi) {
		return aDao.selectExternalAllList(sqlSession, pi);
	}

	@Override
	public int selectExternalGroupListCount(String group) {
		return aDao.selectExternalGroupListCount(sqlSession, group);
	}

	@Override
	public ArrayList<Address> selectExternalGroupList(String group, PageInfo pi) {
		return aDao.selectExternalGroupList(sqlSession, group, pi);
	}

	@Override
	public Address selectExternalAddDetail(int no) {
		return aDao.selectExternalAddDetail(sqlSession, no);
	}
	
	@Override
	public ArrayList<AddEdit> selectExternalAddEditList(int no) {
		return aDao.selectExternalAddEditList(sqlSession, no);
	}


	@Override
	public int selectExternalAddRegListCount(AddGroup ag) {
		return aDao.selectExternalAddRegListCount(sqlSession, ag);
	}

	@Override
	public ArrayList<Address> selectExternalRegList(AddGroup ag, PageInfo pi) {
		return aDao.selectExternalRegList(sqlSession, ag, pi);
	}

	@Override
	public int deleteAddList(ArrayList<Address> list) {
		return aDao.deleteAddList(sqlSession, list);
	}









	






}
