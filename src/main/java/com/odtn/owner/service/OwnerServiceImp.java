package com.odtn.owner.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
			MultipartFile mainImage, List<MultipartFile> subImage, String root,
			boolean isUpdate) {
		ModelAndView modelAndView = new ModelAndView();

		long mainImageSize = mainImage.getSize();
		long subImageSize = subImage.get(0).getSize();

		if (mainImageSize > 0) {
			imageUpload(mainImage, updateCamp, 0, root);
		}

		if (subImageSize > 0) {
			int count = 1;
			for (MultipartFile image : subImage) {
				imageUpload(image, updateCamp, count, root);
				count++;
			}
		}

		int check = -1;
		if (isUpdate)
			check = ownerDao.campUpdate(updateCamp);
		else {
			int camp_id = ownerDao.getMaxCampId() + 1;
			updateCamp.setCamp_id(camp_id);
			check = ownerDao.campInsert(updateCamp);
			modelAndView.addObject("camp_id", camp_id);
		}
		modelAndView.addObject("check", check);

		return modelAndView;
	}

	@Override
	public void ownerInsert(OwnerDto ownerDto, ModelAndView modelAndView) {
		int ownerInsertCheck = ownerDao.ownerInsert(ownerDto);
		modelAndView.addObject("ownerInsertCheck", ownerInsertCheck);
	}

	private void imageUpload(MultipartFile image, SearchDto updateCamp,
			int index, String root) {
		long file_size = image.getSize();
		if (file_size != 0) {
			String file_name = Long.toString(System.currentTimeMillis()) + "_"
					+ image.getOriginalFilename();
			File path = new File("C:\\campingFile\\");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, file_name);
				try {
					image.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}

				String filePath = root + "/image/" + file_name;

				if (index == 0)
					updateCamp.setMain_image(filePath);
				else if (index == 1)
					updateCamp.setSub_image1(filePath);
				else if (index == 2)
					updateCamp.setSub_image2(filePath);
				else if (index == 3)
					updateCamp.setSub_image3(filePath);
			}
		}
	}

	@Override
	public ModelAndView ownerUpdatePayment(int camp_id) {
		ModelAndView modelAndView = new ModelAndView();
		List<SearchPaymentDto> paymentList = searchDao.getPayment(camp_id);
		modelAndView.addObject("paymentList", paymentList);
		modelAndView.addObject("camp_id", camp_id);

		return modelAndView;
	}

	@Override
	public ModelAndView ownerUpdatePaymentOk(
			List<SearchPaymentDto> paymentList) {
		ModelAndView modelAndView = new ModelAndView();
		int check = ownerDao.campPaymentUpdate(paymentList);
		modelAndView.addObject("check", check);

		return modelAndView;
	}

	@Override
	public ModelAndView ownerWritePaymentOk(
			List<SearchPaymentDto> paymentList) {
		ModelAndView modelAndView = new ModelAndView();
		int check = ownerDao.campPaymentInsert(paymentList);
		modelAndView.addObject("check", check);

		return modelAndView;
	}
}
