
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
library work;
use work.Microprocessor_project.all;

entity Memory is
port ( Din: in std_logic_vector(15 downto 0);
	Dout: out std_logic_vector(15 downto 0);
	write_enable,read_enable,clk: in std_logic;
	--write_enable,read_enable: in std_logic;
	Addr: in std_logic_vector(15 downto 0)
);
end Memory;

architecture Formula_Memory of Memory is
signal Data :Data_in(65535 downto 0):= (
0 => "0100000001001010", -- Lw r0, r1, 10
1 => "0100001010001011", -- Lw r1, r2, 11
2 => "1001110000000000", -- JLR  pc = pc + imm i.e. 2 + 6. R2 becomes 2+1=3.
3 => "0101001101010101", 
4 => "0010101100001010", 	
5 => "0000000000000100", 
6 => "1100101110000010", 
7 => "0000000000000011",
8 => "0000000000001111",
9 => "1100100101001010",
10 =>"0000000000000101",
11 =>"0100000000001100",
others=>"0000000111010010"
);


begin
 process(clk)		--process(clk)
    begin
        
               --Dout <= Data(to_integer(unsigned(Addr)));
        if (clk'event and (clk  = '0')) then
                if (write_enable = '1') then
                    Data(to_integer(unsigned(Addr))) <= Din  ;
                end if;
		if (read_enable = '1') then
                   Dout<= Data(to_integer(unsigned(Addr)))   ;
                end if;

        end if;
    end process;

end Formula_Memory;
