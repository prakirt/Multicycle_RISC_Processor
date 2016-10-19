library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Microprocessor_project.all;



entity ALU is
port( X,Y: in std_logic_vector(15 downto 0);
      Z : out std_logic_vector(15 downto 0);
      carry_flag,zero_flag :out std_logic;
      Control_bits: in std_logic_vector(1 downto 0)
      
 );
end ALU;


architecture Formula_alu of ALU is
signal Nand_out,add_out,Xor_out,Mux_out :std_logic_vector( 15 downto 0);
signal extend_X,extend_Y: std_logic_vector(16 downto 0);
signal carry :std_logic;
signal unused_port_sig: std_logic_vector(15 downto 0);
begin
unused_port_sig <= "ZZZZZZZZZZZZZZZZ";

dut_se1:sign_extender_alu port map(X =>X ,Y=>extend_X);
dut_se2:sign_extender_alu port map(X =>Y ,Y=>extend_Y);

dut_add: ALU_adder port map(X=>extend_X , Y=>extend_Y , s=>add_out,c_in =>'0',c_out => carry);
dut_nand : ALU_NAND port map( X=> X ,Y => Y, Z=>Nand_out);
dut_xor: ALU_XOR port map(X=> X ,Y => Y , Z=>Xor_out);

dut_data_mux:  Data_MUX generic map(control_bit_width=>2 ) 
						port map(Din(0)=>add_out,Din(1) => Nand_out ,Din(2) => Xor_out, Din			(3)=>unused_port_sig,	Dout=>Mux_out,	control_bits => Control_bits);
Z<= Mux_out;
dut_ZC :zero_checker port map(X=> Mux_out,Z=>zero_flag);

carry_flag <= ((Not(Control_bits(0)) and Not(Control_bits(1))) and carry) or ( (Control_bits(0) or Control_bits(1)) and 'Z');



end Formula_alu;

