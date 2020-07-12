module doub_red(a,b,cin,sum,cout);

input [15:0] a;
input [15:0] b;
input cin;

wire [31:0] d;
wire [31:0] c;
wire [31:0]e;
wire [31:0]f;
wire [31:0]g;
wire [31:0] s;


output [15:0]sum;
output cout;


assign c[0]=(a[0]&b[0])|(cin&b[0])|(cin&a[0]);
assign c[1]=(a[0]&b[0])|(cin&b[0])|(cin&a[0]);
assign c[2]=a[1]&b[1];
assign c[3]=a[1]|b[1];
assign c[4]=a[2]&b[2];
assign c[5]=a[2]|b[2];
assign c[6]=a[3]&b[3];
assign c[7]=a[3]|b[3];
assign c[8]=a[4]&b[4];
assign c[9]=a[4]|b[4];
assign c[10]=a[5]&b[5];
assign c[11]=a[5]|b[5];
assign c[12]=a[6]&b[6];
assign c[13]=a[6]|b[6];
assign c[14]=a[7]&b[7];
assign c[15]=a[7]|b[7];
assign c[16]=a[8]&b[8];
assign c[17]=a[8]|b[8];
assign c[18]=a[9]&b[9];
assign c[19]=a[9]|b[9];
assign c[20]=a[10]&b[10];
assign c[21]=a[10]|b[10];
assign c[22]=a[11]&b[11];
assign c[23]=a[11]|b[11];
assign c[24]=a[12]&b[12];
assign c[25]=a[12]|b[12];
assign c[26]=a[13]&b[13];
assign c[27]=a[13]|b[13];
assign c[28]=a[14]&b[14];
assign c[29]=a[14]|b[14];
assign c[30]=a[15]&b[15];
assign c[31]=a[15]|b[15];
//////////////////////////////
assign d[1:0]=c[1:0];

assign d[2]=c[2]|(c[3]&c[0]);
assign d[3]=c[2]|(c[3]&c[1]);
assign d[4]=c[4]|(c[5]&c[2]);
assign d[5]=c[4]|(c[5]&c[3]);
assign d[6]=c[6]|(c[7]&c[4]);
assign d[7]=c[6]|(c[7]&c[5]);
assign d[8]=c[8]|(c[9]&c[6]);
assign d[9]=c[8]|(c[9]&c[7]);
assign d[10]=c[10]|(c[11]&c[8]);
assign d[11]=c[10]|(c[11]&c[9]);
assign d[12]=c[12]|(c[13]&c[10]);
assign d[13]=c[12]|(c[13]&c[11]);
assign d[14]=c[14]|(c[15]&c[12]);
assign d[15]=c[14]|(c[15]&c[13]);
assign d[16]=c[16]|(c[17]&c[14]);
assign d[17]=c[16]|(c[17]&c[15]);
assign d[18]=c[18]|(c[19]&c[16]);
assign d[19]=c[18]|(c[19]&c[17]);
assign d[20]=c[20]|(c[21]&c[18]);
assign d[21]=c[20]|(c[21]&c[19]);
assign d[22]=c[22]|(c[23]&c[20]);
assign d[23]=c[22]|(c[23]&c[21]);
assign d[24]=c[24]|(c[25]&c[22]);
assign d[25]=c[24]|(c[25]&c[23]);
assign d[26]=c[26]|(c[27]&c[24]);
assign d[27]=c[26]|(c[27]&c[25]);
assign d[28]=c[28]|(c[29]&c[26]);
assign d[29]=c[28]|(c[29]&c[27]);
assign d[30]=c[30]|(c[31]&c[28]);
assign d[31]=c[30]|(c[31]&c[29]);
////////////////////////////////////////////////////////
assign e[1:0]=d[1:0];
assign e[3:2]=d[3:2];

assign e[4]=d[4]|(d[5]&d[0]);
assign e[5]=d[4]|(d[5]&d[1]);
assign e[6]=d[6]|(d[7]&d[2]);
assign e[7]=d[6]|(d[7]&d[3]);
assign e[8]=d[8]|(d[9]&d[4]);
assign e[9]=d[8]|(d[9]&d[5]);
assign e[10]=d[10]|(d[11]&d[6]);
assign e[11]=d[10]|(d[11]&d[7]);
assign e[12]=d[12]|(d[13]&d[8]);
assign e[13]=d[12]|(d[13]&d[9]);
assign e[14]=d[14]|(d[15]&d[10]);
assign e[15]=d[14]|(d[15]&d[11]);
assign e[16]=d[16]|(d[17]&d[12]);
assign e[17]=d[16]|(d[17]&d[13]);
assign e[18]=d[18]|(d[19]&d[14]);
assign e[19]=d[18]|(d[19]&d[15]);
assign e[20]=d[20]|(d[21]&d[16]);
assign e[21]=d[20]|(d[21]&d[17]);
assign e[22]=d[22]|(d[23]&d[18]);
assign e[23]=d[22]|(d[23]&d[19]);
assign e[24]=d[24]|(d[25]&d[20]);
assign e[25]=d[24]|(d[25]&d[21]);
assign e[26]=d[26]|(d[27]&d[22]);
assign e[27]=d[26]|(d[27]&d[23]);
assign e[28]=d[28]|(d[29]&d[24]);
assign e[29]=d[28]|(d[29]&d[25]);
assign e[30]=d[30]|(d[31]&d[26]);
assign e[31]=d[30]|(d[31]&d[27]);
/////////////////////////////////////////////////////////////////
assign f[1:0]=e[1:0];
assign f[3:2]=e[3:2];
assign f[5:4]=e[5:4];
assign f[7:6]=e[7:6];

