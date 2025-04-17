`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 04:18:40 PM
// Design Name: 
// Module Name: tb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_top #(
		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7
	)();
    
  localparam pclk_cycle = 10000;

    parameter  ADDR_CORE_VERSION_REG                    =  32'h00000000;
    ///// For PORT-0
    parameter  ADDR_RESET_REG_0                         =  32'h00000004;
    parameter  ADDR_MODE_REG_0                          =  32'h00000008;
    parameter  ADDR_CONFIG_TX_REG1_0                    =  32'h0000000C;
    parameter  ADDR_CONFIG_RX_REG1_0                    =  32'h00000010;
    parameter  ADDR_TICK_REG_0                          =  32'h0000002C;
    parameter  ADDR_FEC_CONFIGURATION_REG1_0            =  32'h000000D0;
	parameter  ADDR_STAT_RX_STATUS_REG1_0               =  32'h00000744;
	parameter  ADDR_STAT_RX_RT_STATUS_REG1_0            =  32'h0000074C;	
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_LSB_0         =  32'h00000818;
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_MSB_0         =  32'h0000081C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_LSB_0    =  32'h00000820;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_MSB_0    =  32'h00000824;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_LSB_0           =  32'h00000828;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_MSB_0           =  32'h0000082C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_LSB_0      =  32'h00000830;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_MSB_0      =  32'h00000834;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_LSB_0         =  32'h00000E30;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_MSB_0         =  32'h00000E34;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_LSB_0    =  32'h00000E38;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_MSB_0    =  32'h00000E3C;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_LSB_0           =  32'h00000E40;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_MSB_0           =  32'h00000E44;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_LSB_0      =  32'h00000E48;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_MSB_0      =  32'h00000E4C;
    ///// For PORT-1
    parameter  ADDR_RESET_REG_1                         =  32'h00001004;
    parameter  ADDR_MODE_REG_1                          =  32'h00001008;
    parameter  ADDR_CONFIG_TX_REG1_1                    =  32'h0000100C;
    parameter  ADDR_CONFIG_RX_REG1_1                    =  32'h00001010;
    parameter  ADDR_TICK_REG_1                          =  32'h0000102C;
    parameter  ADDR_FEC_CONFIGURATION_REG1_1            =  32'h000010D0;
	parameter  ADDR_STAT_RX_STATUS_REG1_1               =  32'h00001744;
	parameter  ADDR_STAT_RX_RT_STATUS_REG1_1            =  32'h0000174C;	
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_LSB_1         =  32'h00001818;
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_MSB_1         =  32'h0000181C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_LSB_1    =  32'h00001820;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_MSB_1    =  32'h00001824;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_LSB_1           =  32'h00001828;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_MSB_1           =  32'h0000182C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_LSB_1      =  32'h00001830;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_MSB_1      =  32'h00001834;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_LSB_1         =  32'h00001E30;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_MSB_1         =  32'h00001E34;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_LSB_1    =  32'h00001E38;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_MSB_1    =  32'h00001E3C;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_LSB_1           =  32'h00001E40;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_MSB_1           =  32'h00001E44;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_LSB_1      =  32'h00001E48;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_MSB_1      =  32'h00001E4C;
    
    ///// For PORT-2
    parameter  ADDR_RESET_REG_2                         =  32'h00002004;
    parameter  ADDR_MODE_REG_2                          =  32'h00002008;
    parameter  ADDR_CONFIG_TX_REG1_2                    =  32'h0000200C;
    parameter  ADDR_CONFIG_RX_REG1_2                    =  32'h00002010;
    parameter  ADDR_TICK_REG_2                          =  32'h0000202C;
    parameter  ADDR_FEC_CONFIGURATION_REG1_2            =  32'h000020D0;
	parameter  ADDR_STAT_RX_STATUS_REG1_2               =  32'h00002744;
	parameter  ADDR_STAT_RX_RT_STATUS_REG1_2            =  32'h0000274C;	
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_LSB_2         =  32'h00002818;
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_MSB_2         =  32'h0000281C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_LSB_2    =  32'h00002820;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_MSB_2    =  32'h00002824;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_LSB_2           =  32'h00002828;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_MSB_2           =  32'h0000282C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_LSB_2      =  32'h00002830;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_MSB_2      =  32'h00002834;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_LSB_2         =  32'h00002E30;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_MSB_2         =  32'h00002E34;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_LSB_2    =  32'h00002E38;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_MSB_2    =  32'h00002E3C;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_LSB_2           =  32'h00002E40;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_MSB_2           =  32'h00002E44;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_LSB_2      =  32'h00002E48;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_MSB_2      =  32'h00002E4C;
    
    ///// For PORT-3
    parameter  ADDR_RESET_REG_3                         =  32'h00003004;
    parameter  ADDR_MODE_REG_3                          =  32'h00003008;
    parameter  ADDR_CONFIG_TX_REG1_3                    =  32'h0000300C;
    parameter  ADDR_CONFIG_RX_REG1_3                    =  32'h00003010;
    parameter  ADDR_TICK_REG_3                          =  32'h0000302C;
    parameter  ADDR_FEC_CONFIGURATION_REG1_3            =  32'h000030D0;
	parameter  ADDR_STAT_RX_STATUS_REG1_3               =  32'h00003744;
	parameter  ADDR_STAT_RX_RT_STATUS_REG1_3            =  32'h0000374C;	
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_LSB_3         =  32'h00003818;
    parameter  ADDR_STAT_TX_TOTAL_PACKETS_MSB_3         =  32'h0000381C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_LSB_3    =  32'h00003820;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_PACKETS_MSB_3    =  32'h00003824;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_LSB_3           =  32'h00003828;
    parameter  ADDR_STAT_TX_TOTAL_BYTES_MSB_3           =  32'h0000382C;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_LSB_3      =  32'h00003830;
    parameter  ADDR_STAT_TX_TOTAL_GOOD_BYTES_MSB_3      =  32'h00003834;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_LSB_3         =  32'h00003E30;
    parameter  ADDR_STAT_RX_TOTAL_PACKETS_MSB_3         =  32'h00003E34;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_LSB_3    =  32'h00003E38;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_PACKETS_MSB_3    =  32'h00003E3C;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_LSB_3           =  32'h00003E40;
    parameter  ADDR_STAT_RX_TOTAL_BYTES_MSB_3           =  32'h00003E44;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_LSB_3      =  32'h00003E48;
    parameter  ADDR_STAT_RX_TOTAL_GOOD_BYTES_MSB_3      =  32'h00003E4C;   



	reg  [31:0]     axi_read_data;


  reg pl_resetn; 
  reg pl_clk = 1'b0;
  initial forever #5000 pl_clk = ~pl_clk; // 100 MHz = 10ns period = 5000ps x2

  reg data_clk = 1'b0;
  initial forever #1351 data_clk = ~data_clk; // 370 MHz = 2.7 ns period = 1351ps x2



  wire [3:0]GT_Serial_gtx_n;
  wire [3:0]GT_Serial_gtx_p;
  wire [0:0]ref_clk_n_0;
  reg [0:0]ref_clk_p_0 = 1'b0;
  initial forever #3200 ref_clk_p_0 <= ~ref_clk_p_0; // 156.25 MHz = 6.4ns period = 3200ps x 2
  assign ref_clk_n_0 = ~ref_clk_p_0;


  /*input*/ wire [7:0]gt_line_rate = 8'd0;
  /*input*/ wire [2:0] gt_loopback = 3'd0;
  /*input*/ reg [3:0]gt_reset_all_in;
  /*input*/ reg [3:0]gt_reset_rx_datapath_in;
  /*input*/ reg [3:0]gt_reset_tx_datapath_in;
  /*input*/ wire gt_rxcdrhold = 1'd0;
  /*input*/ wire [6:0]gt_txmaincursor = 7'd0;
  /*input*/ wire [5:0]gt_txpostcursor = 6'd0;
  /*input*/ wire [5:0]gt_txprecursor = 6'd0;
  wire [3:0]gt_reset_done_o;



   wire s_axi_aclk = pl_clk;
   reg [31:0]s_axi_araddr = 32'd0;
   wire s_axi_aresetn = pl_resetn;
   wire s_axi_arready;
   reg s_axi_arvalid = 1'b0;
   reg [31:0]s_axi_awaddr = 32'b0;
   wire s_axi_awready;
   reg s_axi_awvalid = 1'b0;
   reg s_axi_bready = 1'b0;
   wire [1:0]s_axi_bresp;
   wire s_axi_bvalid;
   wire [31:0]s_axi_rdata;
   reg s_axi_rready = 1'b0;
   wire [1:0]s_axi_rresp;
   wire s_axi_rvalid;
   reg [31:0]s_axi_wdata = 32'b0;
   wire s_axi_wready;
   reg s_axi_wvalid = 1'b0;

  wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr = 8'd0;
  wire [2 : 0] s00_axi_awprot = 3'd0;
  wire  s00_axi_awvalid = 1'd0;
  wire  s00_axi_awready;
  wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata = 32'd0;
  wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb = 32'd0;
  wire  s00_axi_wvalid = 1'd0;
  wire  s00_axi_wready;
  wire [1 : 0] s00_axi_bresp;
  wire  s00_axi_bvalid;
  wire  s00_axi_bready = 1'd0;
  wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr = 8'd0;
  wire [2 : 0] s00_axi_arprot = 3'd0;
  wire  s00_axi_arvalid = 1'd0;
  wire  s00_axi_arready;
  wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata;
  wire [1 : 0] s00_axi_rresp;
  wire  s00_axi_rvalid;
  wire  s00_axi_rready = 1'd0;



  wire [255:0]rx_axis_tdata;
  wire [31:0]rx_axis_tkeep;
  wire rx_axis_tlast;
  wire rx_axis_tvalid;

  /*input*/ wire [255:0]tx_axis_tdata;
  /*input*/ wire [31:0]tx_axis_tkeep;
  /*input*/ wire tx_axis_tlast;
  /*output*/ wire tx_axis_tready;
  /*input*/ wire tx_axis_tvalid;


  
  reg packeter_resetn;
  packeter_top_rtl I_gen(
    .s00_axi_aclk(data_clk),
    .s00_axi_aresetn(packeter_resetn),

    .s00_axi_awaddr(s00_axi_awaddr),
    .s00_axi_awprot(s00_axi_awprot),
    .s00_axi_awvalid(s00_axi_awvalid),
    .s00_axi_awready(s00_axi_awready),
    .s00_axi_wdata(s00_axi_wdata),
    .s00_axi_wstrb(s00_axi_wstrb),
    .s00_axi_wvalid(s00_axi_wvalid),
    .s00_axi_wready(s00_axi_wready),
    .s00_axi_bresp(s00_axi_bresp),
    .s00_axi_bvalid(s00_axi_bvalid),
    .s00_axi_bready(s00_axi_bready),
    .s00_axi_araddr(s00_axi_araddr),
    .s00_axi_arprot(s00_axi_arprot),
    .s00_axi_arvalid(s00_axi_arvalid),
    .s00_axi_arready(s00_axi_arready),
    .s00_axi_rdata(s00_axi_rdata),
    .s00_axi_rresp(s00_axi_rresp),
    .s00_axi_rvalid(s00_axi_rvalid),
    .s00_axi_rready(s00_axi_rready),
		
		// RX to MRMAC
		.rx_axis_0_aclk(data_clk),
    .rx_axis_tdata_0(rx_axis_tdata),
    .rx_axis_tkeep_0(rx_axis_tkeep),
    .rx_axis_tlast_0(rx_axis_tlast),
    .rx_axis_tvalid_0(rx_axis_tvalid),
    .rx_axis_terror_0(1'b0),
        
    // RX to FIFO
    .rx_fifo_aclk(data_clk),
    .rx_fifo_tdata(),
    .rx_fifo_tkeep(),
    .rx_fifo_tready(1'd1),
    .rx_fifo_tvalid(),
    .rx_fifo_tlast(),
        
    // TX to MRMAC        
    .tx_axis_0_aclk(data_clk),
    .tx_axis_tdata_0(tx_axis_tdata),
    .tx_axis_tkeep_0(tx_axis_tkeep),
    .tx_axis_tlast_0(tx_axis_tlast),
    .tx_axis_tready_0(tx_axis_tready),
    .tx_axis_tvalid_0(tx_axis_tvalid),
        
    // TX to FIFO
    .tx_fifo_aclk(data_clk),
    .tx_fifo_tdata(256'h2398afe9832),
    .tx_fifo_tkeep(32'hFFFFFFFF),
    .tx_fifo_tvalid(1'd1),
    .tx_fifo_tready()
  );
  

    
    design_1_wrapper I_dut(
    
    .pl_resetn(pl_resetn),
    .rx_axis_0_aclk(data_clk),
    .tx_axis_0_aclk(data_clk),
    
    .GT_Serial_grx_n(GT_Serial_gtx_n),
    .GT_Serial_grx_p(GT_Serial_gtx_p),
    .GT_Serial_gtx_n(GT_Serial_gtx_n),
    .GT_Serial_gtx_p(GT_Serial_gtx_p),
    .ref_clk_n_0(ref_clk_n_0),
    .ref_clk_p_0(ref_clk_p_0),

    .gt_line_rate(gt_line_rate),
    .gt_loopback(gt_loopback),
    .gt_reset_all_in(gt_reset_all_in),
    .gt_reset_rx_datapath_in(gt_reset_rx_datapath_in),
    .gt_reset_tx_datapath_in(gt_reset_tx_datapath_in),
    .gt_rxcdrhold(gt_rxcdrhold),
    .gt_txmaincursor(gt_txmaincursor),
    .gt_txpostcursor(gt_txpostcursor),
    .gt_txprecursor(gt_txprecursor),
    .gt_reset_done_o(gt_reset_done_o),


    .s_axi_aclk(s_axi_aclk),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_aresetn(s_axi_aresetn),
    .s_axi_arready(s_axi_arready),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awready(s_axi_awready),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rready(s_axi_rready),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wready(s_axi_wready),
    .s_axi_wvalid(s_axi_wvalid),

    .rx_axis_tdata_0(rx_axis_tdata),
    .rx_axis_tkeep_0(rx_axis_tkeep),
    .rx_axis_tlast_0(rx_axis_tlast),
    .rx_axis_tvalid_0(rx_axis_tvalid),


    .tx_axis_tdata_0(tx_axis_tdata),
    .tx_axis_tkeep_0(tx_axis_tkeep),
    .tx_axis_tlast_0(tx_axis_tlast),
    .tx_axis_tready_0(tx_axis_tready),
    .tx_axis_tvalid_0(tx_axis_tvalid)
    );
    
    







    initial begin

        // 1) De-assert all resets & wait until startup done
        pl_resetn = 1'b1;
        packeter_resetn = 1'b1;
        
        repeat (20) @(posedge pl_clk);
        packeter_resetn = 1'b0;
        gt_reset_all_in[3:0] = 4'b0;
        gt_reset_rx_datapath_in[3:0] = 4'b0;
        gt_reset_tx_datapath_in[3:0] = 4'b0;
        
        wait (gt_reset_done_o[0] == 1'b1);
        
        $display("GT starting setup");
        
        repeat (800) @(posedge pl_clk);
        
        // 2) Assert all resets and wait until reset done
        pl_resetn = 1'b0;
		    gt_reset_all_in =4'hF;
		
        repeat (400) @(posedge pl_clk);
        
	      $display("Reset released to GT");
	    
        pl_resetn=1'b1;
        packeter_resetn = 1'b1;
        gt_reset_all_in =4'h0;
		
        $display("Waiting for reset done");
        
        @(posedge gt_reset_done_o[0]);
        $display("Reset done");

        repeat (400) @(posedge pl_clk);
    


        axi_read(ADDR_CORE_VERSION_REG, axi_read_data);  
        $display( " Core_Version  =  %0d",  axi_read_data); 
        
        $display("INFO : START MRMAC CONFIGURATION ..........");	
        axi_write(ADDR_RESET_REG_0, 32'h00000FFF);
        $display("INFO : SET CORE SPEED 1x100GE ..........");
		    axi_write(ADDR_MODE_REG_0, 32'h40000A74); //For GAUI-2	
 
        axi_write(ADDR_CONFIG_RX_REG1_0, 32'h00000033);   
		    axi_write(ADDR_CONFIG_TX_REG1_0, 32'h00000C03);

        axi_write(ADDR_FEC_CONFIGURATION_REG1_0, 32'h0000000A); 
        axi_write(ADDR_FEC_CONFIGURATION_REG1_1, 32'h00000000); 
        axi_write(ADDR_FEC_CONFIGURATION_REG1_2, 32'h00000000); 
        axi_write(ADDR_FEC_CONFIGURATION_REG1_3, 32'h00000000); 
	
        axi_write(ADDR_RESET_REG_0,32'h00000000);
        axi_write(ADDR_TICK_REG_0, 32'h00000001);
		
        $display("INFO : WAITING FOR RX ALIGNED ..........");				
        //////// Wait for Fixed Delay , But in actual Software need to poll for RX status bit
			  repeat (30000) @(posedge pl_clk);
        axi_write(ADDR_STAT_RX_STATUS_REG1_0, 32'hFFFFFFFF); 
        axi_read(ADDR_STAT_RX_STATUS_REG1_0, axi_read_data); 
        if (axi_read_data[0] ==  1'b0)
        begin
          $display("ERROR : RX ALIGN FAILED");
          $display("INFO  : Test FAILED");
          $finish;
        end		
          $display("INFO : RX ALIGNED ..........");
		



    end
















    task axi_write;
        input [31:0] awaddr;
        input [31:0] wdata; 
        begin
            // *** Write address ***
            s_axi_awaddr = awaddr;
			s_axi_wdata = wdata;
            s_axi_awvalid = 1;
			s_axi_wvalid = 1;
			@(posedge s_axi_wready); 
            #pclk_cycle;
			#pclk_cycle;
			s_axi_awvalid = 0;
            s_axi_wvalid = 0;
            s_axi_awaddr = 0;
			s_axi_wdata = 0;			
			@(posedge s_axi_bvalid);
            if (s_axi_bresp !=2'b00)
			begin
				$display("############ AXI4 write error ...");
		    end 
			#pclk_cycle;
            s_axi_bready = 1'b1;
			#pclk_cycle;
			s_axi_bready = 1'b0;
			#pclk_cycle;
        end
    endtask
    
    task axi_read;
        input [31:0] araddr;
		output [31:0] read_data;
        begin
            // *** Write address ***
            s_axi_araddr = araddr;
            s_axi_arvalid = 1;
			@(posedge s_axi_arready);
		    #pclk_cycle;
			#pclk_cycle;
            s_axi_arvalid = 0;
			
			@(posedge s_axi_rvalid);	
            if (s_axi_rresp !=2'b00)
			begin
				$display("############ AXI4 read error ...");
		    end			
            read_data =  s_axi_rdata; 	
			#pclk_cycle;
            s_axi_rready = 1'b1;
			#pclk_cycle;
			s_axi_rready = 1'b0;	
			#pclk_cycle;
        end
    endtask

endmodule
