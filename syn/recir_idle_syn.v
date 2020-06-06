/* Generated by Yosys 0.9 (git sha1 UNKNOWN, gcc 7.5.0-3ubuntu1~18.04 -fPIC -Os) */

(* top =  1  *)
(* src = "./src/recir_idle_syn.v:6" *)
module recir_idle_syn(clk1f, clk2f, clk4f, reset, valido, in0, in1, in2, in3, valid_in, out0m, out1m, out2m, out3m, valid_outm, out0t, out1t, out2t, out3t, valid_outt);
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _000_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _001_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _002_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _003_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _004_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _005_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _006_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [7:0] _007_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [3:0] _008_;
  (* src = "./src/recir_idle_syn.v:42" *)
  wire [3:0] _009_;
  (* src = "./src/recir_idle_syn.v:8" *)
  input clk1f;
  (* src = "./src/recir_idle_syn.v:9" *)
  input clk2f;
  (* src = "./src/recir_idle_syn.v:10" *)
  input clk4f;
  (* src = "./src/recir_idle_syn.v:15" *)
  input [7:0] in0;
  (* src = "./src/recir_idle_syn.v:16" *)
  input [7:0] in1;
  (* src = "./src/recir_idle_syn.v:17" *)
  input [7:0] in2;
  (* src = "./src/recir_idle_syn.v:18" *)
  input [7:0] in3;
  (* src = "./src/recir_idle_syn.v:21" *)
  output [7:0] out0m;
  (* src = "./src/recir_idle_syn.v:27" *)
  output [7:0] out0t;
  (* src = "./src/recir_idle_syn.v:22" *)
  output [7:0] out1m;
  (* src = "./src/recir_idle_syn.v:28" *)
  output [7:0] out1t;
  (* src = "./src/recir_idle_syn.v:23" *)
  output [7:0] out2m;
  (* src = "./src/recir_idle_syn.v:29" *)
  output [7:0] out2t;
  (* src = "./src/recir_idle_syn.v:24" *)
  output [7:0] out3m;
  (* src = "./src/recir_idle_syn.v:30" *)
  output [7:0] out3t;
  (* src = "./src/recir_idle_syn.v:38" *)
  wire [7:0] outm0;
  (* src = "./src/recir_idle_syn.v:38" *)
  wire [7:0] outm1;
  (* src = "./src/recir_idle_syn.v:38" *)
  wire [7:0] outm2;
  (* src = "./src/recir_idle_syn.v:38" *)
  wire [7:0] outm3;
  (* src = "./src/recir_idle_syn.v:39" *)
  wire [7:0] outt0;
  (* src = "./src/recir_idle_syn.v:39" *)
  wire [7:0] outt1;
  (* src = "./src/recir_idle_syn.v:39" *)
  wire [7:0] outt2;
  (* src = "./src/recir_idle_syn.v:39" *)
  wire [7:0] outt3;
  (* src = "./src/recir_idle_syn.v:11" *)
  input reset;
  (* src = "./src/recir_idle_syn.v:19" *)
  input [3:0] valid_in;
  (* src = "./src/recir_idle_syn.v:25" *)
  output [3:0] valid_outm;
  (* src = "./src/recir_idle_syn.v:31" *)
  output [3:0] valid_outt;
  (* src = "./src/recir_idle_syn.v:13" *)
  input valido;
  (* src = "./src/recir_idle_syn.v:40" *)
  wire [3:0] validoutm;
  (* src = "./src/recir_idle_syn.v:40" *)
  wire [3:0] validoutt;
  assign _009_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : valid_in[3];
  assign _008_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) valid_in[0] : 1'h0;
  assign _008_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) valid_in[1] : 1'h0;
  assign _008_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) valid_in[2] : 1'h0;
  assign _008_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) valid_in[3] : 1'h0;
  assign _007_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[0];
  assign _007_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[1];
  assign _007_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[2];
  assign _007_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[3];
  assign _007_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[4];
  assign _007_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[5];
  assign _007_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[6];
  assign _007_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in3[7];
  assign _004_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[0];
  assign _004_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[1];
  assign _004_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[2];
  assign _004_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[3];
  assign _004_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[4];
  assign _004_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[5];
  assign _004_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[6];
  assign _004_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in0[7];
  assign _006_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[0];
  assign _006_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[1];
  assign _006_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[2];
  assign _006_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[3];
  assign _006_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[4];
  assign _006_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[5];
  assign _006_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[6];
  assign _006_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in2[7];
  assign _005_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[0];
  assign _005_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[1];
  assign _005_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[2];
  assign _005_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[3];
  assign _005_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[4];
  assign _005_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[5];
  assign _005_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[6];
  assign _005_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : in1[7];
  assign _001_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[0] : 1'h0;
  assign _001_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[1] : 1'h0;
  assign _001_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[2] : 1'h0;
  assign _001_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[3] : 1'h0;
  assign _001_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[4] : 1'h0;
  assign _001_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[5] : 1'h0;
  assign _001_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[6] : 1'h0;
  assign _001_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in1[7] : 1'h0;
  assign _003_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[0] : 1'h0;
  assign _003_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[1] : 1'h0;
  assign _003_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[2] : 1'h0;
  assign _003_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[3] : 1'h0;
  assign _003_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[4] : 1'h0;
  assign _003_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[5] : 1'h0;
  assign _003_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[6] : 1'h0;
  assign _003_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in3[7] : 1'h0;
  assign _002_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[0] : 1'h0;
  assign _002_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[1] : 1'h0;
  assign _002_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[2] : 1'h0;
  assign _002_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[3] : 1'h0;
  assign _002_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[4] : 1'h0;
  assign _002_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[5] : 1'h0;
  assign _002_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[6] : 1'h0;
  assign _002_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in2[7] : 1'h0;
  assign _000_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[0] : 1'h0;
  assign _000_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[1] : 1'h0;
  assign _000_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[2] : 1'h0;
  assign _000_[3] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[3] : 1'h0;
  assign _000_[4] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[4] : 1'h0;
  assign _000_[5] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[5] : 1'h0;
  assign _000_[6] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[6] : 1'h0;
  assign _000_[7] = valido ? (* src = "./src/recir_idle_syn.v:43" *) in0[7] : 1'h0;
  assign _009_[0] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : valid_in[0];
  assign _009_[1] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : valid_in[1];
  assign _009_[2] = valido ? (* src = "./src/recir_idle_syn.v:43" *) 1'h0 : valid_in[2];
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _082_ (
    .C(clk1f),
    .D(outm0[0]),
    .Q(out0m[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _083_ (
    .C(clk1f),
    .D(outm0[1]),
    .Q(out0m[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _084_ (
    .C(clk1f),
    .D(outm0[2]),
    .Q(out0m[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _085_ (
    .C(clk1f),
    .D(outm0[3]),
    .Q(out0m[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _086_ (
    .C(clk1f),
    .D(outm0[4]),
    .Q(out0m[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _087_ (
    .C(clk1f),
    .D(outm0[5]),
    .Q(out0m[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _088_ (
    .C(clk1f),
    .D(outm0[6]),
    .Q(out0m[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _089_ (
    .C(clk1f),
    .D(outm0[7]),
    .Q(out0m[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _090_ (
    .C(clk1f),
    .D(outt2[0]),
    .Q(out2t[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _091_ (
    .C(clk1f),
    .D(outt2[1]),
    .Q(out2t[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _092_ (
    .C(clk1f),
    .D(outt2[2]),
    .Q(out2t[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _093_ (
    .C(clk1f),
    .D(outt2[3]),
    .Q(out2t[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _094_ (
    .C(clk1f),
    .D(outt2[4]),
    .Q(out2t[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _095_ (
    .C(clk1f),
    .D(outt2[5]),
    .Q(out2t[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _096_ (
    .C(clk1f),
    .D(outt2[6]),
    .Q(out2t[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _097_ (
    .C(clk1f),
    .D(outt2[7]),
    .Q(out2t[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _098_ (
    .C(clk1f),
    .D(outm1[0]),
    .Q(out1m[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _099_ (
    .C(clk1f),
    .D(outm1[1]),
    .Q(out1m[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _100_ (
    .C(clk1f),
    .D(outm1[2]),
    .Q(out1m[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _101_ (
    .C(clk1f),
    .D(outm1[3]),
    .Q(out1m[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _102_ (
    .C(clk1f),
    .D(outm1[4]),
    .Q(out1m[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _103_ (
    .C(clk1f),
    .D(outm1[5]),
    .Q(out1m[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _104_ (
    .C(clk1f),
    .D(outm1[6]),
    .Q(out1m[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _105_ (
    .C(clk1f),
    .D(outm1[7]),
    .Q(out1m[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _106_ (
    .C(clk1f),
    .D(outm2[0]),
    .Q(out2m[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _107_ (
    .C(clk1f),
    .D(outm2[1]),
    .Q(out2m[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _108_ (
    .C(clk1f),
    .D(outm2[2]),
    .Q(out2m[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _109_ (
    .C(clk1f),
    .D(outm2[3]),
    .Q(out2m[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _110_ (
    .C(clk1f),
    .D(outm2[4]),
    .Q(out2m[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _111_ (
    .C(clk1f),
    .D(outm2[5]),
    .Q(out2m[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _112_ (
    .C(clk1f),
    .D(outm2[6]),
    .Q(out2m[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _113_ (
    .C(clk1f),
    .D(outm2[7]),
    .Q(out2m[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _114_ (
    .C(clk1f),
    .D(outm3[0]),
    .Q(out3m[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _115_ (
    .C(clk1f),
    .D(outm3[1]),
    .Q(out3m[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _116_ (
    .C(clk1f),
    .D(outm3[2]),
    .Q(out3m[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _117_ (
    .C(clk1f),
    .D(outm3[3]),
    .Q(out3m[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _118_ (
    .C(clk1f),
    .D(outm3[4]),
    .Q(out3m[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _119_ (
    .C(clk1f),
    .D(outm3[5]),
    .Q(out3m[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _120_ (
    .C(clk1f),
    .D(outm3[6]),
    .Q(out3m[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _121_ (
    .C(clk1f),
    .D(outm3[7]),
    .Q(out3m[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _122_ (
    .C(clk1f),
    .D(validoutm[0]),
    .Q(valid_outm[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _123_ (
    .C(clk1f),
    .D(validoutm[1]),
    .Q(valid_outm[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _124_ (
    .C(clk1f),
    .D(validoutm[2]),
    .Q(valid_outm[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _125_ (
    .C(clk1f),
    .D(validoutm[3]),
    .Q(valid_outm[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _126_ (
    .C(clk1f),
    .D(outt0[0]),
    .Q(out0t[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _127_ (
    .C(clk1f),
    .D(outt0[1]),
    .Q(out0t[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _128_ (
    .C(clk1f),
    .D(outt0[2]),
    .Q(out0t[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _129_ (
    .C(clk1f),
    .D(outt0[3]),
    .Q(out0t[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _130_ (
    .C(clk1f),
    .D(outt0[4]),
    .Q(out0t[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _131_ (
    .C(clk1f),
    .D(outt0[5]),
    .Q(out0t[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _132_ (
    .C(clk1f),
    .D(outt0[6]),
    .Q(out0t[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _133_ (
    .C(clk1f),
    .D(outt0[7]),
    .Q(out0t[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _134_ (
    .C(clk1f),
    .D(outt1[0]),
    .Q(out1t[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _135_ (
    .C(clk1f),
    .D(outt1[1]),
    .Q(out1t[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _136_ (
    .C(clk1f),
    .D(outt1[2]),
    .Q(out1t[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _137_ (
    .C(clk1f),
    .D(outt1[3]),
    .Q(out1t[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _138_ (
    .C(clk1f),
    .D(outt1[4]),
    .Q(out1t[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _139_ (
    .C(clk1f),
    .D(outt1[5]),
    .Q(out1t[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _140_ (
    .C(clk1f),
    .D(outt1[6]),
    .Q(out1t[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _141_ (
    .C(clk1f),
    .D(outt1[7]),
    .Q(out1t[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _142_ (
    .C(clk1f),
    .D(outt3[0]),
    .Q(out3t[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _143_ (
    .C(clk1f),
    .D(outt3[1]),
    .Q(out3t[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _144_ (
    .C(clk1f),
    .D(outt3[2]),
    .Q(out3t[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _145_ (
    .C(clk1f),
    .D(outt3[3]),
    .Q(out3t[3])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _146_ (
    .C(clk1f),
    .D(outt3[4]),
    .Q(out3t[4])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _147_ (
    .C(clk1f),
    .D(outt3[5]),
    .Q(out3t[5])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _148_ (
    .C(clk1f),
    .D(outt3[6]),
    .Q(out3t[6])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _149_ (
    .C(clk1f),
    .D(outt3[7]),
    .Q(out3t[7])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _150_ (
    .C(clk1f),
    .D(validoutt[0]),
    .Q(valid_outt[0])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _151_ (
    .C(clk1f),
    .D(validoutt[1]),
    .Q(valid_outt[1])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _152_ (
    .C(clk1f),
    .D(validoutt[2]),
    .Q(valid_outt[2])
  );
  (* src = "./src/recir_idle_syn.v:71" *)
  DFF _153_ (
    .C(clk1f),
    .D(validoutt[3]),
    .Q(valid_outt[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _154_ (
    .C(clk4f),
    .D(_000_[0]),
    .Q(outm0[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _155_ (
    .C(clk4f),
    .D(_000_[1]),
    .Q(outm0[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _156_ (
    .C(clk4f),
    .D(_000_[2]),
    .Q(outm0[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _157_ (
    .C(clk4f),
    .D(_000_[3]),
    .Q(outm0[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _158_ (
    .C(clk4f),
    .D(_000_[4]),
    .Q(outm0[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _159_ (
    .C(clk4f),
    .D(_000_[5]),
    .Q(outm0[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _160_ (
    .C(clk4f),
    .D(_000_[6]),
    .Q(outm0[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _161_ (
    .C(clk4f),
    .D(_000_[7]),
    .Q(outm0[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _162_ (
    .C(clk4f),
    .D(_001_[0]),
    .Q(outm1[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _163_ (
    .C(clk4f),
    .D(_001_[1]),
    .Q(outm1[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _164_ (
    .C(clk4f),
    .D(_001_[2]),
    .Q(outm1[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _165_ (
    .C(clk4f),
    .D(_001_[3]),
    .Q(outm1[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _166_ (
    .C(clk4f),
    .D(_001_[4]),
    .Q(outm1[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _167_ (
    .C(clk4f),
    .D(_001_[5]),
    .Q(outm1[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _168_ (
    .C(clk4f),
    .D(_001_[6]),
    .Q(outm1[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _169_ (
    .C(clk4f),
    .D(_001_[7]),
    .Q(outm1[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _170_ (
    .C(clk4f),
    .D(_002_[0]),
    .Q(outm2[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _171_ (
    .C(clk4f),
    .D(_002_[1]),
    .Q(outm2[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _172_ (
    .C(clk4f),
    .D(_002_[2]),
    .Q(outm2[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _173_ (
    .C(clk4f),
    .D(_002_[3]),
    .Q(outm2[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _174_ (
    .C(clk4f),
    .D(_002_[4]),
    .Q(outm2[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _175_ (
    .C(clk4f),
    .D(_002_[5]),
    .Q(outm2[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _176_ (
    .C(clk4f),
    .D(_002_[6]),
    .Q(outm2[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _177_ (
    .C(clk4f),
    .D(_002_[7]),
    .Q(outm2[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _178_ (
    .C(clk4f),
    .D(_003_[0]),
    .Q(outm3[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _179_ (
    .C(clk4f),
    .D(_003_[1]),
    .Q(outm3[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _180_ (
    .C(clk4f),
    .D(_003_[2]),
    .Q(outm3[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _181_ (
    .C(clk4f),
    .D(_003_[3]),
    .Q(outm3[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _182_ (
    .C(clk4f),
    .D(_003_[4]),
    .Q(outm3[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _183_ (
    .C(clk4f),
    .D(_003_[5]),
    .Q(outm3[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _184_ (
    .C(clk4f),
    .D(_003_[6]),
    .Q(outm3[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _185_ (
    .C(clk4f),
    .D(_003_[7]),
    .Q(outm3[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _186_ (
    .C(clk4f),
    .D(_004_[0]),
    .Q(outt0[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _187_ (
    .C(clk4f),
    .D(_004_[1]),
    .Q(outt0[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _188_ (
    .C(clk4f),
    .D(_004_[2]),
    .Q(outt0[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _189_ (
    .C(clk4f),
    .D(_004_[3]),
    .Q(outt0[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _190_ (
    .C(clk4f),
    .D(_004_[4]),
    .Q(outt0[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _191_ (
    .C(clk4f),
    .D(_004_[5]),
    .Q(outt0[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _192_ (
    .C(clk4f),
    .D(_004_[6]),
    .Q(outt0[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _193_ (
    .C(clk4f),
    .D(_004_[7]),
    .Q(outt0[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _194_ (
    .C(clk4f),
    .D(_005_[0]),
    .Q(outt1[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _195_ (
    .C(clk4f),
    .D(_005_[1]),
    .Q(outt1[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _196_ (
    .C(clk4f),
    .D(_005_[2]),
    .Q(outt1[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _197_ (
    .C(clk4f),
    .D(_005_[3]),
    .Q(outt1[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _198_ (
    .C(clk4f),
    .D(_005_[4]),
    .Q(outt1[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _199_ (
    .C(clk4f),
    .D(_005_[5]),
    .Q(outt1[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _200_ (
    .C(clk4f),
    .D(_005_[6]),
    .Q(outt1[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _201_ (
    .C(clk4f),
    .D(_005_[7]),
    .Q(outt1[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _202_ (
    .C(clk4f),
    .D(_006_[0]),
    .Q(outt2[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _203_ (
    .C(clk4f),
    .D(_006_[1]),
    .Q(outt2[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _204_ (
    .C(clk4f),
    .D(_006_[2]),
    .Q(outt2[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _205_ (
    .C(clk4f),
    .D(_006_[3]),
    .Q(outt2[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _206_ (
    .C(clk4f),
    .D(_006_[4]),
    .Q(outt2[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _207_ (
    .C(clk4f),
    .D(_006_[5]),
    .Q(outt2[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _208_ (
    .C(clk4f),
    .D(_006_[6]),
    .Q(outt2[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _209_ (
    .C(clk4f),
    .D(_006_[7]),
    .Q(outt2[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _210_ (
    .C(clk4f),
    .D(_007_[0]),
    .Q(outt3[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _211_ (
    .C(clk4f),
    .D(_007_[1]),
    .Q(outt3[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _212_ (
    .C(clk4f),
    .D(_007_[2]),
    .Q(outt3[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _213_ (
    .C(clk4f),
    .D(_007_[3]),
    .Q(outt3[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _214_ (
    .C(clk4f),
    .D(_007_[4]),
    .Q(outt3[4])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _215_ (
    .C(clk4f),
    .D(_007_[5]),
    .Q(outt3[5])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _216_ (
    .C(clk4f),
    .D(_007_[6]),
    .Q(outt3[6])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _217_ (
    .C(clk4f),
    .D(_007_[7]),
    .Q(outt3[7])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _218_ (
    .C(clk4f),
    .D(_008_[0]),
    .Q(validoutm[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _219_ (
    .C(clk4f),
    .D(_008_[1]),
    .Q(validoutm[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _220_ (
    .C(clk4f),
    .D(_008_[2]),
    .Q(validoutm[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _221_ (
    .C(clk4f),
    .D(_008_[3]),
    .Q(validoutm[3])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _222_ (
    .C(clk4f),
    .D(_009_[0]),
    .Q(validoutt[0])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _223_ (
    .C(clk4f),
    .D(_009_[1]),
    .Q(validoutt[1])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _224_ (
    .C(clk4f),
    .D(_009_[2]),
    .Q(validoutt[2])
  );
  (* src = "./src/recir_idle_syn.v:42" *)
  DFF _225_ (
    .C(clk4f),
    .D(_009_[3]),
    .Q(validoutt[3])
  );
endmodule