package com.odtn.admin.dao;

import java.util.List;

import com.odtn.admin.dto.AdminDto;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampQnADto;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.member.dto.MemberDto;

public interface AdminDao {
	public int adminCheck(AdminDto adminDto);
	
	public int getCount();
	public List<MemberDto> memberList();
	public MemberDto adminRead(int user_num);
	public int updateOk(MemberDto memberDto);
	public int deleteOk(int user_num);
	
	public List<CampInfoDto> BoardInfoList();
	public List<CampReviewDto> boardReviewList();
	public List<CampQnADto> boardQnAList();
	public CampQnADto QnARead(int qna_num);
	public int QnAdeleteOk(int qna_num);
	public CampReviewDto campReviewRead(int review_num);
	public int reviewdeleteOk(int review_num);
	public CampInfoDto campInfoRead(int info_num);
	public int infodeleteOk(int info_num);
}
