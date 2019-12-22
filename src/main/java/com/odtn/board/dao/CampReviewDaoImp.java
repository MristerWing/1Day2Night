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
	//멤버테이블에서 작성자 이름 찾기
    @Override
    public String getUser_name(int user_num) {
    	return sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.getUser_name",user_num);
    }
    //글읽기
    @Override
    public CampReviewDto read(int review_num) {
    	//조회수 증가.
        int check=sqlSessionTemplate.update("board.mapper.CampReviewMapper.readCount",review_num);
    	return sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.readContent", review_num);
    }
    //글 삭제
    @Override
    public int delete(int review_num) {
    	int check=0;
    	
    	//파일게시판에서 있는지 먼저 default check에 넣어주기
    	int defaultCheck=sqlSessionTemplate.delete("board.mapper.CampReviewMapper.reviewFileDelete",review_num);
    	//0보다 크면 일반게시판에있는것도 지워주기
    	if (defaultCheck > 0) {
			check = sqlSessionTemplate.delete("board.mapper.CampReviewMapper.campReviewDelete", review_num);
		}
    	//위에파일이없어서check 값이0이면 campReviewDto에서 지워주기
    	if(check==0) {
    		check = sqlSessionTemplate.delete("board.mapper.CampReviewMapper.campReviewDelete", review_num);
    	}
    	return check;
    }
    //글 수정=> 글읽기메소드 같이씀
    //수정시 이미지 있으면 이미지 불러오기
    @Override
    public String getFileName(int review_num) {
    	return sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.getFileName",review_num);
    }
    //새로수정해서 올리는 이미지있으면 기존의 파일 삭제해주기
    @Override
    public int fileDelete(int review_num) {
    
    	return sqlSessionTemplate.delete("board.mapper.CampReviewMapper.fileDelete", review_num);
    }
    //수정확인
    @Override
    public int updateOk(CampReviewDto campReviewDto, CampReviewFileDto campReviewFileDto) {
    	
    	int check = 0;

		int defaultCheck = sqlSessionTemplate.update("board.mapper.CampReviewMapper.campReviewUpdateOk", campReviewDto);
		if (defaultCheck > 0 && campReviewFileDto.getFile_name()!=null) {
				int maxNum=sqlSessionTemplate.selectOne("board.mapper.CampReviewMapper.setMaxNum");
				campReviewFileDto.setReview_num(maxNum);
				check = sqlSessionTemplate.insert("board.mapper.CampReviewMapper.campReviewFileInsert", campReviewFileDto);

			defaultCheck = check;
		}
		return defaultCheck;
	}
}
