//vedeti README-ul

module temperature_top(
	output [7:0] led_output_o,
	output alert_o,
	input [39:0] sensors_data_i,
	input [4:0] sensors_en_i
    );
	
	//declar cabluri ca sa fac legarea dintre outputuri cu inputuri
	wire [15:0] tempN;
	wire [7:0] sensors;
	wire [15:0] QtoTempQ;
	wire [15:0] RtoTempR;
	wire [15:0] sensorsDivision; //un wire ca sa fac conversia din 8 bitii pe 16
	
	sensors_input sInput(
		.temp_sum_o(tempN),
		.nr_active_sensors_o(sensors),
		.sensors_data_i(sensors_data_i),
		.sensors_en_i(sensors_en_i)
	);
	
	assign sensorsDivision = sensors; //am facut conversia
	
	division div(
		.Q(QtoTempQ),
		.R(RtoTempR),
		.N(tempN),
		.D(sensorsDivision)
	);
	
	output_display out(
		.coded_out_o(led_output_o),
		.alert_o(alert_o),
		.temp_Q_i(QtoTempQ),
		.temp_R_i(RtoTempR),
		.active_sensors_nr(sensors)
	);
endmodule
