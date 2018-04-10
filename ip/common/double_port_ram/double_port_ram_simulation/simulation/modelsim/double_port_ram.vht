-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions
-- and other software and tools, and its AMPP partner logic
-- functions, and any output files from any of the foregoing
-- (including device programming or simulation files), and any
-- associated documentation or information are expressly subject
-- to the terms and conditions of the Altera Program License
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other
-- applicable license agreement, including, without limitation,
-- that your use is for the sole purpose of programming logic
-- devices manufactured by Altera and sold by Altera or its
-- authorized distributors.  Please refer to the applicable
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to
-- suit user's needs .Comments are provided in each section to help the user
-- fill out necessary details.
-- ***************************************************************************
-- Generated on "04/09/2018 23:11:15"

-- Vhdl Test Bench template for design  :  double_port_ram
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY double_port_ram_vhd_tst IS
END double_port_ram_vhd_tst;
ARCHITECTURE double_port_ram_arch OF double_port_ram_vhd_tst IS
-- constants
-- signals
SIGNAL clock 			: STD_LOGIC;
SIGNAL data 			: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL q 					: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rdaddress 	: STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL wraddress 	: STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL wren 			: STD_LOGIC;
COMPONENT double_port_ram
	PORT (
	clock 		: IN STD_LOGIC;
	data 			: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	q 				: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	rdaddress : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	wraddress : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	wren 			: IN STD_LOGIC
	);
END COMPONENT;

-------------------------------------------------------------
----------------    SIMULATION SIGNALS & VARIABLES    -------

	signal sim_clk             : STD_LOGIC 	:= '0';
	--signal sim_reset         : STD_LOGIC 	:= '0';
	signal sim_trig            : STD_LOGIC 	:= '0';
	shared variable edge_rise  : integer    	:= -1;
	shared variable edge_fall  : integer    	:= -1;

BEGIN
	i1 : double_port_ram
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	data => data,
	q => q,
	rdaddress => rdaddress,
	wraddress => wraddress,
	wren => wren
	);
  -------------------------------------------------------------
  ----------------    CLOCK & RESET SIGNALS    ----------------
  	clock 	  <= sim_clk;
  -------------------------------------------------------------
  ----------------    CLOCK PROCESS    ------------------------
  	simulation_clock : process
  		-- repeat the counters edge_rise & edge_fall
  		constant max_cycles    	: integer   := 140;
  	begin
  		-- set sim_clk signal
  		sim_clk <= not(sim_clk);
  		-- adjust
      -- simular lectura escritura y lectura/escrura a un ciclo y a la vez
  		if (sim_clk = '0') then
  			edge_rise := edge_rise + 1;
  		else
  			edge_fall := edge_fall + 1;
  		end if;
  		if( edge_fall = max_cycles ) then
  			edge_rise := 0;
  			edge_fall := 0;
  		end if;
  		-- trigger the stimuli process
  		wait for 0.05 ns;
  		sim_trig <= not(sim_trig);
  		-- wait until end of 1/2 period
  		wait for 0.45 ns;
  	end process simulation_clock;


  -------------------------------------------------------------
  ----------------    STIMULI PROCESS    ----------------------
  stimuli : process (sim_trig)
  	variable  sample_count : integer := 0;
  begin
  	--Initialization
  	if ( edge_rise = 0 ) then
  		--sim_reset 	<= '0';	-- reset
  		data 	<= B"0000000000000000";
      wraddress <= B"00000000000";
      rdaddress <= B"00000000000";
      wren <= '0';

  	end if;
  	if ( edge_rise = 1 ) then
  		--sim_reset 	<= '1';	-- stop reset
  	end if;

    -- 1. Write
    -- 2. Read
    -- 3. Write/Read simultaneously

  	-- Write
  	if ( edge_rise = 5 ) then
      wraddress <= B"01111001111";
      data 	<= B"1111001111001111";
      wren <= '1';
  	end if;
		-- if ( edge_rise = 10 ) then
    --   wraddress <= B"01111001111";
		-- 	rdaddress
		-- 	data 	<= B"1111001111001111";
    --   wren <= '1';
  	-- end if;
  	if ( edge_rise = 6 ) then
      wren <= '0';
    end if;
  	--Read
  	if ( edge_rise = 9 ) then
  		rdaddress <= B"01111001111";
  	end if;
  	if ( edge_rise = 13 ) then
  		wren <= '1';
  	end if;
		if ( edge_rise = 14 ) then
			wren <= '0';
  	end if;
		if ( edge_rise = 15 ) then
			--data 	<= B"0000000000000000";
		end if;
    if ( edge_rise = 19 ) then
  		--sim_reset 	<= '0';	-- reset
  		data 	<= B"0000000000000000";
      wraddress <= B"00000000000";
			wren <= '1';
      rdaddress <= B"00000000000";

  	end if;
  	if ( edge_rise = 20 ) then
      wraddress <= B"01111001111";
      data 	<= B"1111001111001111";
      wren <= '0';
  	end if;
  	if ( edge_rise = 21 ) then
  	end if;
    --wren <= '0';
  	--Read
  		if ( edge_rise = 22 ) then
  		rdaddress <= B"01111001111";
  	end if;
  	if ( edge_rise = 23 ) then
  		--wren <= '1';
  	end if;
  	--Write/Read
		if ( edge_rise = 24 ) then
	    data 	<= B"0000000000000000";
  	end if;
  end process stimuli;
END double_port_ram_arch;
