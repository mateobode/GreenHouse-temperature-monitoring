//vedeti README-ul

module sensors_input(
	output reg[15:0] temp_sum_o,
	output reg[7:0] nr_active_sensors_o,
	input [39:0] sensors_data_i,
	input [4:0] sensors_en_i
    );
	
	integer i;
	
	always @(*) begin
		
		temp_sum_o = 0;
		nr_active_sensors_o = 0;
	
		//calculez suma a valorilor vectorului sensors_en_i si salvez pe nr_active_sensor valoarea obtinuta
		for(i=0; i<5; i=i+1)begin
			nr_active_sensors_o = nr_active_sensors_o + sensors_en_i[i]; 
		end
		
		//iau de 5 ori temperatura daca valoarea fiecarui bit din 
		//sensors_en_i[4:0] este 1 si adun temperaturii pe temp_sum_o
		
		if(sensors_en_i[0]==1)
			temp_sum_o = temp_sum_o+sensors_data_i[7:0];

		if(sensors_en_i[1]==1)
			temp_sum_o = temp_sum_o+sensors_data_i[15:8];

		if(sensors_en_i[2]==1)
			temp_sum_o = temp_sum_o+sensors_data_i[23:16];

		if(sensors_en_i[3]==1)
			temp_sum_o = temp_sum_o+sensors_data_i[31:24];

		if(sensors_en_i[4]==1)
			temp_sum_o = temp_sum_o+sensors_data_i[39:32];
		
	end
endmodule
