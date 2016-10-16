library ieee;
use ieee.std_logic_1164.all;

entity ALU_adder is
port(  
	x,y: in std_logic_vector(16 downto 0);
	c_in : in std_logic;
	s: out std_logic_vector(15 downto 0);
       	c_out: out std_logic
 );
end ALU_adder;
--- architechture to be edited after deliberation
--- not yet completed
architecture Formula_adder of ALU_adder is
signal c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16:std_logic
begin
dut0:full_adder port map(X=> x(0),Y=> y(0),cin=>cin,s=>s(0),c_out=>c0);
dut1:full_adder port map(X=> x(1),Y=> y(1),cin=>c0,s=>s(1),c_out=>c1);
dut2:full_adder port map(X=> x(2),Y=> y(2),cin=>c1,s=>s(2),c_out=>c2);
dut3:full_adder port map(X=> x(3),Y=> y(3),cin=>c2,s=>s(3),c_out=>c3);

dut4:full_adder port map(X=> x(4),Y=> y(4),cin=>c3,s=>s(4),c_out=>c4);
dut5:full_adder port map(X=> x(5),Y=> y(5),cin=>c4,s=>s(5),c_out=>c5);
dut6:full_adder port map(X=> x(6),Y=> y(6),cin=>c5,s=>s(6),c_out=>c6);
dut7:full_adder port map(X=> x(7),Y=> y(7),cin=>c6,s=>s(7),c_out=>c7);

dut8:full_adder port map(X=> x(8),Y=> y(8),cin=>c7,s=>s(8),c_out=>c8);
dut9:full_adder port map(X=> x(9),Y=> y(9),cin=>c8,s=>s(9),c_out=>c9);
dut10:full_adder port map(X=> x(10),Y=> y(10),cin=>c9,s=>s(10),c_out=>c10);
dut11:full_adder port map(X=> x(11),Y=> y(11),cin=>c10,s=>s(11),c_out=>c11);

dut12:full_adder port map(X=> x(12),Y=> y(12),cin=>c11,s=>s(12),c_out=>c12);
dut13:full_adder port map(X=> x(13),Y=> y(13),cin=>c12,s=>s(13),c_out=>c13);
dut14:full_adder port map(X=> x(14),Y=> y(14),cin=>c13,s=>s(14),c_out=>c14);
dut15:full_adder port map(X=> x(15),Y=> y(15),cin=>c14,s=>s(15),c_out=>c15);
--- the function of cout yet not clear

dut16:full_adder port map(X=> x(16),Y=> y(16),cin=>c15,s=>cout,c_out=>c16);

end Formula_adder;