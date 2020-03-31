--
-- Copied and adapted from Xilinx UG953 V2018.1 pp 521 - 527 
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Library UNISIM;
use UNISIM.vcomponents.all;



entity ram_unisim is
  port(RESET_I : in std_logic;
         CLK_I : in std_logic;
          WE_I : in std_logic;
          EN_I : in std_logic;
         ADDR_I: in std_logic_vector(7 downto 0);
           DI_I: in std_logic_vector(31 downto 0);
           DO_O: out std_logic_vector(31 downto 0));
  end ram_unisim;

  architecture rtl of ram_unisim is
  
  signal adr : std_logic_vector(13 downto 0);
  signal we4 : std_logic_vector(3 downto 0);

  begin

  adr <=  "000000" & ADDR_I;
  we4 <= WE_I & WE_I & WE_I & WE_I;
  
  
RAMB18E1_inst : RAMB18E1
   generic map (
      -- Address Collision Mode: "PERFORMANCE" or "DELAYED_WRITE" 
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      -- Collision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
      SIM_COLLISION_CHECK => "ALL",
      -- DOA_REG, DOB_REG: Optional output register (0 or 1)
      DOA_REG => 0,
      DOB_REG => 0,
      -- INITP_00 to INITP_07: Initial contents of parity memory array
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- INIT_00 to INIT_3F: Initial contents of data memory array
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- INIT_A, INIT_B: Initial values on output ports
      INIT_A => X"00000",
      INIT_B => X"00000",
      -- Initialization File: RAM initialization file
      INIT_FILE => "NONE",
      -- RAM Mode: "SDP" or "TDP" 
      RAM_MODE => "SDP",
      -- READ_WIDTH_A/B, WRITE_WIDTH_A/B: Read/write width per port
      READ_WIDTH_A => 36,                                                               -- 0-72
      READ_WIDTH_B => 0,                                                               -- 0-18
      WRITE_WIDTH_A => 0,                                                              -- 0-18
      WRITE_WIDTH_B => 36,                                                              -- 0-72
      -- RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      -- SRVAL_A, SRVAL_B: Set/reset value for output
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      -- Simulation Device: Must be set to "7SERIES" for simulation behavior
      SIM_DEVICE => "7SERIES",
      -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST" 
   )
   port map (
      -- Port A Data: 16-bit (each) output: Port A data
      DOADO => DO_O(15 downto 0), -- DOADO,                 -- 16-bit output: A port data/LSB data
      --DOPADOP => DOPADOP,             -- 2-bit output: A port parity/LSB parity
      -- Port B Data: 16-bit (each) output: Port B data
      DOBDO => DO_O(31 downto 16), -- DOBDO,                 -- 16-bit output: B port data/MSB data
      --DOPBDOP => DOPBDOP,             -- 2-bit output: B port parity/MSB parity
      -- Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals (read port
      -- when RAM_MODE="SDP")
      ADDRARDADDR => adr, -- ADDRARDADDR,     -- 14-bit input: A port address/Read address
      CLKARDCLK => CLK_I, -- CLKARDCLK,         -- 1-bit input: A port clock/Read clock
      ENARDEN => EN_I, --ENARDEN,             -- 1-bit input: A port enable/Read enable
      REGCEAREGCE => '1', --REGCEAREGCE,     -- 1-bit input: A port register enable/Register enable
      RSTRAMARSTRAM => '0', --RSTRAMARSTRAM, -- 1-bit input: A port set/reset
      RSTREGARSTREG => '0', --RSTREGARSTREG, -- 1-bit input: A port register set/reset
      WEA =>  "00", -- WEA,                     -- 2-bit input: A port write enable
      -- Port A Data: 16-bit (each) input: Port A data
      DIADI => DI_I(15 downto 0), --DIADI,                 -- 16-bit input: A port data/LSB data
      DIPADIP => "00", -- DIPADIP,             -- 2-bit input: A port parity/LSB parity
      -- Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals (write port
      -- when RAM_MODE="SDP")
      ADDRBWRADDR => adr, -- ADDRBWRADDR,     -- 14-bit input: B port address/Write address
      CLKBWRCLK => CLK_I, --CLKBWRCLK,         -- 1-bit input: B port clock/Write clock
      ENBWREN => WE_I, --ENBWREN,             -- 1-bit input: B port enable/Write enable
      REGCEB => '1', -- REGCEB,               -- 1-bit input: B port register enable
      RSTRAMB => '0', -- RSTRAMB,             -- 1-bit input: B port set/reset
      RSTREGB => '0', -- RSTREGB,             -- 1-bit input: B port register set/reset
      WEBWE => we4, -- WEBWE,                 -- 4-bit input: B port write enable/Write enable
      -- Port B Data: 16-bit (each) input: Port B data
      DIBDI => DI_I(31 downto 16), --DIBDI,                 -- 16-bit input: B port data/MSB data
      DIPBDIP => "00" --DIPBDIP              -- 2-bit input: B port parity/MSB parity
   );

end rtl;