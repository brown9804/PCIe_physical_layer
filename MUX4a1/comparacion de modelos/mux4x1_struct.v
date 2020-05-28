/* Generated by Yosys 0.9 (git sha1 UNKNOWN, gcc 7.5.0-3ubuntu1~18.04 -fPIC -Os) */
`include "cmos_cells.v" 

(* src = "ff2in2o_struct.v:8" *)
module ff2in2o_struct(clk, reset, in0, in1, out0, out1);
  (* src = "ff2in2o_struct.v:19" *)
  wire [7:0] _00_;
  (* src = "ff2in2o_struct.v:19" *)
  wire [7:0] _01_;
  (* src = "ff2in2o_struct.v:9" *)
  input clk;
  (* src = "ff2in2o_struct.v:12" *)
  input [7:0] in0;
  (* src = "ff2in2o_struct.v:13" *)
  input [7:0] in1;
  (* src = "ff2in2o_struct.v:15" *)
  output [7:0] out0;
  (* src = "ff2in2o_struct.v:16" *)
  output [7:0] out1;
  (* src = "ff2in2o_struct.v:10" *)
  input reset;
  assign _00_[0] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[0] : 1'h0;
  assign _00_[1] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[1] : 1'h0;
  assign _00_[2] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[2] : 1'h0;
  assign _00_[3] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[3] : 1'h0;
  assign _00_[4] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[4] : 1'h0;
  assign _00_[5] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[5] : 1'h0;
  assign _00_[6] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[6] : 1'h0;
  assign _00_[7] = reset ? (* src = "ff2in2o_struct.v:23" *) in0[7] : 1'h0;
  assign _01_[0] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[0] : 1'h0;
  assign _01_[1] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[1] : 1'h0;
  assign _01_[2] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[2] : 1'h0;
  assign _01_[3] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[3] : 1'h0;
  assign _01_[4] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[4] : 1'h0;
  assign _01_[5] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[5] : 1'h0;
  assign _01_[6] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[6] : 1'h0;
  assign _01_[7] = reset ? (* src = "ff2in2o_struct.v:23" *) in1[7] : 1'h0;
  (* src = "ff2in2o_struct.v:19" *)
  DFF _18_ (
    .C(clk),
    .D(_00_[0]),
    .Q(out0[0])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _19_ (
    .C(clk),
    .D(_00_[1]),
    .Q(out0[1])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _20_ (
    .C(clk),
    .D(_00_[2]),
    .Q(out0[2])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _21_ (
    .C(clk),
    .D(_00_[3]),
    .Q(out0[3])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _22_ (
    .C(clk),
    .D(_00_[4]),
    .Q(out0[4])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _23_ (
    .C(clk),
    .D(_00_[5]),
    .Q(out0[5])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _24_ (
    .C(clk),
    .D(_00_[6]),
    .Q(out0[6])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _25_ (
    .C(clk),
    .D(_00_[7]),
    .Q(out0[7])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _26_ (
    .C(clk),
    .D(_01_[0]),
    .Q(out1[0])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _27_ (
    .C(clk),
    .D(_01_[1]),
    .Q(out1[1])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _28_ (
    .C(clk),
    .D(_01_[2]),
    .Q(out1[2])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _29_ (
    .C(clk),
    .D(_01_[3]),
    .Q(out1[3])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _30_ (
    .C(clk),
    .D(_01_[4]),
    .Q(out1[4])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _31_ (
    .C(clk),
    .D(_01_[5]),
    .Q(out1[5])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _32_ (
    .C(clk),
    .D(_01_[6]),
    .Q(out1[6])
  );
  (* src = "ff2in2o_struct.v:19" *)
  DFF _33_ (
    .C(clk),
    .D(_01_[7]),
    .Q(out1[7])
  );
endmodule

(* src = "ff4in4o_struct.v:8" *)
module ff4in4o_struct(clk, reset, in0, in1, in2, in3, out0, out1, out2, out3);
  (* src = "ff4in4o_struct.v:23" *)
  wire [7:0] _00_;
  (* src = "ff4in4o_struct.v:23" *)
  wire [7:0] _01_;
  (* src = "ff4in4o_struct.v:23" *)
  wire [7:0] _02_;
  (* src = "ff4in4o_struct.v:23" *)
  wire [7:0] _03_;
  (* src = "ff4in4o_struct.v:9" *)
  input clk;
  (* src = "ff4in4o_struct.v:12" *)
  input [7:0] in0;
  (* src = "ff4in4o_struct.v:13" *)
  input [7:0] in1;
  (* src = "ff4in4o_struct.v:14" *)
  input [7:0] in2;
  (* src = "ff4in4o_struct.v:15" *)
  input [7:0] in3;
  (* src = "ff4in4o_struct.v:17" *)
  output [7:0] out0;
  (* src = "ff4in4o_struct.v:18" *)
  output [7:0] out1;
  (* src = "ff4in4o_struct.v:19" *)
  output [7:0] out2;
  (* src = "ff4in4o_struct.v:20" *)
  output [7:0] out3;
  (* src = "ff4in4o_struct.v:10" *)
  input reset;
  assign _02_[0] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[0] : 1'h0;
  assign _02_[1] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[1] : 1'h0;
  assign _02_[2] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[2] : 1'h0;
  assign _02_[3] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[3] : 1'h0;
  assign _02_[4] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[4] : 1'h0;
  assign _02_[5] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[5] : 1'h0;
  assign _02_[6] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[6] : 1'h0;
  assign _02_[7] = reset ? (* src = "ff4in4o_struct.v:27" *) in2[7] : 1'h0;
  assign _03_[0] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[0] : 1'h0;
  assign _03_[1] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[1] : 1'h0;
  assign _03_[2] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[2] : 1'h0;
  assign _03_[3] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[3] : 1'h0;
  assign _03_[4] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[4] : 1'h0;
  assign _03_[5] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[5] : 1'h0;
  assign _03_[6] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[6] : 1'h0;
  assign _03_[7] = reset ? (* src = "ff4in4o_struct.v:27" *) in3[7] : 1'h0;
  assign _01_[0] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[0] : 1'h0;
  assign _01_[1] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[1] : 1'h0;
  assign _01_[2] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[2] : 1'h0;
  assign _01_[3] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[3] : 1'h0;
  assign _01_[4] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[4] : 1'h0;
  assign _01_[5] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[5] : 1'h0;
  assign _01_[6] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[6] : 1'h0;
  assign _01_[7] = reset ? (* src = "ff4in4o_struct.v:27" *) in1[7] : 1'h0;
  assign _00_[0] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[0] : 1'h0;
  assign _00_[1] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[1] : 1'h0;
  assign _00_[2] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[2] : 1'h0;
  assign _00_[3] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[3] : 1'h0;
  assign _00_[4] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[4] : 1'h0;
  assign _00_[5] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[5] : 1'h0;
  assign _00_[6] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[6] : 1'h0;
  assign _00_[7] = reset ? (* src = "ff4in4o_struct.v:27" *) in0[7] : 1'h0;
  (* src = "ff4in4o_struct.v:23" *)
  DFF _36_ (
    .C(clk),
    .D(_00_[0]),
    .Q(out0[0])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _37_ (
    .C(clk),
    .D(_00_[1]),
    .Q(out0[1])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _38_ (
    .C(clk),
    .D(_00_[2]),
    .Q(out0[2])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _39_ (
    .C(clk),
    .D(_00_[3]),
    .Q(out0[3])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _40_ (
    .C(clk),
    .D(_00_[4]),
    .Q(out0[4])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _41_ (
    .C(clk),
    .D(_00_[5]),
    .Q(out0[5])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _42_ (
    .C(clk),
    .D(_00_[6]),
    .Q(out0[6])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _43_ (
    .C(clk),
    .D(_00_[7]),
    .Q(out0[7])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _44_ (
    .C(clk),
    .D(_01_[0]),
    .Q(out1[0])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _45_ (
    .C(clk),
    .D(_01_[1]),
    .Q(out1[1])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _46_ (
    .C(clk),
    .D(_01_[2]),
    .Q(out1[2])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _47_ (
    .C(clk),
    .D(_01_[3]),
    .Q(out1[3])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _48_ (
    .C(clk),
    .D(_01_[4]),
    .Q(out1[4])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _49_ (
    .C(clk),
    .D(_01_[5]),
    .Q(out1[5])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _50_ (
    .C(clk),
    .D(_01_[6]),
    .Q(out1[6])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _51_ (
    .C(clk),
    .D(_01_[7]),
    .Q(out1[7])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _52_ (
    .C(clk),
    .D(_02_[0]),
    .Q(out2[0])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _53_ (
    .C(clk),
    .D(_02_[1]),
    .Q(out2[1])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _54_ (
    .C(clk),
    .D(_02_[2]),
    .Q(out2[2])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _55_ (
    .C(clk),
    .D(_02_[3]),
    .Q(out2[3])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _56_ (
    .C(clk),
    .D(_02_[4]),
    .Q(out2[4])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _57_ (
    .C(clk),
    .D(_02_[5]),
    .Q(out2[5])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _58_ (
    .C(clk),
    .D(_02_[6]),
    .Q(out2[6])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _59_ (
    .C(clk),
    .D(_02_[7]),
    .Q(out2[7])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _60_ (
    .C(clk),
    .D(_03_[0]),
    .Q(out3[0])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _61_ (
    .C(clk),
    .D(_03_[1]),
    .Q(out3[1])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _62_ (
    .C(clk),
    .D(_03_[2]),
    .Q(out3[2])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _63_ (
    .C(clk),
    .D(_03_[3]),
    .Q(out3[3])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _64_ (
    .C(clk),
    .D(_03_[4]),
    .Q(out3[4])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _65_ (
    .C(clk),
    .D(_03_[5]),
    .Q(out3[5])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _66_ (
    .C(clk),
    .D(_03_[6]),
    .Q(out3[6])
  );
  (* src = "ff4in4o_struct.v:23" *)
  DFF _67_ (
    .C(clk),
    .D(_03_[7]),
    .Q(out3[7])
  );
endmodule

(* src = "mux2x1_struct.v:21" *)
module mux2x1_struct(clk, in0, in1, valid, reset, out, validout);
  (* src = "mux2x1_struct.v:39" *)
  wire _0_;
  wire _1_;
  (* src = "mux2x1_struct.v:24" *)
  input clk;
  (* src = "mux2x1_struct.v:25" *)
  input [7:0] in0;
  (* src = "mux2x1_struct.v:26" *)
  input [7:0] in1;
  (* src = "mux2x1_struct.v:31" *)
  output [7:0] out;
  (* src = "mux2x1_struct.v:28" *)
  input reset;
  (* src = "mux2x1_struct.v:36" *)
  wire selector;
  (* src = "mux2x1_struct.v:27" *)
  input [1:0] valid;
  (* src = "mux2x1_struct.v:32" *)
  output validout;
  assign validout = selector ? (* src = "mux2x1_struct.v:52" *) valid[1] : valid[0];
  assign _0_ = reset ? (* src = "mux2x1_struct.v:40" *) _1_ : 1'h0;
  assign _1_ = ~(* src = "mux2x1_struct.v:51" *) selector;
  (* src = "mux2x1_struct.v:39" *)
  DFF _5_ (
    .C(clk),
    .D(_0_),
    .Q(selector)
  );
  assign out = 8'h00;
endmodule

(* top =  1  *)
(* src = "mux4x1_struct.v:26" *)
module mux4x1_struct(clk1f, clk2f, clk4f, reset, in0, in1, in2, in3, valid, out);
  (* unused_bits = "0 1 2 3 4 5 6" *)
  wire [6:0] _0_;
  (* unused_bits = "0 1 2 3 4 5 6" *)
  wire [6:0] _1_;
  (* unused_bits = "0 1 2 3 4 5 6" *)
  wire [6:0] _2_;
  (* src = "mux4x1_struct.v:29" *)
  input clk1f;
  (* src = "mux4x1_struct.v:30" *)
  input clk2f;
  (* src = "mux4x1_struct.v:31" *)
  input clk4f;
  (* src = "mux4x1_struct.v:33" *)
  input [7:0] in0;
  (* src = "mux4x1_struct.v:34" *)
  input [7:0] in1;
  (* src = "mux4x1_struct.v:35" *)
  input [7:0] in2;
  (* src = "mux4x1_struct.v:36" *)
  input [7:0] in3;
  (* src = "mux4x1_struct.v:43" *)
  wire [7:0] n0;
  (* src = "mux4x1_struct.v:43" *)
  wire [7:0] n1;
  (* src = "mux4x1_struct.v:43" *)
  wire [7:0] n2;
  (* src = "mux4x1_struct.v:43" *)
  wire [7:0] n3;
  (* src = "mux4x1_struct.v:44" *)
  wire [7:0] n4;
  (* src = "mux4x1_struct.v:44" *)
  wire [7:0] n5;
  (* src = "mux4x1_struct.v:44" *)
  wire [7:0] n6;
  (* src = "mux4x1_struct.v:44" *)
  wire [7:0] n7;
  (* src = "mux4x1_struct.v:39" *)
  output [7:0] out;
  (* src = "mux4x1_struct.v:32" *)
  input reset;
  (* src = "mux4x1_struct.v:47" *)
  wire [1:0] v;
  (* src = "mux4x1_struct.v:37" *)
  input [3:0] valid;
  (* src = "mux4x1_struct.v:50" *)
  wire [1:0] validout;
  (* src = "mux4x1_struct.v:48" *)
  wire vv;
  (* src = "mux4x1_struct.v:46" *)
  wire [7:0] w;
  (* src = "mux4x1_struct.v:45" *)
  wire [7:0] wout;
  (* src = "mux4x1_struct.v:49" *)
  (* unused_bits = "0" *)
  wire wv;
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x1_struct.v:80" *)
  ff2in2o_struct ff2 (
    .clk(clk2f),
    .in0(n4),
    .in1(n5),
    .out0(n6),
    .out1(n7),
    .reset(reset)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x1_struct.v:110" *)
  ff2in2o_struct ff22 (
    .clk(clk4f),
    .in0(w),
    .in1({ 7'h00, vv }),
    .out0(wout),
    .out1({ _0_, wv }),
    .reset(reset)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x1_struct.v:88" *)
  ff2in2o_struct ff2v (
    .clk(clk2f),
    .in0({ 7'h00, validout[0] }),
    .in1({ 7'h00, validout[1] }),
    .out0({ _2_, v[0] }),
    .out1({ _1_, v[1] }),
    .reset(reset)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x1_struct.v:53" *)
  ff4in4o_struct ff4 (
    .clk(clk1f),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out0(n0),
    .out1(n1),
    .out2(n2),
    .out3(n3),
    .reset(reset)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x1_struct.v:66" *)
  mux4x2_struct mux_A (
    .clk(clk2f),
    .in0(n0),
    .in1(n1),
    .in2(n2),
    .in3(n3),
    .out0(n4),
    .out1(n5),
    .reset(reset),
    .valid(valid),
    .validout(validout)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x1_struct.v:99" *)
  mux2x1_struct mux_B (
    .clk(clk4f),
    .in0(n6),
    .in1(n7),
    .out(w),
    .reset(reset),
    .valid(v),
    .validout(vv)
  );
  assign out = wout;
endmodule

(* src = "mux4x2_struct.v:23" *)
module mux4x2_struct(clk, in0, in1, in2, in3, valid, reset, out0, out1, validout);
  (* src = "mux4x2_struct.v:26" *)
  input clk;
  (* src = "mux4x2_struct.v:27" *)
  input [7:0] in0;
  (* src = "mux4x2_struct.v:28" *)
  input [7:0] in1;
  (* src = "mux4x2_struct.v:29" *)
  input [7:0] in2;
  (* src = "mux4x2_struct.v:30" *)
  input [7:0] in3;
  (* src = "mux4x2_struct.v:35" *)
  output [7:0] out0;
  (* src = "mux4x2_struct.v:36" *)
  output [7:0] out1;
  (* src = "mux4x2_struct.v:32" *)
  input reset;
  (* src = "mux4x2_struct.v:31" *)
  input [3:0] valid;
  (* src = "mux4x2_struct.v:37" *)
  output [1:0] validout;
  (* src = "mux4x2_struct.v:43" *)
  wire validoutA;
  (* src = "mux4x2_struct.v:43" *)
  wire validoutB;
  (* src = "mux4x2_struct.v:41" *)
  wire [7:0] wout0;
  (* src = "mux4x2_struct.v:42" *)
  wire [7:0] wout1;
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x2_struct.v:47" *)
  mux2x1_struct mux_A (
    .clk(clk),
    .in0(in0),
    .in1(in1),
    .out(wout0),
    .reset(reset),
    .valid(valid[1:0]),
    .validout(validoutA)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "mux4x2_struct.v:56" *)
  mux2x1_struct mux_B (
    .clk(clk),
    .in0(in2),
    .in1(in3),
    .out(wout1),
    .reset(reset),
    .valid(valid[3:2]),
    .validout(validoutB)
  );
  assign out0 = wout0;
  assign out1 = wout1;
  assign validout = { validoutB, validoutA };
endmodule
