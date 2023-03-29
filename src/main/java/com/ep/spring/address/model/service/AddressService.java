package com.ep.spring.address.model.service;

import java.util.ArrayList;

import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddEdit;
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
	// 1_1. 개인주소록 즐겨찾기 리스트
	ArrayList<Address> selectPersonalFavAddList(int empNo);
	
	// 1_2. 사원주소록 즐겨찾기 리스트
	ArrayList<Employee> selectEmpFavAddList(int empNo);
	
	// 1_3. 외부주소록 즐겨찾기 리스트
	ArrayList<Address> selectExternalFavAddList(int empNo);
	
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
	int selectPsGroupAddListCount(AddDept ad);
	ArrayList<Address> selectPsGroupAddList(PageInfo pi, AddDept ad);
	
	// 8.5 그룹이름 조회
	AddGroup selectAddGroup(String group);
	
	// 9. 개인주소록 그룹 추가(ajax)
	int selectExtPersonalGroup(AddGroup ag);
	int insertNewPersonalGroup(AddGroup ag);
	
	// 10. 개인주소록 그룹 조회(ajax)
	ArrayList<AddGroup> selectPersonalGroupList(int empNo);
	
	// 11. 개인주소록 연락처 상세조회
	Address selectPsAddDetail(int no);
	
	// 12. 개인주소록 연락처 수정
	int updatePsAdd(Address a);
	
	// 13. 공유주소록 그룹 추가(ajax)
	int selectExtSharedGroup(AddGroup ag);
	int insertNewSharedGroup(AddGroup ag);
	
	// 14. 검색한 사원리스트 조회(ajax)
	ArrayList<Employee> selectEmployeeList(Employee e);
	
	// 15. 개인주소록 & 외부주소록 즐겨찾기 리스트 삭제(ajax)
	int deleteFavAdd(AddFavorite af);
	
	// 16. 사내주소록 즐겨찾기 리스트 삭제(ajax)
	int deleteFavEmp(AddFavorite af);
	
	// 17. 개인주소록 & 외부주소록 즐겨찾기 리스트 저장(ajax)
	int insertFavAdd(AddFavorite af);
	
	// 18. 사내주소록 즐겨찾기 리스트 저장(ajax)
	int insertFavEmp(AddFavorite af);
	
	// 19. 외부 공유주소록 전체 리스트 조회
	int selectExternalAllListCount();
	ArrayList<Address> selectExternalAllList(PageInfo pi);
	
	// 20. 외부 공유주소록 그룹별 리스트 조회
	int selectExternalGroupListCount(String group);
	ArrayList<Address> selectExternalGroupList(String group, PageInfo pi);
	
	// 21. 외부 공유주소록 상세조회
	Address selectExternalAddDetail(int no);
	ArrayList<AddEdit> selectExternalAddEditList(int no);
	
	// 22. 외부 공유주소록 내가 등록한 주소록 리스트 조회
	int selectExternalAddRegListCount(AddGroup ag);
	ArrayList<Address> selectExternalRegList(AddGroup ag, PageInfo pi);
	
	// 23. 개인주소록 다중삭제(ajax)
	int deleteAddList(ArrayList<Address> list);
	
	// 24. 개인주소록 다중 그룹변경(ajax)
	int changeGroupAddList(ArrayList<Address> list);
	
	// 25. 개인주소록 그룹이름수정
	int updatePsGroupName(AddGroup ag);
	
	// 26. 휴지통 목록 조회
	int selectAddressBinListCount(int empNo);
	ArrayList<Address> selectAddressBinList(PageInfo pi, int empNo);
	
	// 27. 주소록 다중 영구삭제(ajax)
	int completeDeleteAddList(ArrayList<Address> list);
	
	// 28. 즐겨찾기 다중 영구삭제(ajax)
	int deleteFavList(ArrayList<Address> list);
	
	// 29. 휴지통 주소록 다중 복구(ajax)
	int restoreAddList(ArrayList<Address> list);
	
	// 30. 페이징처리 없는 전체 공유주소록 검색
	ArrayList<Address> selectAllSharedAddress();
	
	// 31. 공용주소록 그룹 이름 수정(ajax)
	int updateSharedGroupName(AddGroup ag);
	
	// 32. 공용주소록 그룹 삭제
	int deleteSharedGroup(AddGroup ag);
	
	// 33. 개인주소록 개별삭제
	int deleteOndAdd(int no);
	
	
	int updatePersonalGroupName(AddGroup ag);

	

	
	

}
