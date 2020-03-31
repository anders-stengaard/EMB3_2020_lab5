library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- USE ieee.numeric_std.ALL; 

Library UNISIM;                    -- For Xilinx primitives
use UNISIM.vcomponents.all;        --   allow all "components"

entity receiver_top is
    Port ( CLK100_I     : in STD_LOGIC;
           TX_O        : out STD_LOGIC;
           RX_I        : in STD_LOGIC;
           LEDS_O      : out STD_LOGIC_VECTOR(7 downto 0);
           STATUSLED_O : out STD_LOGIC );
end receiver_top;

architecture rtl of receiver_top is


-- Define linkmaster component
component QLinkMaster is
  Generic ( CLK_I_PERIOD : real range 2.0 to 64.0);
  Port    ( RESET_I  : in STD_LOGIC;
            CLK_I  : in STD_LOGIC;
            RX_I     : in STD_LOGIC;
            TX_O     : out STD_LOGIC;
            --------------
            CLK48_O  : out STD_LOGIC;
            ADDR_B_O : out STD_LOGIC_VECTOR(7 downto 0);
            DATA_B_O : out STD_LOGIC_VECTOR(31 downto 0);
            DATA_B_I : in  STD_LOGIC_VECTOR(31 downto 0);
            WR_O     : out STD_LOGIC;
            RD_O     : out STD_LOGIC;
            RESET_O  : out STD_LOGIC;
            LED_O    : out STD_LOGIC );
end component;

component myram is
    Port ( CLK_I   : in STD_LOGIC;
           WR_I    : in STD_LOGIC;
           A_I     : in STD_LOGIC_VECTOR (7 downto 0);
           D_I     : in STD_LOGIC_VECTOR (31 downto 0);
           D_O     : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component rams_ug627 is
  port(clk : in std_logic;
        we : in std_logic;
        en : in std_logic;
       addr: in std_logic_vector(7 downto 0);
         di: in std_logic_vector(31 downto 0);
         do: out std_logic_vector(31 downto 0));
  end component;

component ram_unisim is
  port(RESET_I : in std_logic;
         CLK_I : in std_logic;
          WE_I : in std_logic;
          EN_I : in std_logic;
         ADDR_I: in std_logic_vector(7 downto 0);
           DI_I: in std_logic_vector(31 downto 0);
           DO_O: out std_logic_vector(31 downto 0));
  end component;

---------------------- SIGNALS -------------------------
  signal sys_reset : std_logic;
  signal clk48     : std_logic;
  signal adr       : std_logic_vector(7 downto 0);
  signal data_w    : std_logic_vector(31 downto 0);
  signal data_r    : std_logic_vector(31 downto 0);
  signal wr,rd     : std_logic;  
  signal leds : std_logic_vector(7 downto 0);
begin

LEDS_O<=leds;

QLINK1: QLinkMaster
  generic map ( CLK_I_PERIOD => 10.0) -- Instantiate the QLinkMaster for 100MHz input clock   
  port map (
         RESET_I => '0',
         RESET_O => sys_reset,
         CLK_I =>CLK100_I,
         RX_I    => RX_I,
         TX_O => TX_O,
         CLK48_O => clk48,
         ADDR_B_O => adr,
         DATA_B_O => data_w,
         DATA_B_I => data_r, 
         WR_O     => wr, 
         RD_O     => rd,
         LED_O    => STATUSLED_O);

RAM1: myram           -- My own example ... can be brought to infer distributed- or block-RAM
port map (
           CLK_I => clk48,
           WR_I  => wr,            
           A_I   => adr, 
           D_I   => data_w
          ,D_O   => data_r
 );

RAM2: rams_ug627    -- Copied from UG627 example ... infers block-RAM
 port map (clk => clk48, 
        we => wr, 
        en => '1', 
       addr => adr,
         di => data_w
--         ,do => data_r
);

RAM3: ram_unisim    -- Copied from UG953 example ... specifies 7-series block-RAM
port map (RESET_I => sys_reset,
        CLK_I => clk48, 
        WE_I => wr, 
        EN_I => '1', 
       ADDR_I => adr,
         DI_I => data_w
--         ,DO_O => data_r
         );


--process(clk48)
--begin
--  if clk48'event and clk48='1' then
--    if sys_reset='1' then
--      leds<="01010101";
--      data_r<= X"aa55aa55";  
--    else
--      data_r<= X"FF0aa0" & adr;  
--      if wr='1' then
--        leds<=data_w(31 downto 24);
--      elsif rd='1' then  
--        leds<=adr;
--      else
--        leds<=leds;
--      end if;
--    end if; -- sys_reset
--  end if; -- clk100'event
--end process;

end rtl;
