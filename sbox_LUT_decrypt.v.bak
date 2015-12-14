module sbox_LUT_decrypt(
	input [7:0] byte_in,
	output reg [7:0] sbyte
	);

always @(byte_in) begin
case (byte_in)
//this seems inefficient but it's what we discussed doing in our meeting
8'h63: sbyte = 8'h00;
8'h7c: sbyte = 8'h01;
8'h77: sbyte = 8'h02;
8'h7b: sbyte = 8'h03;
8'hf2: sbyte = 8'h04;
8'h6b: sbyte = 8'h05;
8'h6f: sbyte = 8'h06;
8'hc5: sbyte = 8'h07;
8'h30: sbyte = 8'h08;
8'h01: sbyte = 8'h09;
8'h67: sbyte = 8'h0a;
8'h2b: sbyte = 8'h0b;
8'hfe: sbyte = 8'h0c;
8'hd7: sbyte = 8'h0d;
8'hab: sbyte = 8'h0e;
8'h76: sbyte = 8'h0f;

8'hca: sbyte = 8'h10;
8'h82: sbyte = 8'h11;
8'hc9: sbyte = 8'h12;
8'h7d: sbyte = 8'h13;
8'hfa: sbyte = 8'h14;
8'h59: sbyte = 8'h15;
8'h47: sbyte = 8'h16;
8'hf0: sbyte = 8'h17;
8'had: sbyte = 8'h18;
8'hd4: sbyte = 8'h19;
8'ha2: sbyte = 8'h1a;
8'haf: sbyte = 8'h1b;
8'h9c: sbyte = 8'h1c;
8'ha4: sbyte = 8'h1d;
8'h72: sbyte = 8'h1e;
8'hc0: sbyte = 8'h1f;

8'hb7:  sbyte = 8'h20;
8'hfd:  sbyte = 8'h21;
8'h93:  sbyte = 8'h22;
8'h26:  sbyte = 8'h23;
8'h36:  sbyte = 8'h24;
8'h3f:  sbyte = 8'h25;
8'hf7:  sbyte = 8'h26;
8'hcc:  sbyte = 8'h27;
8'h34:  sbyte = 8'h28;
8'ha5:  sbyte = 8'h29;
8'he5:  sbyte = 8'h2a;
8'hf1:  sbyte = 8'h2b;
8'h71:  sbyte = 8'h2c;
8'hd8:  sbyte = 8'h2d;
8'h31:  sbyte = 8'h2e;
8'h15:  sbyte = 8'h2f;

8'h04:  sbyte = 8'h30;
8'hc7:  sbyte = 8'h31;
8'h23:  sbyte = 8'h32;
8'hc3:  sbyte = 8'h33;
8'h18:  sbyte = 8'h34;
8'h96:  sbyte = 8'h35;
8'h05:  sbyte = 8'h36;
8'h9a:  sbyte = 8'h37;
8'h07:  sbyte = 8'h38;
8'h12:  sbyte = 8'h39;
8'h80:  sbyte = 8'h3a;
8'he2:  sbyte = 8'h3b;
8'heb:  sbyte = 8'h3c;
8'h27:  sbyte = 8'h3d;
8'hb2:  sbyte = 8'h3e;
8'h75:  sbyte = 8'h3f;

8'h09:  sbyte = 8'h40;
8'h83:  sbyte = 8'h41;
8'h2c:  sbyte = 8'h42;
8'h1a:  sbyte = 8'h43;
8'h1b:  sbyte = 8'h44;
8'h6e:  sbyte = 8'h45;
8'h5a:  sbyte = 8'h46;
8'ha0:  sbyte = 8'h47;
8'h52:  sbyte = 8'h48;
8'h3b:  sbyte = 8'h49;
8'hd6:  sbyte = 8'h4a;
8'hb3:  sbyte = 8'h4b;
8'h29:  sbyte = 8'h4c;
8'he3:  sbyte = 8'h4d;
8'h2f:  sbyte = 8'h4e;
8'h84:  sbyte = 8'h4f;

