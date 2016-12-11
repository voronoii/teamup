package org.teamup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.teamup.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="org.teamup.mapper.MemberMapper";

	@Override
	public String findMember(MemberVO vo){
				
		if(sqlSession.selectOne(namespace+".findMember", vo) == null) //���� �̸����� Ȯ���Ѵ�. ������ ��ϵ������� �����.
			return "none";
		else if(sqlSession.selectOne(namespace+".findMember2", vo) == null)//�̸����� �´ٸ� ��й�ȣ�� ��ġ�ϴ��� Ȯ���Ѵ�. 
		   return "failed";
		else
			return "success";
		
	}
	
	
	
	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert(namespace + ".insertMember", vo);
		
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update(namespace + ".updateMember" , vo);
		
	}

	@Override
	public void deleteMember(MemberVO vo) {
		sqlSession.delete(namespace + ".deleteMember", vo);
		
	}

	@Override
	public String findPasswd(MemberVO vo) {
		
		return sqlSession.selectOne(namespace+".findpasswd");
	}

	@Override
	public void changePasswd(MemberVO vo) {
		sqlSession.update(namespace + ".changePasswd", vo);
		
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		 return sqlSession.selectList(namespace + ".memberList");
	}

	@Override
	public void updatePrizeList(MemberVO vo) {
		sqlSession.update(namespace + ".updatePrize", vo);
		
	}

	@Override
	public List<MemberVO> prizeList() throws Exception {
	
		return sqlSession.selectList(namespace + ".selectPrize");
	}

	

	@Override
	public List<MemberVO> findByEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".findByEmail", email);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return (MemberVO) sqlSession.selectList(namespace+ ".memberList", vo);
	}



	@Override
	public void fileUpload(MemberVO vo) throws Exception {
		sqlSession.update(namespace +".fileUpload", vo);
	}



	@Override
	public MemberVO findByMemberId(int memberId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".findByMemberId", memberId);
	}

}
