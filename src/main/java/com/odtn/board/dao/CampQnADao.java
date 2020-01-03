package com.odtn.board.dao;

import java.util.List;

import com.odtn.board.dto.CampQnADto;
import com.odtn.board.dto.CampReviewDto;

public interface CampQnADao {
   public String getUser_name(int user_num);
   public String getEmail(int user_num);
   public String getNickName(int user_num);
   //작성확인
   public int writeOk(CampQnADto campQnADto);
   //group maxNum구하기
   public int getQnAMaxNum();
   //목록의 전체글 개수
   public int getCount(); 
   //목록 리스트로 가져오기
   public List<CampQnADto> getCampQnAList(int startRow,int endRow);
   //작성자 이름으로검색하고 user_num반환
   public int getUser_num(String keyword);
   //검색한 글 개수 세기
   public int getSearchCount(int user_num);
   //검색한 내용 리스트초가져오기
   public List<CampQnADto> getSearchList(int startRow,int endRow,int user_num);
   //글읽기
   public CampQnADto read(int qna_num);
   //비밀번호 입력하고 글 읽기
   public CampQnADto pwdCheck(String password,int user_num,int qna_num);
   //글 삭제
   public int delete(int qna_num);
   //글 수정
   public CampQnADto update(int qna_num);
   //수정확인
   public int updateOk(CampQnADto campQnADto);
   //답글 작성확인
   public int writeAnswerOk(CampQnADto campQnADto);
   
}
