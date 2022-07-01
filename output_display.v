//vedeti README-ul

module output_display(
	output reg[7:0] coded_out_o,
	output reg alert_o,
	input [15:0] temp_Q_i,
	input [15:0] temp_R_i,
	input [7:0] active_sensors_nr
    );
	 

	 
	always@(*)begin
		
		//am pus conditia daca temperatura este mai mica decat 18 sau mai mare decat 26
		//asa cum arata si in tabel cu decodarea specificata si alarmul 1
		
		if(temp_Q_i < 18)begin
			coded_out_o = 8'b0000_0001;
			alert_o = 1;
		end else if(temp_Q_i > 26)begin
			coded_out_o = 8'b1111_1111;
			alert_o = 1;
		end
		
		//am facut cu case cazuri cand temperatura este 18 pana 26
		//si cum sunt codate temperaturile si cazuri in care trebuie
		//sa avem alarma asa cum este detaliat pe tabel
		
		case(temp_Q_i)
			18: begin
					if(temp_R_i*2 < active_sensors_nr)begin //relatia temp_R_i*2 < active_sensors_nr am explicat pe readme detaliat
						coded_out_o = 8'b0000_0001;
						alert_o = 1;
					end else begin
						coded_out_o = 8'b0000_0001;
						alert_o = 0;
					end
				end
			19: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0000_0001;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b0000_0011;
						alert_o = 0;
					end
				end
			20: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0000_0011;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b0000_0111;
						alert_o = 0;
					end
				end
			21: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0000_0111;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b0000_1111;
						alert_o = 0;
					end
				end
			22: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0000_1111;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b0001_1111;
						alert_o = 0;
					end
				end
			23: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0001_1111;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b0011_1111;
						alert_o = 0;
					end
				end
			24: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0011_1111;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b0111_1111;
						alert_o = 0;
					end
				end
			25: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b0111_1111;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b1111_1111;
						alert_o = 0;
					end
				end
			26: begin
					if(temp_R_i*2 < active_sensors_nr)begin
						coded_out_o = 8'b1111_1111;
						alert_o = 0;
					end else begin
						coded_out_o = 8'b1111_1111;
						alert_o = 1;
					end
				end
			endcase
		end	
endmodule