8'h53:  sbyte = 8'h50;
8'hd1:  sbyte = 8'h51;
8'h00:  sbyte = 8'h52;
8'hed:  sbyte = 8'h53;
8'h20:  sbyte = 8'h54;
8'hfc:  sbyte = 8'h55;
8'hb1:  sbyte = 8'h56;
8'h5b:  sbyte = 8'h57;
8'h6a:  sbyte = 8'h58;
8'hcb:  sbyte = 8'h59;
8'hbe:  sbyte = 8'h5a;
8'h39:  sbyte = 8'h5b;
8'h4a:  sbyte = 8'h5c;
8'h4c:  sbyte = 8'h5d;
8'h58:  sbyte = 8'h5e;
8'hcf:  sbyte = 8'h5f;

8'hd0:  sbyte = 8'h60
8'hef:  sbyte = 8'h61;
8'haa:  sbyte = 8'h62;
8'hfb:  sbyte = 8'h63;
8'h43:  sbyte = 8'h64;
8'h4d:  sbyte = 8'h65;
8'h33:  sbyte = 8'h66;
8'h85:  sbyte = 8'h67;
8'h45:  sbyte = 8'h68;
8'hf9:  sbyte = 8'h69;
8'h02:  sbyte = 8'h6a;
8'h7f:  sbyte = 8'h6b;
8'h50:  sbyte = 8'h6c;
8'h3c:  sbyte = 8'h6d;
8'h9f:  sbyte = 8'h6e;
8'ha8:  sbyte = 8'h6f;

8'h51:  sbyte = 8'h70;
8'ha3:  sbyte = 8'h71;
8'h40:  sbyte = 8'h72;
8'h8f:  sbyte = 8'h73;
8'h92:  sbyte = 8'h74;
8'h9d:  sbyte = 8'h75;
8'h38:  sbyte = 8'h76;
8'hf5:  sbyte = 8'h77;
8'hbc:  sbyte = 8'h78;
8'hb6:  sbyte = 8'h79;
8'hda:  sbyte = 8'h7a;
8'h21:  sbyte = 8'h7b;
8'h10:  sbyte = 8'h7c;
8'hff:  sbyte = 8'h7d;
8'hf3:  sbyte = 8'h7e;
8'hd2:  sbyte = 8'h7f;

8'hcd:  sbyte = 8'h80;
8'h0c:  sbyte = 8'h81;
8'h13:  sbyte = 8'h82;
8'hec:  sbyte = 8'h83;
8'h5f:  sbyte = 8'h84;
8'h97:  sbyte = 8'h85;
8'h44:  sbyte = 8'h86;
8'h17:  sbyte = 8'h87;
8'hc4:  sbyte = 8'h88;
8'ha7:  sbyte = 8'h89;
8'h7e:  sbyte = 8'h8a;
8'h3d:  sbyte = 8'h8b;
8'h64:  sbyte = 8'h8c;
8'h5d:  sbyte = 8'h8d;
8'h19:  sbyte = 8'h8e;
8'h73:  sbyte = 8'h8f;

8'h60:  sbyte = 8'h90;
8'h81:  sbyte = 8'h91;
8'h4f:  sbyte = 8'h92;
8'hdc:  sbyte = 8'h93;
8'h22:  sbyte = 8'h94;
8'h2a:  sbyte = 8'h95;
8'h90:  sbyte = 8'h96;
8'h88:  sbyte = 8'h97;
8'h46:  sbyte = 8'h98;
8'hee:  sbyte = 8'h99;
8'hb8:  sbyte = 8'h9a;
8'h14:  sbyte = 8'h9b;
8'hde:  sbyte = 8'h9c;
8'h5e:  sbyte = 8'h9d;
8'h0b:  sbyte = 8'h9e;
8'hdb:  sbyte = 8'h9f;

8'he0:  sbyte = 8'ha0;
8'h32:  sbyte = 8'ha1;
8'h3a:  sbyte = 8'ha2;
8'h0a:  sbyte = 8'ha3;
8'h49:  sbyte = 8'ha4;
8'h06:  sbyte = 8'ha5;
8'h24:  sbyte = 8'ha6;
8'h5c:  sbyte = 8'ha7;
8'hc2:  sbyte = 8'ha8;
8'hd3:  sbyte = 8'ha9;
8'hac:  sbyte = 8'haa;
8'h62:  sbyte = 8'hab;
8'h91:  sbyte = 8'hac;
8'h95:  sbyte = 8'had;
8'he4:  sbyte = 8'hae;
8'h79:  sbyte = 8'haf;

