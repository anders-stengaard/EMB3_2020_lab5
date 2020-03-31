library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity myram is
  Port ( CLK_I   : in STD_LOGIC;
         WR_I    : in STD_LOGIC;
         A_I     : in STD_LOGIC_VECTOR (7 downto 0);
         D_I     : in STD_LOGIC_VECTOR (31 downto 0);
         D_O     : out STD_LOGIC_VECTOR (31 downto 0));
end myram;

architecture Behavioral of myram is

type RAM_T is array (255 downto 0) of std_logic_vector(31 downto 0);
signal ram : RAM_T;

alias clk   : std_logic is CLK_I;

signal adr : integer range 0 to 255;

begin

adr <= conv_integer(A_I);

process(clk)
--variable nxt_ram : RAM_T;
begin
  --nxt_ram := ram;
  if clk'event and clk='1' then
    if WR_I='1' then
      ram(adr) <= D_I;         -- If this is active .. instead of line 3 down, RAM will be infered block RAM
--      nxt_ram(adr) := D_I;         
    end if;
--    ram <= nxt_ram;                -- If this is active ... RAM will be distributed
    D_O <= ram(adr);     
  end if;
  
end process;

end Behavioral;
