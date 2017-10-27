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
-- Generated on "10/27/2017 23:39:12"
                                                            
-- Vhdl Test Bench template for design  :  avalon_image_writer
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY avalon_image_writer_vhd_tst IS
END avalon_image_writer_vhd_tst;
ARCHITECTURE avalon_image_writer_arch OF avalon_image_writer_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL data_valid : STD_LOGIC;
SIGNAL frame_valid : STD_LOGIC;
SIGNAL input_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL M_address : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL M_burstcount : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL M_byteenable : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL M_waitrequest : STD_LOGIC;
SIGNAL M_write : STD_LOGIC;
SIGNAL M_writedata : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL reset_n : STD_LOGIC;
SIGNAL S_address : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S_read : STD_LOGIC;
SIGNAL S_readdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S_write : STD_LOGIC;
SIGNAL S_writedata : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT avalon_image_writer
	PORT (
	clk : IN STD_LOGIC;
	data_valid : IN STD_LOGIC;
	frame_valid : IN STD_LOGIC;
	input_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	M_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	M_burstcount : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	M_byteenable : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	M_waitrequest : IN STD_LOGIC;
	M_write : OUT STD_LOGIC;
	M_writedata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	reset_n : IN STD_LOGIC;
	S_address : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	S_read : IN STD_LOGIC;
	S_readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	S_write : IN STD_LOGIC;
	S_writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

-------------------------------------------------------------
----------------    SIMULATION SIGNALS & VARIABLES    -------

	signal sim_clk   				: STD_LOGIC 	:= '0';
	signal sim_reset 				: STD_LOGIC 	:= '0';
	signal sim_trig  				: STD_LOGIC 	:= '0';
	shared variable edge_rise  : integer    	:= -1;
	shared variable edge_fall 	: integer    	:= -1;

BEGIN
	i1 : avalon_image_writer
--	GENERIC MAP(
--			COMPONENT_SIZE 	=> 8,
--			NUMBER_COMPONENTS => 1,
--			PIX_WR => 4)
	
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	data_valid => data_valid,
	frame_valid => frame_valid,
	input_data => input_data,
	M_address => M_address,
	M_burstcount => M_burstcount,
	M_byteenable => M_byteenable,
	M_waitrequest => M_waitrequest,
	M_write => M_write,
	M_writedata => M_writedata,
	reset_n => reset_n,
	S_address => S_address,
	S_read => S_read,
	S_readdata => S_readdata,
	S_write => S_write,
	S_writedata => S_writedata
	);

-------------------------------------------------------------
----------------    CLOCK & RESET SIGNALS    ----------------  
	clk 	<= sim_clk;
	reset_n <= sim_reset;	
	
-------------------------------------------------------------
----------------    CLOCK PROCESS    ------------------------     
	simulation_clock : process
		-- repeat the counters edge_rise & edge_fall
		constant max_cycles    	: integer   := 100;
	begin
		-- set sim_clk signal
		sim_clk <= not(sim_clk);
		-- adjust 
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
		
		if ( edge_rise = 0 ) then
			input_data <= (others => '0');
			frame_valid <= '0';
			data_valid <= '0';
			S_address <= (others => '0');
			S_writedata <= (others => '0');
			S_write <= '0';
			S_read <= '0';
			M_waitrequest <= '0'; 
			sim_reset 	<= '0';	-- reset
		end if;
		if ( edge_rise = 1 ) then
			sim_reset 	<= '1';	-- stop reset
		end if;
		---------------------------------------------
		---Lets capture a 4x2 image (4columns 2 rows)
		---------------------------------------------
		
		-------Program the component using avalon slave--------
		---Write img width
		if ( edge_rise = 3 ) then
			S_address <= "0001";--1
			S_writedata <= X"00000004";
			S_write <= '1';
		end if;
		---Write img height
		if ( edge_rise = 4 ) then
			S_address <= "0010";--2
			S_writedata <= X"00000002";
		end if;
		---Write buff 0
		if ( edge_rise = 5 ) then
			S_address <= "0011";--3
			S_writedata <= X"C0000000";
		end if;
		---Write buff 1
		if ( edge_rise = 6 ) then
			S_address <= "0100";--4
			S_writedata <= X"C0004000";
		end if;
		--Select buffer to write
		if ( edge_rise = 7 ) then
			S_address <= "0101";--5
			S_writedata <= X"00000000";
		end if;
		--Choose downsampling
		if ( edge_rise = 8 ) then
			S_address <= "0111";--7
			S_writedata <= X"00000001";
		end if;
		--Start capture!!!
		if ( edge_rise = 9 ) then
			S_address <= "0000";--0
			S_writedata <= X"00000001";
		end if;
		if ( edge_rise = 10 ) then
			S_address <= "0000";--0
			S_writedata <= X"00000000";
		end if;
		if ( edge_rise = 11 ) then
			S_write <= '0';
		end if;
		
		----------------Program the 8 pixels-------------
		if ( edge_rise = 13 ) then
			frame_valid <= '1';
		end if;

		--Pix 0
		if ( edge_rise = 17 ) then
			data_valid <= '1';
			input_data <= X"01";
		end if;
		if ( edge_rise = 18 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 1
		if ( edge_rise = 19 ) then
			data_valid <= '1';
			input_data <= X"02";
		end if;
		if ( edge_rise = 20 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 2
		if ( edge_rise = 21 ) then
			data_valid <= '1';
			input_data <= X"03";
		end if;
		if ( edge_rise = 22 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 3
		if ( edge_rise = 23 ) then
			data_valid <= '1';
			input_data <= X"04";
		end if;
		if ( edge_rise = 24 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 4
		if ( edge_rise = 25 ) then
			data_valid <= '1';
			input_data <= X"05";
		end if;
		if ( edge_rise = 26 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 5
		if ( edge_rise = 27 ) then
			data_valid <= '1';
			input_data <= X"06";
		end if;
		if ( edge_rise = 28 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 6
		if ( edge_rise = 29 ) then
			data_valid <= '1';
			input_data <= X"07";
		end if;
		if ( edge_rise = 30 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		--Pix 7
		if ( edge_rise = 31 ) then
			data_valid <= '1';
			input_data <= X"08";
		end if;
		if ( edge_rise = 32 ) then
			data_valid <= '0';
			input_data <= X"00";
		end if;
		
		
		if ( edge_rise = 36 ) then
			frame_valid <= '0';
		end if;
		
	end process stimuli;           
	
END avalon_image_writer_arch;