8'he7:  sbyte = 8'hb0;
8'hc8:  sbyte = 8'hb1;
8'h37:  sbyte = 8'hb2;
8'h6d:  sbyte = 8'hb3;
8'h8d:  sbyte = 8'hb4;
8'hd5:  sbyte = 8'hb5;
8'h4e:  sbyte = 8'hb6;
8'ha9:  sbyte = 8'hb7;
8'h6c:  sbyte = 8'hb8;
8'h56:  sbyte = 8'hb9;
8'hf4:  sbyte = 8'hba;
8'hea:  sbyte = 8'hbb;
8'h65:  sbyte = 8'hbc;
8'h7a:  sbyte = 8'hbd;
8'hae:  sbyte = 8'hbe;
8'h08:  sbyte = 8'hbf;

8'hba:  sbyte = 8'hc0;
8'h78:  sbyte = 8'hc1;
8'h25:  sbyte = 8'hc2;
8'h2e:  sbyte = 8'hc3;
8'h1c:  sbyte = 8'hc4;
8'ha6:  sbyte = 8'hc5;
8'hb4:  sbyte = 8'hc6;
8'hc6:  sbyte = 8'hc7;
8'he8:  sbyte = 8'hc8;
8'hdd:  sbyte = 8'hc9;
8'h74:  sbyte = 8'hca;
8'h1f:  sbyte = 8'hcb;
8'h4b:  sbyte = 8'hcc;
8'hbd:  sbyte = 8'hcd;
8'h8b:  sbyte = 8'hce;
8'h8a:  sbyte = 8'hcf;

8'h70:  sbyte = 8'hd0;
8'h3e:  sbyte = 8'hd1;
8'hb5:  sbyte = 8'hd2;
8'h66:  sbyte = 8'hd3;
8'h48:  sbyte = 8'hd4;
8'h03:  sbyte = 8'hd5;
8'hf6:  sbyte = 8'hd6;
8'h0e:  sbyte = 8'hd7;
8'h61:  sbyte = 8'hd8;
8'h35:  sbyte = 8'hd9;
8'h57:  sbyte = 8'hda;
8'hb9:  sbyte = 8'hdb;
8'h86:  sbyte = 8'hdc;
8'hc1:  sbyte = 8'hdd;
8'h1d:  sbyte = 8'hde;
8'h9e:  sbyte = 8'hdf;

8'he1:  sbyte = 8'he0;
8'hf8:  sbyte = 8'he1;
8'h98:  sbyte = 8'he2;
8'h11:  sbyte = 8'he3;
8'h69:  sbyte = 8'he4;
8'hd9:  sbyte = 8'he5;
8'h8e:  sbyte = 8'he6;
8'h94:  sbyte = 8'he7;
8'h9b:  sbyte = 8'he8;
8'h1e:  sbyte = 8'he9;
8'h87:  sbyte = 8'hea;
8'he9:  sbyte = 8'heb;
8'hce:  sbyte = 8'hec;
8'h55:  sbyte = 8'hed;
8'h28:  sbyte = 8'hee;
8'hdf:  sbyte = 8'hef;

8'h8c:  sbyte = 8'hf0;
8'ha1:  sbyte = 8'hf1;
8'h89:  sbyte = 8'hf2;
8'h0d:  sbyte = 8'hf3;
8'hbf:  sbyte = 8'hf4;
8'he6:  sbyte = 8'hf5;
8'h42:  sbyte = 8'hf6;
8'h68:  sbyte = 8'hf7;
8'h41:  sbyte = 8'hf8;
8'h99:  sbyte = 8'hf9;
8'h2d:  sbyte = 8'hfa;
8'h0f:  sbyte = 8'hfb;
8'hb0:  sbyte = 8'hfc
8'h54:  sbyte = 8'hfd;
8'hbb:  sbyte = 8'hfe;
8'h16:  sbyte = 8'hff;


endcase 
end

endmodule
