package com.ep.spring.address.model.service;

import java.util.ArrayList;

import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddFavorite;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.address.model.vo.Address;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.login.model.vo.Employee;

public interface AddressService {
	
	// 0. 로그인한 사원이 등록한 연락처 그룹 리스트 & 공유주소록(외부) 그룹리스트
	ArrayList<AddGroup> selectPersonalAddGroup(Employee e);
	ArrayList<AddGroup> selectSharedAddGroup();
	
	// 1. 즐겨찾기 리스트 조회 서비스
	
	// 2. 개인주소록 추가
	int insertPersonalAdd(Address a);
	
	// 3. 공유주소록 추가
	int insertSharedAdd(Address a);
	
	// 4. 전체 사내주소록 조회
	int selectEntEmpListCount(int no);
	ArrayList <Employee> selectEntEmpList(PageInfo pi, int no);
	
	// 4.5 사내주소록 내에서 사용자가 즐겨찾기한 사원 리스트
	ArrayList <AddFavorite> selectEmpFavList(int no);
	
	// 5. 부서별 사내주소록 조회
	int selectDeptEmpListCount(AddDept ad);
	ArrayList<Employee> selectDeptEmpList(PageInfo pi, AddDept ad);
	
	// 6. 사내 연락처 상세 조회
	Employee selectEmpAddDetail(int no);
	
	// 7. 전체 개인주소록 리스트 조회
	int selectPsAllAddListCount(int empNo);
	ArrayList<Address> selectPsAllAddList(PageInfo pi, int empNo);
	
	// 7.5 개인주소록에서 사용자가 즐겨찾기한 주소록번호 리스트
	ArrayList<AddFavorite> selectPsFavList(int empNo);
	
	// 8. 그룹별 개인주소록 리스트 조회
	
	

}
