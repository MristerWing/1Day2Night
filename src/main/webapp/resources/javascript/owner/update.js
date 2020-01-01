function makeCheckBoxs(allArray, data, id) {
	var selected = data.replace(/ /gi, '').split(/,|\+/);
	//console.log(id, selected);
	for (var i = 0; i < allArray.length; i++) {
		var checked = '';
		if (selected.some(x => x == allArray[i])) {
			checked = 'checked';
		}
		var labelfor = i + 1;
		$('#' + id).append(
			"<div class='form-check-inline'>" +
				'<br>' +
				"<label class='form-check-label' for='" +
				id +
				'-checkbox' +
				labelfor +
				"'>" +
				"<input type='checkbox' class='form-check-input' id='" +
				id +
				'-checkbox' +
				labelfor +
				"' name='" +
				id +
				"' value='" +
				allArray[i] +
				"' " +
				checked +
				'>' +
				allArray[i] +
				'</label>' +
				'</div>'
		);
	}
}

function returnForm() {
	const form = $('#inputForm');
	
	/* 히든타입 추가해야할 목록
	 * 
	 * camp_type
	 * tag
	 * location_type
	 * operation_type
	 * operation_period
	 * operation_day
	 * content_modified_date
	 * main_facilities
	 */
	
	// 체크박스 값 가져오기
	$("input[name=loc]:checked").each(function () {
		console.log($(this).val());
	});
	
	/* ajax이용 비동기파일처리 요구
	 * main-image ->
	 * main_image
	 * 
	 * sub-image ->
	 * sub_image1 
	 * sub_image2
	 * sub_image3
	 */
	
	console.log($("#inputForm input[name=main-image]"));
	console.log($("#inputForm input[name=sub-image]"));
}
