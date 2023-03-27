`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Youssef Ahmed
// 
// Create Date: 03/17/2023 12:13:00 AM
// Design Name: 
// Module Name: Buad_rate_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module Buad_rate_gen #( 

                     parameter divsr_width=10

                 )
						  
					  (
						 
						 input clk,Reset,
						 input[divsr_width-1:0] divsr,
						 output tick
);



logic[divsr_width-1:0] count_logic,count_next;



always_ff@(posedge clk, posedge Reset)
begin 

     if(Reset)
	     count_logic<=0;
	  else
	     count_logic<=count_next;
		  

end





always_comb
begin


    if(count_logic==divsr)
	       count_next=0;
			 
	 else
	       count_next<=count_logic+1;

end





assign tick=(divsr==count_logic) ? 1 : 0;




endmodule 

