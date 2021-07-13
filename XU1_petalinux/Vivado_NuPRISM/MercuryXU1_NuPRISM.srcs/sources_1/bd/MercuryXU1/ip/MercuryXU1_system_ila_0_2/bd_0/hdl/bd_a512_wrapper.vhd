--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_a512_wrapper.bd
--Design : bd_a512_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_a512_wrapper is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end bd_a512_wrapper;

architecture STRUCTURE of bd_a512_wrapper is
  component bd_a512 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component bd_a512;
begin
bd_a512_i: component bd_a512
     port map (
      clk => clk,
      probe0(19 downto 0) => probe0(19 downto 0),
      probe1(19 downto 0) => probe1(19 downto 0),
      probe2(31 downto 0) => probe2(31 downto 0)
    );
end STRUCTURE;
