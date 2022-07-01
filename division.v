module division(
	output reg[15:0] Q, //Quotient
	output reg[15:0] R, //Rest
	input [15:0] N, //Deimpartit
	input [15:0] D //Impartitor
    );
	
	reg [15:0] temp;
	reg [4:0] i;
	
	always@(*)begin
		Q = N;
		R = 0;
		
		for(i=0; i<16; i=i+1)begin
			
			//shiftez stanga cu 1 bit MSB-ul a lui Q pe LSB-ul a lui R
			//aceasta permita ca D sa fie mutat in R
			R = (R<<1)| Q[15];
			Q = Q << 1;
			
			//stocez valoare a lui R in caz ca trebuie sa restabilez
			temp = R;
			
			//R care are un bit de la D se scad din D pentru a 
			//verifica daca divizarea curenta este posibila
			R = R - D; //scad
			
			//daca scaderea rezulta negativa, algoritmul vede MSB-ul
			if(R[15])
				R = temp; //restabilez valoarea daca nu se face divizarea
			else //daca scaderea rezulta pozitiv
				
				Q = Q | 1; //un 1 este atasat LSB-ul de la Q pentru
							 //a indica faptul ca R se poate diviza o data de la D
		end
	end
endmodule
