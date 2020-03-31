--
-- Copied and adapted from Xilinx UG627 v 14.3 pp 135
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity rams_ug627 is
  port(clk : in std_logic;
        we : in std_logic;
        en : in std_logic;
       addr: in std_logic_vector(7 downto 0);
         di: in std_logic_vector(31 downto 0);
         do: out std_logic_vector(31 downto 0));
  end rams_ug627;

  architecture syn of rams_ug627 is
    type ram_type is array(255 downto 0) of std_logic_vector(31 downto 0);
    signal RAM : ram_type;
  begin

  process(clk)
  begin
    if clk'event and clk='1' then
      if en='1' then
        if we='1' then
          RAM(conv_integer(addr))<=di;
        end if;
        do<=RAM(conv_integer(addr));
      end if;
    end if;
  end process;
end syn;
