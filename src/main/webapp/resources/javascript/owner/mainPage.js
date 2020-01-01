function dateTrans(inDate) {
	var day = new Date(inDate);
	var year = day.getFullYear();
	var month = day.getMonth() + 1;
	var date = day.getDate();
	var formatDate = year + '년 ' + month + '월 ' + date + '일 ';

	return formatDate;
}

// page 0: 1page
function reservationList(page, response, id) {
	var loop = page * 10;
	var end = (page + 1) * 10;

	$('#payment' + id + ' > table > tbody *').remove();

	$(response).each(function() {
		var index = response[loop + 1];
		var register_date = dateTrans(index.register_date);
		var start_date = dateTrans(index.start_date);
		var end_date = dateTrans(index.end_date);

		$('#payment' + id + ' > table > tbody').append(
			'<tr>' +
				'<td>' +
				index.reservation_id +
				'</td>' +
				'<td>' +
				index.user_name +
				'</td>' +
				'<td>' +
				index.phone +
				'</td>' +
				'<td>' +
				index.reservation_personnel +
				'</td>' +
				'<td>' +
				register_date +
				'</td>' +
				'<td>' +
				start_date +
				'</td>' +
				'<td>' +
				end_date +
				'</td>' +
				'<td>' +
				index.amount +
				'</td>' +
				'</tr>'
		);
		loop++;
		if (loop > end) return false;
	});
}

function drawChart(id, response) {
	var responseLabels = new Array();
	var responseDatas = new Array();
	for (var { TITLE: type, RESULT: result } of response) {
		responseLabels.push(type);
		responseDatas.push(result);
	}

	var ctx = $('#chart' + id);
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: [...responseLabels],
			datasets: [
				{
					label: '태그별',
					data: [...responseDatas],
					backgroundColor: [
						'rgba(255, 99, 132)',
						'rgba(54, 162, 235)',
						'rgba(255, 206, 86)',
						'rgba(75, 192, 192)',
						'rgba(153, 102, 255)',
						'rgba(255, 159, 64)'
					]
				}
			]
		},
		options: {
			scales: {
				responsive: true
			}
		}
	});
}
