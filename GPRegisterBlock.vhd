-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Sun Feb 23 21:56:58 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY GPRegisterBlock IS 
	PORT
	(
		R0_in :  IN  STD_LOGIC;
		R1_in :  IN  STD_LOGIC;
		R2_in :  IN  STD_LOGIC;
		R3_in :  IN  STD_LOGIC;
		R4_in :  IN  STD_LOGIC;
		R5_in :  IN  STD_LOGIC;
		R6_in :  IN  STD_LOGIC;
		R7_in :  IN  STD_LOGIC;
		R8_in :  IN  STD_LOGIC;
		R9_in :  IN  STD_LOGIC;
		R10_in :  IN  STD_LOGIC;
		R11_in :  IN  STD_LOGIC;
		R12_in :  IN  STD_LOGIC;
		R13_in :  IN  STD_LOGIC;
		R14_in :  IN  STD_LOGIC;
		R15_in :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		clr :  IN  STD_LOGIC;
		d :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R0_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R10_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R11_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R12_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R13_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R14_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R15_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R1_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R2_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R3_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R4_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R5_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R6_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R7_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R8_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R9_busmuxin :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END GPRegisterBlock;

ARCHITECTURE bdf_type OF GPRegisterBlock IS 

COMPONENT register32
	PORT(ld : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : register32
PORT MAP(ld => R0_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R0_busmuxin);


b2v_inst1 : register32
PORT MAP(ld => R1_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R1_busmuxin);


b2v_inst10 : register32
PORT MAP(ld => R9_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R9_busmuxin);


b2v_inst11 : register32
PORT MAP(ld => R10_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R10_busmuxin);


b2v_inst12 : register32
PORT MAP(ld => R11_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R11_busmuxin);


b2v_inst13 : register32
PORT MAP(ld => R12_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R12_busmuxin);


b2v_inst14 : register32
PORT MAP(ld => R13_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R13_busmuxin);


b2v_inst15 : register32
PORT MAP(ld => R14_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R14_busmuxin);


b2v_inst16 : register32
PORT MAP(ld => R15_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R15_busmuxin);


b2v_inst2 : register32
PORT MAP(ld => R2_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R2_busmuxin);


b2v_inst3 : register32
PORT MAP(ld => R3_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R3_busmuxin);


b2v_inst4 : register32
PORT MAP(ld => R4_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R4_busmuxin);


b2v_inst5 : register32
PORT MAP(ld => R5_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R5_busmuxin);


b2v_inst6 : register32
PORT MAP(ld => R6_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R6_busmuxin);


b2v_inst7 : register32
PORT MAP(ld => R7_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R7_busmuxin);


b2v_inst8 : register32
PORT MAP(ld => R8_in,
		 clr => clr,
		 clk => clk,
		 d => d,
		 q => R8_busmuxin);


END bdf_type;