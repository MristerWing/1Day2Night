package com.odtn.owner.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.service.OwnerService;
import com.odtn.reservation.dto.ReservationDto;
import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;

/**
 * @author KimJinsu
 * @date 2019/12/30
 * @apiNote 사업자 컨트롤러
 */
@Controller
public class OwnerController {

	@Autowired
	private OwnerService ownerService;

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/login.do", method = RequestMethod.GET)
	public ModelAndView ownerLogin(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		HttpSession session = request.getSession();

		int user_num = (session.getAttribute("user_num") != null
				? (Integer) session.getAttribute("user_num")
				: 0);

		modelAndView.addObject("request", request);
		if (user_num > 0) {
			modelAndView.setViewName("owner/login.tiles");
			LogAspect.logger.info(LogAspect.logMsg + user_num);
		} else {
			modelAndView.setViewName("member/login.tiles");
		}
		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/loginOk.do", method = RequestMethod.POST)
	public ModelAndView ownerLoginOk(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();

		String owner_key = request.getParameter("owner_key");

		int user_num = (session.getAttribute("user_num") != null
				? (Integer) session.getAttribute("user_num")
				: 0);

		ModelAndView modelAndView = ownerService.ownerLoginOk(owner_key,
				user_num);
		modelAndView.setViewName("owner/loginOk.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/register.do", method = RequestMethod.GET)
	public ModelAndView ownerRegister(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("owner/register.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/checkOwnerKey.do", method = RequestMethod.GET)
	@ResponseBody
	public String ownerCheckOwnerKey(HttpServletRequest request,
			HttpServletResponse response) {
		return ownerService.checkOwnerKey(
				Long.parseLong(request.getParameter("owner_key")));
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/write.do", method = RequestMethod.GET)
	public ModelAndView ownerWrite(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("owner_key", request.getParameter("owner-key"));
		modelAndView.setViewName("owner/write.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/ownerWriteOk.do", method = RequestMethod.POST)
	public ModelAndView ownerWriteOk(MultipartHttpServletRequest request) {

		SearchDto updateCamp = new SearchDto(0,
				request.getParameter("camp_name"),
				request.getParameter("title"),
				request.getParameter("camp_type"), request.getParameter("tag"),
				"", request.getParameter("address"), request.getParameter("hp"),
				request.getParameter("location_type"),
				request.getParameter("operation_type"),
				request.getParameter("operation_period"),
				request.getParameter("operation_day"),
				request.getParameter("camp_link"), "", "", "",
				request.getParameter("content"), new Date(),
				request.getParameter("main_facilities"),
				request.getParameter("etc_facilities"),
				request.getParameter("bottom_type"),
				request.getParameter("site_size"),
				request.getParameter("gramping_facilities"),
				request.getParameter("karaban_facilities"),
				request.getParameter("animal_access"),
				request.getParameter("torch"), 0, new Date(), 0, 0, 0.0, 0.0);

		MultipartFile mainImage = request.getFile("mainImage");
		List<MultipartFile> subImage = request.getFiles("subImage");

		ModelAndView modelAndView = ownerService.ownerUpdateOk(updateCamp,
				mainImage, subImage, request.getContextPath(), false);
		long owner_key = Long.parseLong(request.getParameter("owner_key"));
		int user_num = (Integer) request.getSession().getAttribute("user_num");

		OwnerDto ownerDto = new OwnerDto(owner_key, updateCamp.getCamp_id(),
				user_num);
		ownerService.ownerInsert(ownerDto, modelAndView);

		modelAndView.setViewName("owner/writeOk.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/mainPage.do", method = RequestMethod.POST)
	public ModelAndView ownerMainPage(HttpServletRequest request,
			OwnerDto ownerDto) {

		LogAspect.logger.info(LogAspect.logMsg + "owner" + ownerDto.toString());

		ModelAndView modelAndView = ownerService.ownerMainpage(ownerDto);
		modelAndView.setViewName("owner/mainPage.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return List<ReservationDto>
	 */
	@RequestMapping(value = "/owner/reservationList.json", method = RequestMethod.POST)
	@ResponseBody
	public List<ReservationDto> ownerReservationList(@RequestParam int camp_id,
			@RequestParam String fee_name) {
		LogAspect.logger.info(LogAspect.logMsg + camp_id + fee_name);
		return ownerService.getReservationList(camp_id, fee_name);
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return List<Map<String, Object>>
	 */
	@RequestMapping(value = "/owner/reservationChart.json", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> ownerReservationChart(
			@RequestParam int camp_id) {
		return ownerService.getReservationChart(camp_id);
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/update.do", method = RequestMethod.GET)
	public ModelAndView ownerUpdate(@RequestParam int camp_id,
			@RequestParam Long owner_key) {
		LogAspect.logger.info(LogAspect.logMsg + camp_id + ", " + owner_key);

		ModelAndView modelAndView = ownerService.ownerUpdate(camp_id);
		modelAndView.addObject("camp_id", camp_id);
		modelAndView.addObject("owner_key", owner_key);
		modelAndView.setViewName("owner/update.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return List<Map<String, Object>>
	 */
	@RequestMapping(value = "/owner/ownerUpdate.do", method = RequestMethod.POST)
	public ModelAndView ownerUpdateFile(MultipartHttpServletRequest request) {

		SearchDto updateCamp = new SearchDto(
				Integer.parseInt(request.getParameter("camp_id")),
				request.getParameter("camp_name"),
				request.getParameter("title"),
				request.getParameter("camp_type"), request.getParameter("tag"),
				"", request.getParameter("address"), request.getParameter("hp"),
				request.getParameter("location_type"),
				request.getParameter("operation_type"),
				request.getParameter("operation_period"),
				request.getParameter("operation_day"),
				request.getParameter("camp_link"), "", "", "",
				request.getParameter("content"), new Date(),
				request.getParameter("main_facilities"),
				request.getParameter("etc_facilities"),
				request.getParameter("bottom_type"),
				request.getParameter("site_size"),
				request.getParameter("gramping_facilities"),
				request.getParameter("karaban_facilities"),
				request.getParameter("animal_access"),
				request.getParameter("torch"), 0, new Date(), 0, 0, 0.0, 0.0);

		MultipartFile mainImage = request.getFile("mainImage");
		List<MultipartFile> subImage = request.getFiles("subImage");

		LogAspect.logger.info(LogAspect.logMsg + "req=" + mainImage.getSize());

		ModelAndView modelAndView = ownerService.ownerUpdateOk(updateCamp,
				mainImage, subImage, request.getContextPath(), true);

		modelAndView.setViewName("owner/updateOk.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/updatePayment.do", method = RequestMethod.GET)
	public ModelAndView ownerUpdatePayment(@RequestParam int camp_id) {

		ModelAndView modelAndView = ownerService.ownerUpdatePayment(camp_id);
		modelAndView.setViewName("owner/updatePayment.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/writePayment.do", method = RequestMethod.GET)
	public ModelAndView ownerWritePayment(@RequestParam int camp_id) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("camp_id", camp_id);
		modelAndView.setViewName("owner/writePayment.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/updatePaymentOk.do", method = RequestMethod.POST)
	public ModelAndView ownerUpdatePaymentOk(SearchPaymentDto paymentList) {

		LogAspect.logger.info(LogAspect.logMsg + "paymet?="
				+ paymentList.getSearchPaymentDtoList().get(0)
						.getNormal_season_holidays_fee());

		ModelAndView modelAndView = ownerService
				.ownerUpdatePaymentOk(paymentList.getSearchPaymentDtoList());
		modelAndView.setViewName("owner/updateOk.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/writePaymentOk.do", method = RequestMethod.POST)
	public ModelAndView ownerWritePaymentOk(SearchPaymentDto paymentList) {

		LogAspect.logger.info(LogAspect.logMsg + "paymet?="
				+ paymentList.getSearchPaymentDtoList().get(0)
						.getNormal_season_holidays_fee());

		ModelAndView modelAndView = ownerService
				.ownerWritePaymentOk(paymentList.getSearchPaymentDtoList());
		modelAndView.setViewName("owner/writePaymentOk.tiles");

		return modelAndView;
	}

}
