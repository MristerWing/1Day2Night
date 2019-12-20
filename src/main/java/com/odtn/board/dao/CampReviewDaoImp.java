package com.odtn.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.aop.LogAspect;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;

@Component
public class CampReviewDaoImp implements CampReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//작성확인
	@Override
	public int writeOk(CampReviewDto campReviewDto, List<CampReviewFileDto> array) {
		
		int check=0;
		
		int defaultCheck= sqlSessionTemplate.insert("board.mapper.CampReviewMapper.reviewInsert",campReviewDto);
		
		if (defaultCheck>0 && array.size()>0) {
			for(CampReviewFileDto campReviewFileDto : array) {
				//게시글 번호 max값설정
				int maxNum=sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.setMaxNum");
				campReviewFileDto.setReview_num(maxNum);
			}
			check=sqlSessionTemplate.insert("board.mapper.CampReviewMapper.reviewFileInsert",array);
			
			defaultCheck = check;
		}		
		return defaultCheck;
	}
	//게시글 총개수 구하기
	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.getCount");
	}
	//게시글목록 리스트
	@Override
	public List<CampReviewDto> getCampReviewList(int startRow, int endRow) {
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("board.mapper.CampReviewMapper.getCampReviewList",map);
	}
	//대표이미지에 뿌릴파일 개수가 있는지 구하기
	@Override
	public int imgCount(int review_num) {
		return sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.imgCount",review_num);
	}
}