assign f[8]=e[8]|(e[9]&e[0]);
assign f[9]=e[8]|(e[9]&e[1]);
assign f[10]=e[10]|(e[11]&e[2]);
assign f[11]=e[10]|(e[11]&e[3]);
assign f[12]=e[12]|(e[13]&e[4]);
assign f[13]=e[12]|(e[13]&e[5]);
assign f[14]=e[14]|(e[15]&e[6]);
assign f[15]=e[14]|(e[15]&e[7]);
assign f[16]=e[16]|(e[17]&e[8]);
assign f[17]=e[16]|(e[17]&e[9]);
assign f[18]=e[18]|(e[19]&e[10]);
assign f[19]=e[18]|(e[19]&e[11]);
assign f[20]=e[20]|(e[21]&e[12]);
assign f[21]=e[20]|(e[21]&e[13]);
assign f[22]=e[22]|(e[23]&e[14]);
assign f[23]=e[22]|(e[23]&e[15]);
assign f[24]=e[24]|(e[25]&e[16]);
assign f[25]=e[24]|(e[25]&e[17]);
assign f[26]=e[26]|(e[27]&e[18]);
assign f[27]=e[26]|(e[27]&e[19]);
assign f[28]=e[28]|(e[29]&e[20]);
assign f[29]=e[28]|(e[29]&e[21]);
assign f[30]=e[30]|(e[31]&e[22]);
assign f[31]=e[30]|(e[31]&e[23]);
////////////////////////////////////////////////////////
assign g[1:0]=f[1:0];
assign g[3:2]=f[3:2];
assign g[5:4]=f[5:4];
assign g[7:6]=f[7:6];
assign g[9:8]=f[9:8];
assign g[11:10]=f[11:10];
assign g[13:12]=f[13:12];
assign g[15:14]=f[15:14];

assign g[16]=f[16]|(f[17]&f[0]);
assign g[17]=f[16]|(f[17]&f[1]);
assign g[18]=f[18]|(f[19]&f[2]);
assign g[19]=f[18]|(f[19]&f[3]);
assign g[20]=f[20]|(f[21]&f[4]);
assign g[21]=f[20]|(f[21]&f[5]);
assign g[22]=f[22]|(f[23]&f[6]);
assign g[23]=f[22]|(f[23]&f[7]);
assign g[24]=f[24]|(f[25]&f[8]);
assign g[25]=f[24]|(f[25]&f[9]);
assign g[26]=f[26]|(f[27]&f[10]);
assign g[27]=f[26]|(f[27]&f[11]);
assign g[28]=f[28]|(f[29]&f[12]);
assign g[29]=f[28]|(f[29]&f[13]);
assign g[30]=f[30]|(f[31]&f[14]);
assign g[31]=f[30]|(f[31]&f[15]);
//////////////////////////////////////////

assign s[0]=g[0]&g[1];
assign s[1]=g[2]&g[3];
assign s[2]=g[4]&g[5];
assign s[3]=g[6]&g[7];
assign s[4]=g[8]&g[9];
assign s[5]=g[10]&g[11];
assign s[6]=g[12]&g[13];
assign s[7]=g[14]&g[15];
assign s[8]=g[16]&g[17];
assign s[9]=g[18]&g[19];
assign s[10]=g[20]&g[21];
assign s[11]=g[22]&g[23];
assign s[12]=g[24]&g[25];
assign s[13]=g[26]&g[27];
assign s[14]=g[28]&g[29];
assign s[15]=g[30]&g[31];




////////////////////////////////////////////////

assign sum[0]=a[0]^b[0]^cin;
assign sum[1]=a[1]^b[1]^s[0];
assign sum[2]=a[2]^b[2]^s[1];
assign sum[3]=a[3]^b[3]^s[2];
assign sum[4]=a[4]^b[4]^s[3];
assign sum[5]=a[5]^b[5]^s[4];
assign sum[6]=a[6]^b[6]^s[5];
assign sum[7]=a[7]^b[7]^s[6];
assign sum[8]=a[8]^b[8]^s[7];
assign sum[9]=a[9]^b[9]^s[8];
assign sum[10]=a[10]^b[10]^s[9];
assign sum[11]=a[11]^b[11]^s[10];
assign sum[12]=a[12]^b[12]^s[11];
assign sum[13]=a[13]^b[13]^s[12];
assign sum[14]=a[14]^b[14]^s[13];
assign sum[15]=a[15]^b[15]^s[14];
assign cout=s[15];



endmodule
