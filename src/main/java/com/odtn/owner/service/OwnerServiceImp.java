package com.odtn.owner.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.owner.dao.OwnerDao;
import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.dto.OwnerMainPageDto;
import com.odtn.reservation.dto.ReservationDto;
import com.odtn.search.dao.SearchDao;
import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;

/**
 * @author KimJinsu
 * @date 2019/12/30
 * @apiNote 사업자 페이지 서비스
 */
@Component
public class OwnerServiceImp implements OwnerService {

	@Autowired
	private OwnerDao ownerDao;

	@Autowired
	private SearchDao searchDao;

	@Override
	public ModelAndView ownerLoginOk(String owner_key, int user_num) {
		ModelAndView modelAndView = new ModelAndView();

		OwnerDto ownerDto = ownerDao.login(owner_key, user_num);

		modelAndView.addObject("ownerDto",
				ownerDto != null ? ownerDto : "error");

		return modelAndView;
	}

	@Override
	public ModelAndView ownerMainpage(OwnerDto ownerDto) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("ownerDto", ownerDto);
		OwnerMainPageDto ownerMainPageDto = ownerDao
				.getMainPage(ownerDto.getOwner_key());
		modelAndView.addObject("ownerMainPageDto", ownerMainPageDto);
		List<SearchPaymentDto> paymentList = searchDao
				.getPayment(ownerDto.getCamp_id());
		modelAndView.addObject("paymentList", paymentList);

		return modelAndView;
	}

	@Override
	public List<Map<String, Object>> getReservationChart(int camp_id) {
		return ownerDao.getReservationCountMap(camp_id);
	}

	@Override
	public List<ReservationDto> getReservationList(int camp_id,
			String fee_name) {
		return ownerDao.getReservationList(camp_id, fee_name);
	}

	@Override
	public String checkOwnerKey(long owner_key) {
		return ownerDao.checkOwnerKey(owner_key);
	}

	@Override
	public ModelAndView ownerUpdate(int camp_id) {
		ModelAndView modelAndView = new ModelAndView();

		SearchDto camp = searchDao.getCamp(camp_id);
		modelAndView.addObject("camp", camp);

		return modelAndView;
	}

	@Override
	public ModelAndView ownerUpdateOk(SearchDto updateCamp,
			MultipartFile mainImage, List<MultipartFile> subImage) {
		ModelAndView modelAndView = new ModelAndView();

		long mainImageSize = mainImage.getSize();
		long subImageSize = subImage.get(0).getSize();

		if (mainImageSize > 0) {
			File mainFile = imageUpload(mainImage, updateCamp.getCamp_id());
			updateCamp.setMain_image(mainFile.getPath());
		}

		if (subImageSize > 0) {
			int count = 0;
			for (MultipartFile image : subImage) {
				File subFile = imageUpload(image, updateCamp.getCamp_id());
				if (count == 0)
					updateCamp.setSub_image1(subFile.getPath());
				if (count == 1)
					updateCamp.setSub_image2(subFile.getPath());
				if (count == 2)
					updateCamp.setSub_image3(subFile.getPath());
			}
		}

		int check = ownerDao.campUpdate(updateCamp);
		LogAspect.logger.info(LogAspect.logMsg + "=update=" + check);

		return modelAndView;
	}

	private File imageUpload(MultipartFile image, int id) {
		long file_size = image.getSize();
		File file = null;
		if (file_size != 0) {
			String file_name = Long.toString(System.currentTimeMillis()) + "_"
					+ image.getOriginalFilename();
			File path = new File("C:\\campImage\\camp" + id + "\\");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {
				file = new File(path, file_name);
				try {
					image.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return file;
	}
}
