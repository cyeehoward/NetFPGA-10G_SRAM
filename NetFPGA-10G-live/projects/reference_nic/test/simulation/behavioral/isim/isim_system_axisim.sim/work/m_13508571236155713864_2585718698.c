/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/root/NetFPGA-10G-live/projects/reference_nic/test/nf10/task_nf10g_stim_packet_dump.v";
static int ng1[] = {0, 0};
static const char *ng2 = "Start %s data dump at [%t].\n";
static const char *ng3 = "r";
static int ng4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static const char *ng5 = "%h, %h, %h";
static int ng6[] = {3, 0};
static int ng7[] = {1, 0};
static const char *ng8 = "%s data at [%t]:\n";
static const char *ng9 = "ADDR : %d, %d \n";
static const char *ng10 = "TDATA : %h \n";
static const char *ng11 = "TUSER : %h \n";
static unsigned int ng12[] = {0U, 0U};
static const char *ng13 = "/root/NetFPGA-10G-live/projects/reference_nic/test/simulation/behavioral/system_axisim_tb.v";
static unsigned int ng14[] = {1U, 0U};
static const char *ng15 = "[%t] : System Reset Asserted...";
static int ng16[] = {50, 0};
static const char *ng17 = "[%t] : System Reset De-asserted...";
static const char *ng18 = "/root/NetFPGA-10G-live/projects/reference_nic/test/nf10/wire_tb.v";
static const char *ng19 = "/root/NetFPGA-10G-live/projects/reference_nic/test/nf10/dma_rx_checker.v";
static int ng20[] = {0, 0, 0, 0, 0, 0, 0, 0};
static unsigned int ng21[] = {4U, 0U};
static unsigned int ng22[] = {16U, 0U};
static unsigned int ng23[] = {64U, 0U};
static const char *ng24 = "FAIL : DMA Rx data differ NF0 data at [%t]!\n";
static const char *ng25 = "%d th Rx Packet, %d th Packet length:\n";
static const char *ng26 = "NF0 : %h\n";
static const char *ng27 = "DMA : %h\n\n";
static const char *ng28 = "PASS : DMA Rx data differ NF0 data at [%t]!\n";
static const char *ng29 = "FAIL : DMA Rx data differ NF1 data at [%t]!\n";
static const char *ng30 = "NF1 : %h\n";
static const char *ng31 = "PASS : DMA Rx data differ NF1 data at [%t]!\n";
static const char *ng32 = "FAIL : DMA Rx data differ NF2 data at [%t]!\n";
static const char *ng33 = "NF2 : %h\n";
static const char *ng34 = "PASS : DMA Rx data differ NF2 data at [%t]!\n";
static const char *ng35 = "FAIL : DMA Rx data differ NF3 data at [%t]!\n";
static const char *ng36 = "NF3 : %h\n";
static const char *ng37 = "PASS : DMA Rx data differ NF3 data at [%t]!\n";
static int ng38[] = {778139753, 0, 1937009005, 0, 1700737119, 0, 1919312227, 0, 1768846437, 0, 825255775, 0, 1714499679, 0, 774778734, 0, 3026479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static int ng39[] = {778139753, 0, 1937009005, 0, 1700737375, 0, 1919312227, 0, 1768846437, 0, 825255775, 0, 1714499679, 0, 774778734, 0, 3026479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static int ng40[] = {778139753, 0, 1937009005, 0, 1700737631, 0, 1919312227, 0, 1768846437, 0, 825255775, 0, 1714499679, 0, 774778734, 0, 3026479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static int ng41[] = {778139753, 0, 1937009005, 0, 1700737887, 0, 1919312227, 0, 1768846437, 0, 825255775, 0, 1714499679, 0, 774778734, 0, 3026479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};



static int sp_nf10g_0_stim_packet_dump(char *t1, char *t2)
{
    char t8[8];
    char t13[128];
    char t20[64];
    char t27[32];
    char t31[8];
    char t43[8];
    char t61[8];
    char t62[8];
    char t63[8];
    char t93[8];
    char t101[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    double t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    char *t100;
    char *t102;
    int t103;
    int t104;
    int t105;
    int t106;
    int t107;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 848);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t1 + 17256);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 12);
    xsi_set_current_line(56, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 17416);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(58, ng0);
    t4 = (t1 + 15976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng2, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(60, ng0);
    t4 = (t1 + 15976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t8) = xsi_vlogfile_file_open_of_valname_ctype(t6, 512, ng3);
    t9 = (t8 + 4);
    *((int *)t9) = 0;
    t10 = (t1 + 16296);
    xsi_vlogvar_assign_value(t10, t8, 0, 0, 32);
    xsi_set_current_line(62, ng0);
    t4 = (t1 + 16616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 16296);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    xsi_set_current_line(64, ng0);

LAB6:    t4 = (t1 + 16616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng4)));
    xsi_vlog_unsigned_not_equal(t13, 512, t6, 512, t9, 32);
    t10 = (t13 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(92, ng0);
    t4 = (t1 + 16296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_fclose(*((unsigned int *)t6));

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(64, ng0);

LAB9:    xsi_set_current_line(66, ng0);
    t11 = (t1 + 16616);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    t21 = (t1 + 16776);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    xsi_vlog_bit_copy(t20, 0, t23, 0, 256);
    t24 = (t1 + 16936);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    xsi_vlog_bit_copy(t8, 0, t26, 0, 32);
    t28 = (t1 + 17096);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    xsi_vlog_bit_copy(t27, 0, t30, 0, 128);
    *((int *)t31) = xsi_vlogfile_sscanf(t19, 512, ng5, 4, t1, (char)118, t20, 256, (char)118, t8, 32, (char)118, t27, 128);
    t32 = (t31 + 4);
    *((int *)t32) = 0;
    t33 = (t1 + 16776);
    xsi_vlogvar_assign_value(t33, t20, 0, 0, 256);
    t34 = (t1 + 16936);
    xsi_vlogvar_assign_value(t34, t8, 0, 0, 32);
    t35 = (t1 + 17096);
    xsi_vlogvar_assign_value(t35, t27, 0, 0, 128);
    t36 = (t1 + 16456);
    xsi_vlogvar_assign_value(t36, t31, 0, 0, 32);
    xsi_set_current_line(68, ng0);
    t4 = (t1 + 16456);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng6)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t6, 32, t9, 32);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(89, ng0);
    t4 = (t1 + 16616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 16296);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    goto LAB6;

LAB10:    xsi_set_current_line(68, ng0);

LAB13:    xsi_set_current_line(69, ng0);
    t11 = (t1 + 17096);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t22 = (t19 + 4);
    t37 = *((unsigned int *)t19);
    t38 = (t37 >> 16);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t22);
    t40 = (t39 >> 16);
    *((unsigned int *)t21) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 255U);
    t42 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t42 & 255U);
    t23 = (t1 + 16136);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t43, 0, 8);
    t26 = (t31 + 4);
    t28 = (t25 + 4);
    t44 = *((unsigned int *)t31);
    t45 = *((unsigned int *)t25);
    t46 = (t44 ^ t45);
    t47 = *((unsigned int *)t26);
    t48 = *((unsigned int *)t28);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t26);
    t52 = *((unsigned int *)t28);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB17;

LAB14:    if (t53 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t43) = 1;

LAB17:    t30 = (t43 + 4);
    t56 = *((unsigned int *)t30);
    t57 = (~(t56));
    t58 = *((unsigned int *)t43);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(79, ng0);
    t4 = (t1 + 17096);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    t9 = (t8 + 4);
    t10 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 16);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t10);
    t17 = (t16 >> 16);
    *((unsigned int *)t9) = t17;
    t18 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t18 & 255U);
    t37 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t37 & 255U);
    t11 = ((char*)((ng12)));
    memset(t31, 0, 8);
    t12 = (t8 + 4);
    t19 = (t11 + 4);
    t38 = *((unsigned int *)t8);
    t39 = *((unsigned int *)t11);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t19);
    t44 = (t41 ^ t42);
    t45 = (t40 | t44);
    t46 = *((unsigned int *)t12);
    t47 = *((unsigned int *)t19);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB46;

LAB43:    if (t48 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t31) = 1;

LAB46:    t22 = (t31 + 4);
    t51 = *((unsigned int *)t22);
    t52 = (~(t51));
    t53 = *((unsigned int *)t31);
    t54 = (t53 & t52);
    t55 = (t54 != 0);
    if (t55 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB20:    goto LAB12;

LAB16:    t29 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(69, ng0);

LAB21:    xsi_set_current_line(70, ng0);
    t32 = (t1 + 17256);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = ((char*)((ng1)));
    memset(t63, 0, 8);
    t36 = (t34 + 4);
    t64 = (t35 + 4);
    t65 = *((unsigned int *)t34);
    t66 = *((unsigned int *)t35);
    t67 = (t65 ^ t66);
    t68 = *((unsigned int *)t36);
    t69 = *((unsigned int *)t64);
    t70 = (t68 ^ t69);
    t71 = (t67 | t70);
    t72 = *((unsigned int *)t36);
    t73 = *((unsigned int *)t64);
    t74 = (t72 | t73);
    t75 = (~(t74));
    t76 = (t71 & t75);
    if (t76 != 0)
        goto LAB23;

LAB22:    if (t74 != 0)
        goto LAB24;

LAB25:    memset(t62, 0, 8);
    t78 = (t63 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t63);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t78) != 0)
        goto LAB28;

LAB29:    t85 = (t62 + 4);
    t86 = *((unsigned int *)t62);
    t87 = *((unsigned int *)t85);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB30;

LAB31:    t94 = *((unsigned int *)t62);
    t95 = (~(t94));
    t96 = *((unsigned int *)t85);
    t97 = (t95 || t96);
    if (t97 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t85) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t62) > 0)
        goto LAB36;

LAB37:    memcpy(t61, t101, 8);

LAB38:    t102 = (t1 + 17416);
    xsi_vlogvar_assign_value(t102, t61, 0, 0, 8);
    xsi_set_current_line(71, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 17256);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 12);
    xsi_set_current_line(72, ng0);
    t4 = (t1 + 16776);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 11976);
    t10 = (t1 + 11976);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 11976);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 17256);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 17416);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(73, ng0);
    t4 = (t1 + 17096);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12616);
    t10 = (t1 + 12616);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12616);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 17256);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 17416);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(74, ng0);
    t4 = (t1 + 15976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng8, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(75, ng0);
    t4 = (t1 + 17416);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 17256);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t12, (char)118, t6, 8, (char)118, t11, 12);
    xsi_set_current_line(76, ng0);
    t4 = (t1 + 11976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 11976);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 11976);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 17256);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 17416);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t20, 256, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t29, (char)118, t20, 256);
    xsi_set_current_line(77, ng0);
    t4 = (t1 + 12616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12616);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12616);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 17256);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 17416);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t27, 128, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t29, (char)118, t27, 128);
    goto LAB20;

LAB23:    *((unsigned int *)t63) = 1;
    goto LAB25;

LAB24:    t77 = (t63 + 4);
    *((unsigned int *)t63) = 1;
    *((unsigned int *)t77) = 1;
    goto LAB25;

LAB26:    *((unsigned int *)t62) = 1;
    goto LAB29;

LAB28:    t84 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB29;

LAB30:    t89 = (t1 + 17416);
    t90 = (t89 + 56U);
    t91 = *((char **)t90);
    t92 = ((char*)((ng7)));
    memset(t93, 0, 8);
    xsi_vlog_unsigned_add(t93, 32, t91, 8, t92, 32);
    goto LAB31;

LAB32:    t98 = (t1 + 17416);
    t99 = (t98 + 56U);
    t100 = *((char **)t99);
    memcpy(t101, t100, 8);
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t61, 32, t93, 32, t101, 32);
    goto LAB38;

LAB36:    memcpy(t61, t93, 8);
    goto LAB38;

LAB39:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB40;

LAB41:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB42;

LAB45:    t21 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(79, ng0);

LAB50:    xsi_set_current_line(80, ng0);
    t23 = (t1 + 17256);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng7)));
    memset(t43, 0, 8);
    xsi_vlog_unsigned_add(t43, 32, t25, 12, t26, 32);
    t28 = (t1 + 17256);
    xsi_vlogvar_assign_value(t28, t43, 0, 0, 12);
    xsi_set_current_line(81, ng0);
    t4 = (t1 + 16776);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 11976);
    t10 = (t1 + 11976);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 11976);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 17256);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 17416);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB51;

LAB52:    xsi_set_current_line(82, ng0);
    t4 = (t1 + 17096);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12616);
    t10 = (t1 + 12616);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12616);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 17256);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 17416);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB53;

LAB54:    xsi_set_current_line(83, ng0);
    t4 = (t1 + 15976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng8, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(84, ng0);
    t4 = (t1 + 17416);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 17256);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t12, (char)118, t6, 8, (char)118, t11, 12);
    xsi_set_current_line(85, ng0);
    t4 = (t1 + 11976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 11976);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 11976);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 17256);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 17416);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t20, 256, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t29, (char)118, t20, 256);
    xsi_set_current_line(86, ng0);
    t4 = (t1 + 12616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12616);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12616);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 17256);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 17416);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t27, 128, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 848);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t29, (char)118, t27, 128);
    goto LAB49;

LAB51:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB52;

LAB53:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB54;

}

static int sp_nf10g_1_stim_packet_dump(char *t1, char *t2)
{
    char t8[8];
    char t13[128];
    char t20[64];
    char t27[32];
    char t31[8];
    char t43[8];
    char t61[8];
    char t62[8];
    char t63[8];
    char t93[8];
    char t101[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    double t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    char *t100;
    char *t102;
    int t103;
    int t104;
    int t105;
    int t106;
    int t107;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1280);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(111, ng0);

LAB5:    xsi_set_current_line(112, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t1 + 18856);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 12);
    xsi_set_current_line(112, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 19016);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(114, ng0);
    t4 = (t1 + 17576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng2, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(116, ng0);
    t4 = (t1 + 17576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t8) = xsi_vlogfile_file_open_of_valname_ctype(t6, 512, ng3);
    t9 = (t8 + 4);
    *((int *)t9) = 0;
    t10 = (t1 + 17896);
    xsi_vlogvar_assign_value(t10, t8, 0, 0, 32);
    xsi_set_current_line(118, ng0);
    t4 = (t1 + 18216);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 17896);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    xsi_set_current_line(120, ng0);

LAB6:    t4 = (t1 + 18216);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng4)));
    xsi_vlog_unsigned_not_equal(t13, 512, t6, 512, t9, 32);
    t10 = (t13 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(148, ng0);
    t4 = (t1 + 17896);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_fclose(*((unsigned int *)t6));

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(120, ng0);

LAB9:    xsi_set_current_line(122, ng0);
    t11 = (t1 + 18216);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    t21 = (t1 + 18376);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    xsi_vlog_bit_copy(t20, 0, t23, 0, 256);
    t24 = (t1 + 18536);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    xsi_vlog_bit_copy(t8, 0, t26, 0, 32);
    t28 = (t1 + 18696);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    xsi_vlog_bit_copy(t27, 0, t30, 0, 128);
    *((int *)t31) = xsi_vlogfile_sscanf(t19, 512, ng5, 4, t1, (char)118, t20, 256, (char)118, t8, 32, (char)118, t27, 128);
    t32 = (t31 + 4);
    *((int *)t32) = 0;
    t33 = (t1 + 18376);
    xsi_vlogvar_assign_value(t33, t20, 0, 0, 256);
    t34 = (t1 + 18536);
    xsi_vlogvar_assign_value(t34, t8, 0, 0, 32);
    t35 = (t1 + 18696);
    xsi_vlogvar_assign_value(t35, t27, 0, 0, 128);
    t36 = (t1 + 18056);
    xsi_vlogvar_assign_value(t36, t31, 0, 0, 32);
    xsi_set_current_line(124, ng0);
    t4 = (t1 + 18056);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng6)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t6, 32, t9, 32);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(145, ng0);
    t4 = (t1 + 18216);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 17896);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    goto LAB6;

LAB10:    xsi_set_current_line(124, ng0);

LAB13:    xsi_set_current_line(125, ng0);
    t11 = (t1 + 18696);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t22 = (t19 + 4);
    t37 = *((unsigned int *)t19);
    t38 = (t37 >> 16);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t22);
    t40 = (t39 >> 16);
    *((unsigned int *)t21) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 255U);
    t42 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t42 & 255U);
    t23 = (t1 + 17736);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t43, 0, 8);
    t26 = (t31 + 4);
    t28 = (t25 + 4);
    t44 = *((unsigned int *)t31);
    t45 = *((unsigned int *)t25);
    t46 = (t44 ^ t45);
    t47 = *((unsigned int *)t26);
    t48 = *((unsigned int *)t28);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t26);
    t52 = *((unsigned int *)t28);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB17;

LAB14:    if (t53 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t43) = 1;

LAB17:    t30 = (t43 + 4);
    t56 = *((unsigned int *)t30);
    t57 = (~(t56));
    t58 = *((unsigned int *)t43);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(135, ng0);
    t4 = (t1 + 18696);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    t9 = (t8 + 4);
    t10 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 16);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t10);
    t17 = (t16 >> 16);
    *((unsigned int *)t9) = t17;
    t18 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t18 & 255U);
    t37 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t37 & 255U);
    t11 = ((char*)((ng12)));
    memset(t31, 0, 8);
    t12 = (t8 + 4);
    t19 = (t11 + 4);
    t38 = *((unsigned int *)t8);
    t39 = *((unsigned int *)t11);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t19);
    t44 = (t41 ^ t42);
    t45 = (t40 | t44);
    t46 = *((unsigned int *)t12);
    t47 = *((unsigned int *)t19);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB46;

LAB43:    if (t48 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t31) = 1;

LAB46:    t22 = (t31 + 4);
    t51 = *((unsigned int *)t22);
    t52 = (~(t51));
    t53 = *((unsigned int *)t31);
    t54 = (t53 & t52);
    t55 = (t54 != 0);
    if (t55 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB20:    goto LAB12;

LAB16:    t29 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(125, ng0);

LAB21:    xsi_set_current_line(126, ng0);
    t32 = (t1 + 18856);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = ((char*)((ng1)));
    memset(t63, 0, 8);
    t36 = (t34 + 4);
    t64 = (t35 + 4);
    t65 = *((unsigned int *)t34);
    t66 = *((unsigned int *)t35);
    t67 = (t65 ^ t66);
    t68 = *((unsigned int *)t36);
    t69 = *((unsigned int *)t64);
    t70 = (t68 ^ t69);
    t71 = (t67 | t70);
    t72 = *((unsigned int *)t36);
    t73 = *((unsigned int *)t64);
    t74 = (t72 | t73);
    t75 = (~(t74));
    t76 = (t71 & t75);
    if (t76 != 0)
        goto LAB23;

LAB22:    if (t74 != 0)
        goto LAB24;

LAB25:    memset(t62, 0, 8);
    t78 = (t63 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t63);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t78) != 0)
        goto LAB28;

LAB29:    t85 = (t62 + 4);
    t86 = *((unsigned int *)t62);
    t87 = *((unsigned int *)t85);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB30;

LAB31:    t94 = *((unsigned int *)t62);
    t95 = (~(t94));
    t96 = *((unsigned int *)t85);
    t97 = (t95 || t96);
    if (t97 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t85) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t62) > 0)
        goto LAB36;

LAB37:    memcpy(t61, t101, 8);

LAB38:    t102 = (t1 + 19016);
    xsi_vlogvar_assign_value(t102, t61, 0, 0, 8);
    xsi_set_current_line(127, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 18856);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 12);
    xsi_set_current_line(128, ng0);
    t4 = (t1 + 18376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12136);
    t10 = (t1 + 12136);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12136);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 18856);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 19016);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(129, ng0);
    t4 = (t1 + 18696);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12776);
    t10 = (t1 + 12776);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12776);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 18856);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 19016);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(130, ng0);
    t4 = (t1 + 17576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng8, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(131, ng0);
    t4 = (t1 + 19016);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 18856);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t12, (char)118, t6, 8, (char)118, t11, 12);
    xsi_set_current_line(132, ng0);
    t4 = (t1 + 12136);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12136);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12136);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 18856);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 19016);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t20, 256, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t29, (char)118, t20, 256);
    xsi_set_current_line(133, ng0);
    t4 = (t1 + 12776);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12776);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12776);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 18856);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 19016);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t27, 128, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t29, (char)118, t27, 128);
    goto LAB20;

LAB23:    *((unsigned int *)t63) = 1;
    goto LAB25;

LAB24:    t77 = (t63 + 4);
    *((unsigned int *)t63) = 1;
    *((unsigned int *)t77) = 1;
    goto LAB25;

LAB26:    *((unsigned int *)t62) = 1;
    goto LAB29;

LAB28:    t84 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB29;

LAB30:    t89 = (t1 + 19016);
    t90 = (t89 + 56U);
    t91 = *((char **)t90);
    t92 = ((char*)((ng7)));
    memset(t93, 0, 8);
    xsi_vlog_unsigned_add(t93, 32, t91, 8, t92, 32);
    goto LAB31;

LAB32:    t98 = (t1 + 19016);
    t99 = (t98 + 56U);
    t100 = *((char **)t99);
    memcpy(t101, t100, 8);
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t61, 32, t93, 32, t101, 32);
    goto LAB38;

LAB36:    memcpy(t61, t93, 8);
    goto LAB38;

LAB39:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB40;

LAB41:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB42;

LAB45:    t21 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(135, ng0);

LAB50:    xsi_set_current_line(136, ng0);
    t23 = (t1 + 18856);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng7)));
    memset(t43, 0, 8);
    xsi_vlog_unsigned_add(t43, 32, t25, 12, t26, 32);
    t28 = (t1 + 18856);
    xsi_vlogvar_assign_value(t28, t43, 0, 0, 12);
    xsi_set_current_line(137, ng0);
    t4 = (t1 + 18376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12136);
    t10 = (t1 + 12136);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12136);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 18856);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 19016);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB51;

LAB52:    xsi_set_current_line(138, ng0);
    t4 = (t1 + 18696);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12776);
    t10 = (t1 + 12776);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12776);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 18856);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 19016);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB53;

LAB54:    xsi_set_current_line(139, ng0);
    t4 = (t1 + 17576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng8, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(140, ng0);
    t4 = (t1 + 19016);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 18856);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t12, (char)118, t6, 8, (char)118, t11, 12);
    xsi_set_current_line(141, ng0);
    t4 = (t1 + 12136);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12136);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12136);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 18856);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 19016);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t20, 256, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t29, (char)118, t20, 256);
    xsi_set_current_line(142, ng0);
    t4 = (t1 + 12776);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12776);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12776);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 18856);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 19016);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t27, 128, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1280);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t29, (char)118, t27, 128);
    goto LAB49;

LAB51:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB52;

LAB53:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB54;

}

static int sp_nf10g_2_stim_packet_dump(char *t1, char *t2)
{
    char t8[8];
    char t13[128];
    char t20[64];
    char t27[32];
    char t31[8];
    char t43[8];
    char t61[8];
    char t62[8];
    char t63[8];
    char t93[8];
    char t101[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    double t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    char *t100;
    char *t102;
    int t103;
    int t104;
    int t105;
    int t106;
    int t107;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1712);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(167, ng0);

LAB5:    xsi_set_current_line(168, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t1 + 20456);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 12);
    xsi_set_current_line(168, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 20616);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(170, ng0);
    t4 = (t1 + 19176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng2, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(172, ng0);
    t4 = (t1 + 19176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t8) = xsi_vlogfile_file_open_of_valname_ctype(t6, 512, ng3);
    t9 = (t8 + 4);
    *((int *)t9) = 0;
    t10 = (t1 + 19496);
    xsi_vlogvar_assign_value(t10, t8, 0, 0, 32);
    xsi_set_current_line(174, ng0);
    t4 = (t1 + 19816);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 19496);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    xsi_set_current_line(176, ng0);

LAB6:    t4 = (t1 + 19816);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng4)));
    xsi_vlog_unsigned_not_equal(t13, 512, t6, 512, t9, 32);
    t10 = (t13 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(204, ng0);
    t4 = (t1 + 19496);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_fclose(*((unsigned int *)t6));

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(176, ng0);

LAB9:    xsi_set_current_line(178, ng0);
    t11 = (t1 + 19816);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    t21 = (t1 + 19976);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    xsi_vlog_bit_copy(t20, 0, t23, 0, 256);
    t24 = (t1 + 20136);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    xsi_vlog_bit_copy(t8, 0, t26, 0, 32);
    t28 = (t1 + 20296);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    xsi_vlog_bit_copy(t27, 0, t30, 0, 128);
    *((int *)t31) = xsi_vlogfile_sscanf(t19, 512, ng5, 4, t1, (char)118, t20, 256, (char)118, t8, 32, (char)118, t27, 128);
    t32 = (t31 + 4);
    *((int *)t32) = 0;
    t33 = (t1 + 19976);
    xsi_vlogvar_assign_value(t33, t20, 0, 0, 256);
    t34 = (t1 + 20136);
    xsi_vlogvar_assign_value(t34, t8, 0, 0, 32);
    t35 = (t1 + 20296);
    xsi_vlogvar_assign_value(t35, t27, 0, 0, 128);
    t36 = (t1 + 19656);
    xsi_vlogvar_assign_value(t36, t31, 0, 0, 32);
    xsi_set_current_line(180, ng0);
    t4 = (t1 + 19656);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng6)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t6, 32, t9, 32);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(201, ng0);
    t4 = (t1 + 19816);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 19496);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    goto LAB6;

LAB10:    xsi_set_current_line(180, ng0);

LAB13:    xsi_set_current_line(181, ng0);
    t11 = (t1 + 20296);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t22 = (t19 + 4);
    t37 = *((unsigned int *)t19);
    t38 = (t37 >> 16);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t22);
    t40 = (t39 >> 16);
    *((unsigned int *)t21) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 255U);
    t42 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t42 & 255U);
    t23 = (t1 + 19336);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t43, 0, 8);
    t26 = (t31 + 4);
    t28 = (t25 + 4);
    t44 = *((unsigned int *)t31);
    t45 = *((unsigned int *)t25);
    t46 = (t44 ^ t45);
    t47 = *((unsigned int *)t26);
    t48 = *((unsigned int *)t28);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t26);
    t52 = *((unsigned int *)t28);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB17;

LAB14:    if (t53 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t43) = 1;

LAB17:    t30 = (t43 + 4);
    t56 = *((unsigned int *)t30);
    t57 = (~(t56));
    t58 = *((unsigned int *)t43);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(191, ng0);
    t4 = (t1 + 20296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    t9 = (t8 + 4);
    t10 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 16);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t10);
    t17 = (t16 >> 16);
    *((unsigned int *)t9) = t17;
    t18 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t18 & 255U);
    t37 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t37 & 255U);
    t11 = ((char*)((ng12)));
    memset(t31, 0, 8);
    t12 = (t8 + 4);
    t19 = (t11 + 4);
    t38 = *((unsigned int *)t8);
    t39 = *((unsigned int *)t11);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t19);
    t44 = (t41 ^ t42);
    t45 = (t40 | t44);
    t46 = *((unsigned int *)t12);
    t47 = *((unsigned int *)t19);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB46;

LAB43:    if (t48 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t31) = 1;

LAB46:    t22 = (t31 + 4);
    t51 = *((unsigned int *)t22);
    t52 = (~(t51));
    t53 = *((unsigned int *)t31);
    t54 = (t53 & t52);
    t55 = (t54 != 0);
    if (t55 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB20:    goto LAB12;

LAB16:    t29 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(181, ng0);

LAB21:    xsi_set_current_line(182, ng0);
    t32 = (t1 + 20456);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = ((char*)((ng1)));
    memset(t63, 0, 8);
    t36 = (t34 + 4);
    t64 = (t35 + 4);
    t65 = *((unsigned int *)t34);
    t66 = *((unsigned int *)t35);
    t67 = (t65 ^ t66);
    t68 = *((unsigned int *)t36);
    t69 = *((unsigned int *)t64);
    t70 = (t68 ^ t69);
    t71 = (t67 | t70);
    t72 = *((unsigned int *)t36);
    t73 = *((unsigned int *)t64);
    t74 = (t72 | t73);
    t75 = (~(t74));
    t76 = (t71 & t75);
    if (t76 != 0)
        goto LAB23;

LAB22:    if (t74 != 0)
        goto LAB24;

LAB25:    memset(t62, 0, 8);
    t78 = (t63 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t63);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t78) != 0)
        goto LAB28;

LAB29:    t85 = (t62 + 4);
    t86 = *((unsigned int *)t62);
    t87 = *((unsigned int *)t85);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB30;

LAB31:    t94 = *((unsigned int *)t62);
    t95 = (~(t94));
    t96 = *((unsigned int *)t85);
    t97 = (t95 || t96);
    if (t97 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t85) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t62) > 0)
        goto LAB36;

LAB37:    memcpy(t61, t101, 8);

LAB38:    t102 = (t1 + 20616);
    xsi_vlogvar_assign_value(t102, t61, 0, 0, 8);
    xsi_set_current_line(183, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 20456);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 12);
    xsi_set_current_line(184, ng0);
    t4 = (t1 + 19976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12296);
    t10 = (t1 + 12296);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12296);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 20456);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 20616);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(185, ng0);
    t4 = (t1 + 20296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12936);
    t10 = (t1 + 12936);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12936);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 20456);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 20616);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(186, ng0);
    t4 = (t1 + 19176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng8, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(187, ng0);
    t4 = (t1 + 20616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 20456);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t12, (char)118, t6, 8, (char)118, t11, 12);
    xsi_set_current_line(188, ng0);
    t4 = (t1 + 12296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12296);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12296);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 20456);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 20616);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t20, 256, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t29, (char)118, t20, 256);
    xsi_set_current_line(189, ng0);
    t4 = (t1 + 12936);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12936);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12936);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 20456);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 20616);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t27, 128, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t29, (char)118, t27, 128);
    goto LAB20;

LAB23:    *((unsigned int *)t63) = 1;
    goto LAB25;

LAB24:    t77 = (t63 + 4);
    *((unsigned int *)t63) = 1;
    *((unsigned int *)t77) = 1;
    goto LAB25;

LAB26:    *((unsigned int *)t62) = 1;
    goto LAB29;

LAB28:    t84 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB29;

LAB30:    t89 = (t1 + 20616);
    t90 = (t89 + 56U);
    t91 = *((char **)t90);
    t92 = ((char*)((ng7)));
    memset(t93, 0, 8);
    xsi_vlog_unsigned_add(t93, 32, t91, 8, t92, 32);
    goto LAB31;

LAB32:    t98 = (t1 + 20616);
    t99 = (t98 + 56U);
    t100 = *((char **)t99);
    memcpy(t101, t100, 8);
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t61, 32, t93, 32, t101, 32);
    goto LAB38;

LAB36:    memcpy(t61, t93, 8);
    goto LAB38;

LAB39:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB40;

LAB41:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB42;

LAB45:    t21 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(191, ng0);

LAB50:    xsi_set_current_line(192, ng0);
    t23 = (t1 + 20456);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng7)));
    memset(t43, 0, 8);
    xsi_vlog_unsigned_add(t43, 32, t25, 12, t26, 32);
    t28 = (t1 + 20456);
    xsi_vlogvar_assign_value(t28, t43, 0, 0, 12);
    xsi_set_current_line(193, ng0);
    t4 = (t1 + 19976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12296);
    t10 = (t1 + 12296);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12296);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 20456);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 20616);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB51;

LAB52:    xsi_set_current_line(194, ng0);
    t4 = (t1 + 20296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12936);
    t10 = (t1 + 12936);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12936);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 20456);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 20616);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB53;

LAB54:    xsi_set_current_line(195, ng0);
    t4 = (t1 + 19176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng8, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(196, ng0);
    t4 = (t1 + 20616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 20456);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t12, (char)118, t6, 8, (char)118, t11, 12);
    xsi_set_current_line(197, ng0);
    t4 = (t1 + 12296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12296);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12296);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 20456);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 20616);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t20, 256, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t29, (char)118, t20, 256);
    xsi_set_current_line(198, ng0);
    t4 = (t1 + 12936);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12936);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = (t1 + 12936);
    t19 = (t12 + 64U);
    t21 = *((char **)t19);
    t22 = (t1 + 20456);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t1 + 20616);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    xsi_vlogtype_concat(t8, 20, 20, 2U, t28, 8, t24, 12);
    xsi_vlog_generic_get_array_select_value(t27, 128, t6, t11, t21, 2, 1, t8, 20, 2);
    t29 = (t1 + 1712);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t29, (char)118, t27, 128);
    goto LAB49;

LAB51:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB52;

LAB53:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB54;

}

static int sp_nf10g_3_stim_packet_dump(char *t1, char *t2)
{
    char t8[8];
    char t13[128];
    char t20[64];
    char t27[32];
    char t31[8];
    char t43[8];
    char t61[8];
    char t62[8];
    char t63[8];
    char t93[8];
    char t101[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    double t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    char *t100;
    char *t102;
    int t103;
    int t104;
    int t105;
    int t106;
    int t107;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 2144);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(223, ng0);

LAB5:    xsi_set_current_line(224, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t1 + 22056);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 12);
    xsi_set_current_line(224, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 22216);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(226, ng0);
    t4 = (t1 + 20776);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t8) = t7;
    t9 = (t1 + 2144);
    xsi_vlogfile_write(1, 0, 0, ng2, 3, t9, (char)118, t6, 512, (char)114, t8, 64);
    xsi_set_current_line(228, ng0);
    t4 = (t1 + 20776);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t8) = xsi_vlogfile_file_open_of_valname_ctype(t6, 512, ng3);
    t9 = (t8 + 4);
    *((int *)t9) = 0;
    t10 = (t1 + 21096);
    xsi_vlogvar_assign_value(t10, t8, 0, 0, 32);
    xsi_set_current_line(230, ng0);
    t4 = (t1 + 21416);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 21096);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    xsi_set_current_line(232, ng0);

LAB6:    t4 = (t1 + 21416);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng4)));
    xsi_vlog_unsigned_not_equal(t13, 512, t6, 512, t9, 32);
    t10 = (t13 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(264, ng0);
    t4 = (t1 + 21096);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_fclose(*((unsigned int *)t6));

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(232, ng0);

LAB9:    xsi_set_current_line(234, ng0);
    t11 = (t1 + 21416);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    t21 = (t1 + 21576);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    xsi_vlog_bit_copy(t20, 0, t23, 0, 256);
    t24 = (t1 + 21736);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    xsi_vlog_bit_copy(t8, 0, t26, 0, 32);
    t28 = (t1 + 21896);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    xsi_vlog_bit_copy(t27, 0, t30, 0, 128);
    *((int *)t31) = xsi_vlogfile_sscanf(t19, 512, ng5, 4, t1, (char)118, t20, 256, (char)118, t8, 32, (char)118, t27, 128);
    t32 = (t31 + 4);
    *((int *)t32) = 0;
    t33 = (t1 + 21576);
    xsi_vlogvar_assign_value(t33, t20, 0, 0, 256);
    t34 = (t1 + 21736);
    xsi_vlogvar_assign_value(t34, t8, 0, 0, 32);
    t35 = (t1 + 21896);
    xsi_vlogvar_assign_value(t35, t27, 0, 0, 128);
    t36 = (t1 + 21256);
    xsi_vlogvar_assign_value(t36, t31, 0, 0, 32);
    xsi_set_current_line(236, ng0);
    t4 = (t1 + 21256);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = ((char*)((ng6)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t6, 32, t9, 32);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(261, ng0);
    t4 = (t1 + 21416);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 21096);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t8) = xsi_vlogfile_fgets(t6, 512, *((unsigned int *)t11));
    t12 = (t8 + 4);
    *((int *)t12) = 0;
    goto LAB6;

LAB10:    xsi_set_current_line(236, ng0);

LAB13:    xsi_set_current_line(237, ng0);
    t11 = (t1 + 21896);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t22 = (t19 + 4);
    t37 = *((unsigned int *)t19);
    t38 = (t37 >> 16);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t22);
    t40 = (t39 >> 16);
    *((unsigned int *)t21) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 255U);
    t42 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t42 & 255U);
    t23 = (t1 + 20936);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t43, 0, 8);
    t26 = (t31 + 4);
    t28 = (t25 + 4);
    t44 = *((unsigned int *)t31);
    t45 = *((unsigned int *)t25);
    t46 = (t44 ^ t45);
    t47 = *((unsigned int *)t26);
    t48 = *((unsigned int *)t28);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t26);
    t52 = *((unsigned int *)t28);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB17;

LAB14:    if (t53 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t43) = 1;

LAB17:    t30 = (t43 + 4);
    t56 = *((unsigned int *)t30);
    t57 = (~(t56));
    t58 = *((unsigned int *)t43);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(249, ng0);
    t4 = (t1 + 21896);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    t9 = (t8 + 4);
    t10 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = (t14 >> 16);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t10);
    t17 = (t16 >> 16);
    *((unsigned int *)t9) = t17;
    t18 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t18 & 255U);
    t37 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t37 & 255U);
    t11 = ((char*)((ng12)));
    memset(t31, 0, 8);
    t12 = (t8 + 4);
    t19 = (t11 + 4);
    t38 = *((unsigned int *)t8);
    t39 = *((unsigned int *)t11);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t19);
    t44 = (t41 ^ t42);
    t45 = (t40 | t44);
    t46 = *((unsigned int *)t12);
    t47 = *((unsigned int *)t19);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB46;

LAB43:    if (t48 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t31) = 1;

LAB46:    t22 = (t31 + 4);
    t51 = *((unsigned int *)t22);
    t52 = (~(t51));
    t53 = *((unsigned int *)t31);
    t54 = (t53 & t52);
    t55 = (t54 != 0);
    if (t55 > 0)
        goto LAB47;

LAB48:
LAB49:
LAB20:    goto LAB12;

LAB16:    t29 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(237, ng0);

LAB21:    xsi_set_current_line(238, ng0);
    t32 = (t1 + 22056);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = ((char*)((ng1)));
    memset(t63, 0, 8);
    t36 = (t34 + 4);
    t64 = (t35 + 4);
    t65 = *((unsigned int *)t34);
    t66 = *((unsigned int *)t35);
    t67 = (t65 ^ t66);
    t68 = *((unsigned int *)t36);
    t69 = *((unsigned int *)t64);
    t70 = (t68 ^ t69);
    t71 = (t67 | t70);
    t72 = *((unsigned int *)t36);
    t73 = *((unsigned int *)t64);
    t74 = (t72 | t73);
    t75 = (~(t74));
    t76 = (t71 & t75);
    if (t76 != 0)
        goto LAB23;

LAB22:    if (t74 != 0)
        goto LAB24;

LAB25:    memset(t62, 0, 8);
    t78 = (t63 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t63);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t78) != 0)
        goto LAB28;

LAB29:    t85 = (t62 + 4);
    t86 = *((unsigned int *)t62);
    t87 = *((unsigned int *)t85);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB30;

LAB31:    t94 = *((unsigned int *)t62);
    t95 = (~(t94));
    t96 = *((unsigned int *)t85);
    t97 = (t95 || t96);
    if (t97 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t85) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t62) > 0)
        goto LAB36;

LAB37:    memcpy(t61, t101, 8);

LAB38:    t102 = (t1 + 22216);
    xsi_vlogvar_assign_value(t102, t61, 0, 0, 8);
    xsi_set_current_line(239, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t1 + 22056);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 12);
    xsi_set_current_line(240, ng0);
    t4 = (t1 + 21576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12456);
    t10 = (t1 + 12456);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12456);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 22056);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 22216);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(241, ng0);
    t4 = (t1 + 21896);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 13096);
    t10 = (t1 + 13096);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 13096);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 22056);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 22216);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB41;

LAB42:    goto LAB20;

LAB23:    *((unsigned int *)t63) = 1;
    goto LAB25;

LAB24:    t77 = (t63 + 4);
    *((unsigned int *)t63) = 1;
    *((unsigned int *)t77) = 1;
    goto LAB25;

LAB26:    *((unsigned int *)t62) = 1;
    goto LAB29;

LAB28:    t84 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB29;

LAB30:    t89 = (t1 + 22216);
    t90 = (t89 + 56U);
    t91 = *((char **)t90);
    t92 = ((char*)((ng7)));
    memset(t93, 0, 8);
    xsi_vlog_unsigned_add(t93, 32, t91, 8, t92, 32);
    goto LAB31;

LAB32:    t98 = (t1 + 22216);
    t99 = (t98 + 56U);
    t100 = *((char **)t99);
    memcpy(t101, t100, 8);
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t61, 32, t93, 32, t101, 32);
    goto LAB38;

LAB36:    memcpy(t61, t93, 8);
    goto LAB38;

LAB39:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB40;

LAB41:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB42;

LAB45:    t21 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(249, ng0);

LAB50:    xsi_set_current_line(250, ng0);
    t23 = (t1 + 22056);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng7)));
    memset(t43, 0, 8);
    xsi_vlog_unsigned_add(t43, 32, t25, 12, t26, 32);
    t28 = (t1 + 22056);
    xsi_vlogvar_assign_value(t28, t43, 0, 0, 12);
    xsi_set_current_line(251, ng0);
    t4 = (t1 + 21576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 12456);
    t10 = (t1 + 12456);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 12456);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 22056);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 22216);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB51;

LAB52:    xsi_set_current_line(252, ng0);
    t4 = (t1 + 21896);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t9 = (t1 + 13096);
    t10 = (t1 + 13096);
    t11 = (t10 + 72U);
    t12 = *((char **)t11);
    t19 = (t1 + 13096);
    t21 = (t19 + 64U);
    t22 = *((char **)t21);
    t23 = (t1 + 22056);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t1 + 22216);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    xsi_vlogtype_concat(t43, 20, 20, 2U, t29, 8, t25, 12);
    xsi_vlog_generic_convert_array_indices(t8, t31, t12, t22, 2, 1, t43, 20, 2);
    t30 = (t8 + 4);
    t14 = *((unsigned int *)t30);
    t103 = (!(t14));
    t32 = (t31 + 4);
    t15 = *((unsigned int *)t32);
    t104 = (!(t15));
    t105 = (t103 && t104);
    if (t105 == 1)
        goto LAB53;

LAB54:    goto LAB49;

LAB51:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB52;

LAB53:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t31);
    t106 = (t16 - t17);
    t107 = (t106 + 1);
    xsi_vlogvar_assign_value(t9, t6, 0, *((unsigned int *)t31), t107);
    goto LAB54;

}

static void Initial_109_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    double t4;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 23128U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng13);

LAB4:    xsi_set_current_line(110, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 9096);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(111, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 9256);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(113, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 9416);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(114, ng13);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 9576);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(115, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 9736);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(116, ng13);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 9896);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(117, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 10056);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(118, ng13);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 10216);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(119, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 10376);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(120, ng13);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 10536);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(122, ng13);
    t4 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t5) = t4;
    xsi_vlogfile_write(1, 0, 0, ng15, 2, t0, (char)114, t5, 64);
    xsi_set_current_line(123, ng13);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 8936);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(124, ng13);
    xsi_set_current_line(124, ng13);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8776);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB5:    t2 = (t0 + 8776);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = ((char*)((ng16)));
    memset(t5, 0, 8);
    xsi_vlog_signed_less(t5, 32, t6, 32, t7, 32);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(127, ng13);
    t4 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t5) = t4;
    xsi_vlogfile_write(1, 0, 0, ng17, 2, t0, (char)114, t5, 64);
    xsi_set_current_line(128, ng13);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 8936);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB1:    return;
LAB6:    xsi_set_current_line(124, ng13);

LAB8:    xsi_set_current_line(125, ng13);
    t14 = (t0 + 35352);
    *((int *)t14) = 1;
    t15 = (t0 + 23160);
    *((char **)t15) = t14;
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(124, ng13);
    t2 = (t0 + 8776);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t6, 32, t7, 32);
    t8 = (t0 + 8776);
    xsi_vlogvar_assign_value(t8, t5, 0, 0, 32);
    goto LAB5;

}

static void Always_132_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 23376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(132, ng13);
    t2 = (t0 + 23184);
    xsi_process_wait(t2, 50000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(132, ng13);
    t4 = (t0 + 9256);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 9256);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_133_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 23624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(133, ng13);
    t2 = (t0 + 23432);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(133, ng13);
    t4 = (t0 + 9416);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 9416);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_134_3(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 23872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(134, ng13);
    t2 = (t0 + 23680);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(134, ng13);
    t4 = (t0 + 9576);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 9576);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_135_4(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 24120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(135, ng13);
    t2 = (t0 + 23928);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(135, ng13);
    t4 = (t0 + 9736);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 9736);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_136_5(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 24368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(136, ng13);
    t2 = (t0 + 24176);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(136, ng13);
    t4 = (t0 + 9896);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 9896);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_137_6(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 24616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(137, ng13);
    t2 = (t0 + 24424);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(137, ng13);
    t4 = (t0 + 10056);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 10056);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_138_7(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 24864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(138, ng13);
    t2 = (t0 + 24672);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(138, ng13);
    t4 = (t0 + 10216);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 10216);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_139_8(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 25112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(139, ng13);
    t2 = (t0 + 24920);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(139, ng13);
    t4 = (t0 + 10376);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 10376);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_140_9(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 25360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(140, ng13);
    t2 = (t0 + 25168);
    xsi_process_wait(t2, 32000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(140, ng13);
    t4 = (t0 + 10536);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 10536);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void NetDecl_52_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 25608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng18);
    t2 = (t0 + 46952);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36040);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35368);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_54_11(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 25856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng18);
    t2 = (t0 + 47024);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36104);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 256);
    xsi_driver_vfirst_trans(t4, 0, 255U);
    t10 = (t0 + 35384);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_55_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 26104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng18);
    t2 = (t0 + 47096);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36168);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8);
    xsi_driver_vfirst_trans(t4, 0, 31U);
    t10 = (t0 + 35400);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_56_13(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 26352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng18);
    t2 = (t0 + 47168);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36232);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 128);
    xsi_driver_vfirst_trans(t4, 0, 127U);
    t10 = (t0 + 35416);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_57_14(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 26600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng18);
    t2 = (t0 + 47240);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36296);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35432);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_58_15(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 26848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng18);
    t2 = (t0 + 47312);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36360);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35448);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_59_16(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 27096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng18);
    t2 = (t0 + 47384);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36424);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35464);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_64_17(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 27344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng18);
    t2 = (t0 + 47456);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36488);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 256);
    xsi_driver_vfirst_trans(t4, 0, 255U);
    t10 = (t0 + 35480);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_65_18(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 27592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng18);
    t2 = (t0 + 47528);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36552);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8);
    xsi_driver_vfirst_trans(t4, 0, 31U);
    t10 = (t0 + 35496);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_66_19(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 27840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng18);
    t2 = (t0 + 47600);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36616);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 128);
    xsi_driver_vfirst_trans(t4, 0, 127U);
    t10 = (t0 + 35512);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_67_20(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 28088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(67, ng18);
    t2 = (t0 + 47672);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36680);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35528);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_68_21(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 28336U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng18);
    t2 = (t0 + 47744);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36744);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35544);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_69_22(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 28584U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng18);
    t2 = (t0 + 47816);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36808);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35560);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_74_23(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 28832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng18);
    t2 = (t0 + 47888);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36872);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 256);
    xsi_driver_vfirst_trans(t4, 0, 255U);
    t10 = (t0 + 35576);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_75_24(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 29080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(75, ng18);
    t2 = (t0 + 47960);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 36936);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8);
    xsi_driver_vfirst_trans(t4, 0, 31U);
    t10 = (t0 + 35592);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_76_25(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 29328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(76, ng18);
    t2 = (t0 + 48032);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37000);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 128);
    xsi_driver_vfirst_trans(t4, 0, 127U);
    t10 = (t0 + 35608);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_77_26(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 29576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng18);
    t2 = (t0 + 48104);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37064);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35624);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_78_27(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 29824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng18);
    t2 = (t0 + 48176);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37128);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35640);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_79_28(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 30072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(79, ng18);
    t2 = (t0 + 48248);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37192);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35656);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_84_29(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 30320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng18);
    t2 = (t0 + 48320);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37256);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 256);
    xsi_driver_vfirst_trans(t4, 0, 255U);
    t10 = (t0 + 35672);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_85_30(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 30568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng18);
    t2 = (t0 + 48392);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37320);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8);
    xsi_driver_vfirst_trans(t4, 0, 31U);
    t10 = (t0 + 35688);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_86_31(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 30816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng18);
    t2 = (t0 + 48464);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37384);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 128);
    xsi_driver_vfirst_trans(t4, 0, 127U);
    t10 = (t0 + 35704);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_87_32(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 31064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng18);
    t2 = (t0 + 48536);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37448);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35720);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_88_33(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 31312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(88, ng18);
    t2 = (t0 + 48608);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37512);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35736);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_89_34(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 31560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng18);
    t2 = (t0 + 48680);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37576);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35752);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_41_35(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 31808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng19);
    t2 = (t0 + 48752);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37640);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35768);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_43_36(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 32056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng19);
    t2 = (t0 + 48824);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37704);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 256);
    xsi_driver_vfirst_trans(t4, 0, 255U);
    t10 = (t0 + 35784);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_44_37(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 32304U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng19);
    t2 = (t0 + 48896);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37768);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8);
    xsi_driver_vfirst_trans(t4, 0, 31U);
    t10 = (t0 + 35800);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_45_38(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 32552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng19);
    t2 = (t0 + 48968);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37832);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 128);
    xsi_driver_vfirst_trans(t4, 0, 127U);
    t10 = (t0 + 35816);
    *((int *)t10) = 1;

LAB1:    return;
}

static void NetDecl_46_39(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 32800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng19);
    t2 = (t0 + 49048);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37896);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35832);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_47_40(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 33048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng19);
    t2 = (t0 + 49128);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 37960);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35848);
    *((int *)t18) = 1;

LAB1:    return;
}

static void NetDecl_48_41(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 33296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng19);
    t2 = (t0 + 49200);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 38024);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 35864);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_54_42(char *t0)
{
    char t6[32];
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 33544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng19);
    t2 = (t0 + 35880);
    *((int *)t2) = 1;
    t3 = (t0 + 33576);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng19);
    t4 = (t0 + 7896U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng20)));
    xsi_vlog_unsigned_not_equal(t6, 128, t5, 128, t4, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB5;

LAB6:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(55, ng19);
    t14 = (t0 + 7896U);
    t15 = *((char **)t14);
    memset(t13, 0, 8);
    t14 = (t13 + 4);
    t16 = (t15 + 4);
    t17 = *((unsigned int *)t15);
    t18 = (t17 >> 16);
    *((unsigned int *)t13) = t18;
    t19 = *((unsigned int *)t16);
    t20 = (t19 >> 16);
    *((unsigned int *)t14) = t20;
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 255U);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t22 & 255U);
    t23 = (t0 + 15816);
    xsi_vlogvar_assign_value(t23, t13, 0, 0, 8);
    goto LAB7;

}

static void Always_57_43(char *t0)
{
    char t4[8];
    char t41[8];
    char t77[8];
    char t78[8];
    char t80[8];
    char t89[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    char *t79;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    char *t90;

LAB0:    t1 = (t0 + 33792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng19);
    t2 = (t0 + 35896);
    *((int *)t2) = 1;
    t3 = (t0 + 33824);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(58, ng19);
    t5 = (t0 + 8936);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t4, 0, 8);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t8) == 0)
        goto LAB5;

LAB7:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;

LAB8:    t15 = (t4 + 4);
    t16 = (t7 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    *((unsigned int *)t4) = t18;
    *((unsigned int *)t15) = 0;
    if (*((unsigned int *)t16) != 0)
        goto LAB10;

LAB9:    t23 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t23 & 1U);
    t24 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t24 & 1U);
    t25 = (t4 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t4);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(68, ng19);
    t2 = (t0 + 8056U);
    t3 = *((char **)t2);
    t2 = (t0 + 8216U);
    t5 = *((char **)t2);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t5);
    t11 = (t9 & t10);
    *((unsigned int *)t4) = t11;
    t2 = (t3 + 4);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t2);
    t13 = *((unsigned int *)t6);
    t17 = (t12 | t13);
    *((unsigned int *)t7) = t17;
    t18 = *((unsigned int *)t7);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB15;

LAB16:
LAB17:    t15 = (t0 + 8376U);
    t16 = *((char **)t15);
    t42 = *((unsigned int *)t4);
    t43 = *((unsigned int *)t16);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t15 = (t4 + 4);
    t25 = (t16 + 4);
    t31 = (t41 + 4);
    t45 = *((unsigned int *)t15);
    t46 = *((unsigned int *)t25);
    t47 = (t45 | t46);
    *((unsigned int *)t31) = t47;
    t48 = *((unsigned int *)t31);
    t49 = (t48 != 0);
    if (t49 == 1)
        goto LAB18;

LAB19:
LAB20:    t69 = (t41 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t41);
    t73 = (t72 & t71);
    t74 = (t73 != 0);
    if (t74 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(78, ng19);
    t2 = (t0 + 8056U);
    t3 = *((char **)t2);
    t2 = (t0 + 8216U);
    t5 = *((char **)t2);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t5);
    t11 = (t9 & t10);
    *((unsigned int *)t4) = t11;
    t2 = (t3 + 4);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t2);
    t13 = *((unsigned int *)t6);
    t17 = (t12 | t13);
    *((unsigned int *)t7) = t17;
    t18 = *((unsigned int *)t7);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB93;

LAB94:
LAB95:    t15 = (t4 + 4);
    t42 = *((unsigned int *)t15);
    t43 = (~(t42));
    t44 = *((unsigned int *)t4);
    t45 = (t44 & t43);
    t46 = (t45 != 0);
    if (t46 > 0)
        goto LAB96;

LAB97:
LAB98:
LAB23:
LAB13:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB10:    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t16);
    *((unsigned int *)t4) = (t19 | t20);
    t21 = *((unsigned int *)t15);
    t22 = *((unsigned int *)t16);
    *((unsigned int *)t15) = (t21 | t22);
    goto LAB9;

LAB11:    xsi_set_current_line(58, ng19);

LAB14:    xsi_set_current_line(59, ng19);
    t31 = ((char*)((ng1)));
    t32 = (t0 + 14536);
    xsi_vlogvar_wait_assign_value(t32, t31, 0, 0, 12, 0LL);
    xsi_set_current_line(60, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 15176);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(61, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 14696);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(62, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 15336);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(63, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 14856);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(64, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 15496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(65, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 15016);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(66, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 15656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB13;

LAB15:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t7);
    *((unsigned int *)t4) = (t20 | t21);
    t8 = (t3 + 4);
    t14 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t8);
    t26 = (~(t24));
    t27 = *((unsigned int *)t5);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (~(t29));
    t33 = (t23 & t26);
    t34 = (t28 & t30);
    t35 = (~(t33));
    t36 = (~(t34));
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t35);
    t38 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t38 & t36);
    t39 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t39 & t35);
    t40 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t40 & t36);
    goto LAB17;

LAB18:    t50 = *((unsigned int *)t41);
    t51 = *((unsigned int *)t31);
    *((unsigned int *)t41) = (t50 | t51);
    t32 = (t4 + 4);
    t52 = (t16 + 4);
    t53 = *((unsigned int *)t4);
    t54 = (~(t53));
    t55 = *((unsigned int *)t32);
    t56 = (~(t55));
    t57 = *((unsigned int *)t16);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (~(t59));
    t61 = (t54 & t56);
    t62 = (t58 & t60);
    t63 = (~(t61));
    t64 = (~(t62));
    t65 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t65 & t63);
    t66 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t66 & t64);
    t67 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t67 & t63);
    t68 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t68 & t64);
    goto LAB20;

LAB21:    xsi_set_current_line(68, ng19);

LAB24:    xsi_set_current_line(69, ng19);
    t75 = ((char*)((ng1)));
    t76 = (t0 + 14536);
    xsi_vlogvar_wait_assign_value(t76, t75, 0, 0, 12, 0LL);
    xsi_set_current_line(70, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng14)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB28;

LAB25:    if (t21 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t77) = 1;

LAB28:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t15) != 0)
        goto LAB31;

LAB32:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB33;

LAB34:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t25) > 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t41) > 0)
        goto LAB39;

LAB40:    memcpy(t4, t80, 8);

LAB41:    t81 = (t0 + 15176);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(71, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 14696);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(72, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng21)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB45;

LAB42:    if (t21 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t77) = 1;

LAB45:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t15) != 0)
        goto LAB48;

LAB49:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB50;

LAB51:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t25) > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t41) > 0)
        goto LAB56;

LAB57:    memcpy(t4, t80, 8);

LAB58:    t81 = (t0 + 15336);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(73, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 14856);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(74, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng22)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB62;

LAB59:    if (t21 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t77) = 1;

LAB62:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t15) != 0)
        goto LAB65;

LAB66:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB67;

LAB68:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB69;

LAB70:    if (*((unsigned int *)t25) > 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t41) > 0)
        goto LAB73;

LAB74:    memcpy(t4, t80, 8);

LAB75:    t81 = (t0 + 15496);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(75, ng19);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 15016);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(76, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng23)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB79;

LAB76:    if (t21 != 0)
        goto LAB78;

LAB77:    *((unsigned int *)t77) = 1;

LAB79:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t15) != 0)
        goto LAB82;

LAB83:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB84;

LAB85:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB86;

LAB87:    if (*((unsigned int *)t25) > 0)
        goto LAB88;

LAB89:    if (*((unsigned int *)t41) > 0)
        goto LAB90;

LAB91:    memcpy(t4, t80, 8);

LAB92:    t81 = (t0 + 15656);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 8, 0LL);
    goto LAB23;

LAB27:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB28;

LAB29:    *((unsigned int *)t41) = 1;
    goto LAB32;

LAB31:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB32;

LAB33:    t31 = (t0 + 15176);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 8, t69, 32);
    goto LAB34;

LAB35:    t75 = (t0 + 15176);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB36;

LAB37:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB41;

LAB39:    memcpy(t4, t78, 8);
    goto LAB41;

LAB44:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB45;

LAB46:    *((unsigned int *)t41) = 1;
    goto LAB49;

LAB48:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB49;

LAB50:    t31 = (t0 + 15336);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 8, t69, 32);
    goto LAB51;

LAB52:    t75 = (t0 + 15336);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB53;

LAB54:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB58;

LAB56:    memcpy(t4, t78, 8);
    goto LAB58;

LAB61:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB62;

LAB63:    *((unsigned int *)t41) = 1;
    goto LAB66;

LAB65:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB66;

LAB67:    t31 = (t0 + 15496);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 8, t69, 32);
    goto LAB68;

LAB69:    t75 = (t0 + 15496);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB70;

LAB71:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB75;

LAB73:    memcpy(t4, t78, 8);
    goto LAB75;

LAB78:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB79;

LAB80:    *((unsigned int *)t41) = 1;
    goto LAB83;

LAB82:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB83;

LAB84:    t31 = (t0 + 15656);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 8, t69, 32);
    goto LAB85;

LAB86:    t75 = (t0 + 15656);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB87;

LAB88:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB92;

LAB90:    memcpy(t4, t78, 8);
    goto LAB92;

LAB93:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t7);
    *((unsigned int *)t4) = (t20 | t21);
    t8 = (t3 + 4);
    t14 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t8);
    t26 = (~(t24));
    t27 = *((unsigned int *)t5);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (~(t29));
    t33 = (t23 & t26);
    t34 = (t28 & t30);
    t35 = (~(t33));
    t36 = (~(t34));
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t35);
    t38 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t38 & t36);
    t39 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t39 & t35);
    t40 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t40 & t36);
    goto LAB95;

LAB96:    xsi_set_current_line(78, ng19);

LAB99:    xsi_set_current_line(79, ng19);
    t16 = (t0 + 15816);
    t25 = (t16 + 56U);
    t31 = *((char **)t25);
    t32 = ((char*)((ng14)));
    memset(t78, 0, 8);
    t52 = (t31 + 4);
    t69 = (t32 + 4);
    t47 = *((unsigned int *)t31);
    t48 = *((unsigned int *)t32);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t52);
    t51 = *((unsigned int *)t69);
    t53 = (t50 ^ t51);
    t54 = (t49 | t53);
    t55 = *((unsigned int *)t52);
    t56 = *((unsigned int *)t69);
    t57 = (t55 | t56);
    t58 = (~(t57));
    t59 = (t54 & t58);
    if (t59 != 0)
        goto LAB103;

LAB100:    if (t57 != 0)
        goto LAB102;

LAB101:    *((unsigned int *)t78) = 1;

LAB103:    memset(t77, 0, 8);
    t76 = (t78 + 4);
    t60 = *((unsigned int *)t76);
    t63 = (~(t60));
    t64 = *((unsigned int *)t78);
    t65 = (t64 & t63);
    t66 = (t65 & 1U);
    if (t66 != 0)
        goto LAB104;

LAB105:    if (*((unsigned int *)t76) != 0)
        goto LAB106;

LAB107:    t81 = (t77 + 4);
    t67 = *((unsigned int *)t77);
    t68 = *((unsigned int *)t81);
    t70 = (t67 || t68);
    if (t70 > 0)
        goto LAB108;

LAB109:    t71 = *((unsigned int *)t77);
    t72 = (~(t71));
    t73 = *((unsigned int *)t81);
    t74 = (t72 || t73);
    if (t74 > 0)
        goto LAB110;

LAB111:    if (*((unsigned int *)t81) > 0)
        goto LAB112;

LAB113:    if (*((unsigned int *)t77) > 0)
        goto LAB114;

LAB115:    memcpy(t41, t89, 8);

LAB116:    t90 = (t0 + 14536);
    xsi_vlogvar_wait_assign_value(t90, t41, 0, 0, 12, 0LL);
    xsi_set_current_line(80, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng21)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB120;

LAB117:    if (t21 != 0)
        goto LAB119;

LAB118:    *((unsigned int *)t77) = 1;

LAB120:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB121;

LAB122:    if (*((unsigned int *)t15) != 0)
        goto LAB123;

LAB124:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB125;

LAB126:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB127;

LAB128:    if (*((unsigned int *)t25) > 0)
        goto LAB129;

LAB130:    if (*((unsigned int *)t41) > 0)
        goto LAB131;

LAB132:    memcpy(t4, t80, 8);

LAB133:    t81 = (t0 + 14696);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 12, 0LL);
    xsi_set_current_line(81, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng22)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB137;

LAB134:    if (t21 != 0)
        goto LAB136;

LAB135:    *((unsigned int *)t77) = 1;

LAB137:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB138;

LAB139:    if (*((unsigned int *)t15) != 0)
        goto LAB140;

LAB141:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB142;

LAB143:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB144;

LAB145:    if (*((unsigned int *)t25) > 0)
        goto LAB146;

LAB147:    if (*((unsigned int *)t41) > 0)
        goto LAB148;

LAB149:    memcpy(t4, t80, 8);

LAB150:    t81 = (t0 + 14856);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 12, 0LL);
    xsi_set_current_line(82, ng19);
    t2 = (t0 + 15816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng23)));
    memset(t77, 0, 8);
    t7 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t17 = (t12 ^ t13);
    t18 = (t11 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB154;

LAB151:    if (t21 != 0)
        goto LAB153;

LAB152:    *((unsigned int *)t77) = 1;

LAB154:    memset(t41, 0, 8);
    t15 = (t77 + 4);
    t24 = *((unsigned int *)t15);
    t26 = (~(t24));
    t27 = *((unsigned int *)t77);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB155;

LAB156:    if (*((unsigned int *)t15) != 0)
        goto LAB157;

LAB158:    t25 = (t41 + 4);
    t30 = *((unsigned int *)t41);
    t35 = *((unsigned int *)t25);
    t36 = (t30 || t35);
    if (t36 > 0)
        goto LAB159;

LAB160:    t37 = *((unsigned int *)t41);
    t38 = (~(t37));
    t39 = *((unsigned int *)t25);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB161;

LAB162:    if (*((unsigned int *)t25) > 0)
        goto LAB163;

LAB164:    if (*((unsigned int *)t41) > 0)
        goto LAB165;

LAB166:    memcpy(t4, t80, 8);

LAB167:    t81 = (t0 + 15016);
    xsi_vlogvar_wait_assign_value(t81, t4, 0, 0, 12, 0LL);
    goto LAB98;

LAB102:    t75 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB103;

LAB104:    *((unsigned int *)t77) = 1;
    goto LAB107;

LAB106:    t79 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t79) = 1;
    goto LAB107;

LAB108:    t82 = (t0 + 14536);
    t83 = (t82 + 56U);
    t84 = *((char **)t83);
    t85 = ((char*)((ng7)));
    memset(t80, 0, 8);
    xsi_vlog_unsigned_add(t80, 32, t84, 12, t85, 32);
    goto LAB109;

LAB110:    t86 = (t0 + 14536);
    t87 = (t86 + 56U);
    t88 = *((char **)t87);
    memcpy(t89, t88, 8);
    goto LAB111;

LAB112:    xsi_vlog_unsigned_bit_combine(t41, 32, t80, 32, t89, 32);
    goto LAB116;

LAB114:    memcpy(t41, t80, 8);
    goto LAB116;

LAB119:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB120;

LAB121:    *((unsigned int *)t41) = 1;
    goto LAB124;

LAB123:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB124;

LAB125:    t31 = (t0 + 14696);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 12, t69, 32);
    goto LAB126;

LAB127:    t75 = (t0 + 14696);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB128;

LAB129:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB133;

LAB131:    memcpy(t4, t78, 8);
    goto LAB133;

LAB136:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB137;

LAB138:    *((unsigned int *)t41) = 1;
    goto LAB141;

LAB140:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB141;

LAB142:    t31 = (t0 + 14856);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 12, t69, 32);
    goto LAB143;

LAB144:    t75 = (t0 + 14856);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB145;

LAB146:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB150;

LAB148:    memcpy(t4, t78, 8);
    goto LAB150;

LAB153:    t14 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB154;

LAB155:    *((unsigned int *)t41) = 1;
    goto LAB158;

LAB157:    t16 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB158;

LAB159:    t31 = (t0 + 15016);
    t32 = (t31 + 56U);
    t52 = *((char **)t32);
    t69 = ((char*)((ng7)));
    memset(t78, 0, 8);
    xsi_vlog_unsigned_add(t78, 32, t52, 12, t69, 32);
    goto LAB160;

LAB161:    t75 = (t0 + 15016);
    t76 = (t75 + 56U);
    t79 = *((char **)t76);
    memcpy(t80, t79, 8);
    goto LAB162;

LAB163:    xsi_vlog_unsigned_bit_combine(t4, 32, t78, 32, t80, 32);
    goto LAB167;

LAB165:    memcpy(t4, t78, 8);
    goto LAB167;

}

static void Always_85_44(char *t0)
{
    char t7[8];
    char t42[8];
    char t58[8];
    char t99[64];
    char t106[8];
    char t115[64];
    char t122[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    double t121;

LAB0:    t1 = (t0 + 34040U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng19);
    t2 = (t0 + 35912);
    *((int *)t2) = 1;
    t3 = (t0 + 34072);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(86, ng19);
    t4 = (t0 + 8056U);
    t5 = *((char **)t4);
    t4 = (t0 + 8216U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB5;

LAB6:
LAB7:    t38 = (t0 + 15816);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng14)));
    memset(t42, 0, 8);
    t43 = (t40 + 4);
    t44 = (t41 + 4);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t41);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB11;

LAB8:    if (t54 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t42) = 1;

LAB11:    t59 = *((unsigned int *)t7);
    t60 = *((unsigned int *)t42);
    t61 = (t59 & t60);
    *((unsigned int *)t58) = t61;
    t62 = (t7 + 4);
    t63 = (t42 + 4);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t62);
    t66 = *((unsigned int *)t63);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = *((unsigned int *)t64);
    t69 = (t68 != 0);
    if (t69 == 1)
        goto LAB12;

LAB13:
LAB14:    t90 = (t58 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t58);
    t94 = (t93 & t92);
    t95 = (t94 != 0);
    if (t95 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB5:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t5);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB7;

LAB10:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB11;

LAB12:    t70 = *((unsigned int *)t58);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t58) = (t70 | t71);
    t72 = (t7 + 4);
    t73 = (t42 + 4);
    t74 = *((unsigned int *)t7);
    t75 = (~(t74));
    t76 = *((unsigned int *)t72);
    t77 = (~(t76));
    t78 = *((unsigned int *)t42);
    t79 = (~(t78));
    t80 = *((unsigned int *)t73);
    t81 = (~(t80));
    t82 = (t75 & t77);
    t83 = (t79 & t81);
    t84 = (~(t82));
    t85 = (~(t83));
    t86 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t86 & t84);
    t87 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t87 & t85);
    t88 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t88 & t84);
    t89 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t89 & t85);
    goto LAB14;

LAB15:    xsi_set_current_line(86, ng19);

LAB18:    xsi_set_current_line(87, ng19);
    t96 = (t0 + 11976);
    t97 = (t96 + 56U);
    t98 = *((char **)t97);
    t100 = (t0 + 11976);
    t101 = (t100 + 72U);
    t102 = *((char **)t101);
    t103 = (t0 + 11976);
    t104 = (t103 + 64U);
    t105 = *((char **)t104);
    t107 = (t0 + 14536);
    t108 = (t107 + 56U);
    t109 = *((char **)t108);
    t110 = (t0 + 15176);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    xsi_vlogtype_concat(t106, 20, 20, 2U, t112, 8, t109, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t98, t102, t105, 2, 1, t106, 20, 2);
    t113 = (t0 + 7576U);
    t114 = *((char **)t113);
    xsi_vlog_unsigned_not_equal(t115, 256, t99, 256, t114, 256);
    t113 = (t115 + 4);
    t116 = *((unsigned int *)t113);
    t117 = (~(t116));
    t118 = *((unsigned int *)t115);
    t119 = (t118 & t117);
    t120 = (t119 != 0);
    if (t120 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(93, ng19);
    t2 = (t0 + 8376U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t13 = (t10 & t9);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB21:    goto LAB17;

LAB19:    xsi_set_current_line(87, ng19);

LAB22:    xsi_set_current_line(88, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t122) = t121;
    xsi_vlogfile_write(1, 0, 0, ng24, 2, t0, (char)114, t122, 64);
    xsi_set_current_line(89, ng19);
    t2 = (t0 + 15176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 14536);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(90, ng19);
    t2 = (t0 + 11976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11976);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 11976);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 14536);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15176);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng26, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(91, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB21;

LAB23:    xsi_set_current_line(93, ng19);

LAB26:    xsi_set_current_line(94, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t7) = t121;
    xsi_vlogfile_write(1, 0, 0, ng28, 2, t0, (char)114, t7, 64);
    xsi_set_current_line(95, ng19);
    t2 = (t0 + 15176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 14536);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(96, ng19);
    t2 = (t0 + 11976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11976);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 11976);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 14536);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15176);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng26, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(97, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB25;

}

static void Always_101_45(char *t0)
{
    char t7[8];
    char t42[8];
    char t58[8];
    char t99[64];
    char t106[8];
    char t115[64];
    char t122[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    double t121;

LAB0:    t1 = (t0 + 34288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng19);
    t2 = (t0 + 35928);
    *((int *)t2) = 1;
    t3 = (t0 + 34320);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(102, ng19);
    t4 = (t0 + 8056U);
    t5 = *((char **)t4);
    t4 = (t0 + 8216U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB5;

LAB6:
LAB7:    t38 = (t0 + 15816);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng21)));
    memset(t42, 0, 8);
    t43 = (t40 + 4);
    t44 = (t41 + 4);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t41);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB11;

LAB8:    if (t54 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t42) = 1;

LAB11:    t59 = *((unsigned int *)t7);
    t60 = *((unsigned int *)t42);
    t61 = (t59 & t60);
    *((unsigned int *)t58) = t61;
    t62 = (t7 + 4);
    t63 = (t42 + 4);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t62);
    t66 = *((unsigned int *)t63);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = *((unsigned int *)t64);
    t69 = (t68 != 0);
    if (t69 == 1)
        goto LAB12;

LAB13:
LAB14:    t90 = (t58 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t58);
    t94 = (t93 & t92);
    t95 = (t94 != 0);
    if (t95 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB5:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t5);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB7;

LAB10:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB11;

LAB12:    t70 = *((unsigned int *)t58);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t58) = (t70 | t71);
    t72 = (t7 + 4);
    t73 = (t42 + 4);
    t74 = *((unsigned int *)t7);
    t75 = (~(t74));
    t76 = *((unsigned int *)t72);
    t77 = (~(t76));
    t78 = *((unsigned int *)t42);
    t79 = (~(t78));
    t80 = *((unsigned int *)t73);
    t81 = (~(t80));
    t82 = (t75 & t77);
    t83 = (t79 & t81);
    t84 = (~(t82));
    t85 = (~(t83));
    t86 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t86 & t84);
    t87 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t87 & t85);
    t88 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t88 & t84);
    t89 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t89 & t85);
    goto LAB14;

LAB15:    xsi_set_current_line(102, ng19);

LAB18:    xsi_set_current_line(103, ng19);
    t96 = (t0 + 12136);
    t97 = (t96 + 56U);
    t98 = *((char **)t97);
    t100 = (t0 + 12136);
    t101 = (t100 + 72U);
    t102 = *((char **)t101);
    t103 = (t0 + 12136);
    t104 = (t103 + 64U);
    t105 = *((char **)t104);
    t107 = (t0 + 14696);
    t108 = (t107 + 56U);
    t109 = *((char **)t108);
    t110 = (t0 + 15336);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    xsi_vlogtype_concat(t106, 20, 20, 2U, t112, 8, t109, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t98, t102, t105, 2, 1, t106, 20, 2);
    t113 = (t0 + 7576U);
    t114 = *((char **)t113);
    xsi_vlog_unsigned_not_equal(t115, 256, t99, 256, t114, 256);
    t113 = (t115 + 4);
    t116 = *((unsigned int *)t113);
    t117 = (~(t116));
    t118 = *((unsigned int *)t115);
    t119 = (t118 & t117);
    t120 = (t119 != 0);
    if (t120 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(109, ng19);
    t2 = (t0 + 8376U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t13 = (t10 & t9);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB21:    goto LAB17;

LAB19:    xsi_set_current_line(103, ng19);

LAB22:    xsi_set_current_line(104, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t122) = t121;
    xsi_vlogfile_write(1, 0, 0, ng29, 2, t0, (char)114, t122, 64);
    xsi_set_current_line(105, ng19);
    t2 = (t0 + 15336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 14696);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(106, ng19);
    t2 = (t0 + 12136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 12136);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 12136);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 14696);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15336);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng30, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(107, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB21;

LAB23:    xsi_set_current_line(109, ng19);

LAB26:    xsi_set_current_line(110, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t7) = t121;
    xsi_vlogfile_write(1, 0, 0, ng31, 2, t0, (char)114, t7, 64);
    xsi_set_current_line(111, ng19);
    t2 = (t0 + 15336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 14696);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(112, ng19);
    t2 = (t0 + 12136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 12136);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 12136);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 14696);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15336);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng30, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(113, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB25;

}

static void Always_117_46(char *t0)
{
    char t7[8];
    char t42[8];
    char t58[8];
    char t99[64];
    char t106[8];
    char t115[64];
    char t122[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    double t121;

LAB0:    t1 = (t0 + 34536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(117, ng19);
    t2 = (t0 + 35944);
    *((int *)t2) = 1;
    t3 = (t0 + 34568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(118, ng19);
    t4 = (t0 + 8056U);
    t5 = *((char **)t4);
    t4 = (t0 + 8216U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB5;

LAB6:
LAB7:    t38 = (t0 + 15816);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng22)));
    memset(t42, 0, 8);
    t43 = (t40 + 4);
    t44 = (t41 + 4);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t41);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB11;

LAB8:    if (t54 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t42) = 1;

LAB11:    t59 = *((unsigned int *)t7);
    t60 = *((unsigned int *)t42);
    t61 = (t59 & t60);
    *((unsigned int *)t58) = t61;
    t62 = (t7 + 4);
    t63 = (t42 + 4);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t62);
    t66 = *((unsigned int *)t63);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = *((unsigned int *)t64);
    t69 = (t68 != 0);
    if (t69 == 1)
        goto LAB12;

LAB13:
LAB14:    t90 = (t58 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t58);
    t94 = (t93 & t92);
    t95 = (t94 != 0);
    if (t95 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB5:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t5);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB7;

LAB10:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB11;

LAB12:    t70 = *((unsigned int *)t58);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t58) = (t70 | t71);
    t72 = (t7 + 4);
    t73 = (t42 + 4);
    t74 = *((unsigned int *)t7);
    t75 = (~(t74));
    t76 = *((unsigned int *)t72);
    t77 = (~(t76));
    t78 = *((unsigned int *)t42);
    t79 = (~(t78));
    t80 = *((unsigned int *)t73);
    t81 = (~(t80));
    t82 = (t75 & t77);
    t83 = (t79 & t81);
    t84 = (~(t82));
    t85 = (~(t83));
    t86 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t86 & t84);
    t87 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t87 & t85);
    t88 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t88 & t84);
    t89 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t89 & t85);
    goto LAB14;

LAB15:    xsi_set_current_line(118, ng19);

LAB18:    xsi_set_current_line(119, ng19);
    t96 = (t0 + 12296);
    t97 = (t96 + 56U);
    t98 = *((char **)t97);
    t100 = (t0 + 12296);
    t101 = (t100 + 72U);
    t102 = *((char **)t101);
    t103 = (t0 + 12296);
    t104 = (t103 + 64U);
    t105 = *((char **)t104);
    t107 = (t0 + 14856);
    t108 = (t107 + 56U);
    t109 = *((char **)t108);
    t110 = (t0 + 15496);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    xsi_vlogtype_concat(t106, 20, 20, 2U, t112, 8, t109, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t98, t102, t105, 2, 1, t106, 20, 2);
    t113 = (t0 + 7576U);
    t114 = *((char **)t113);
    xsi_vlog_unsigned_not_equal(t115, 256, t99, 256, t114, 256);
    t113 = (t115 + 4);
    t116 = *((unsigned int *)t113);
    t117 = (~(t116));
    t118 = *((unsigned int *)t115);
    t119 = (t118 & t117);
    t120 = (t119 != 0);
    if (t120 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(125, ng19);
    t2 = (t0 + 8376U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t13 = (t10 & t9);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB21:    goto LAB17;

LAB19:    xsi_set_current_line(119, ng19);

LAB22:    xsi_set_current_line(120, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t122) = t121;
    xsi_vlogfile_write(1, 0, 0, ng32, 2, t0, (char)114, t122, 64);
    xsi_set_current_line(121, ng19);
    t2 = (t0 + 15496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 14856);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(122, ng19);
    t2 = (t0 + 12296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 12296);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 12296);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 14856);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15496);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng33, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(123, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB21;

LAB23:    xsi_set_current_line(125, ng19);

LAB26:    xsi_set_current_line(126, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t7) = t121;
    xsi_vlogfile_write(1, 0, 0, ng34, 2, t0, (char)114, t7, 64);
    xsi_set_current_line(127, ng19);
    t2 = (t0 + 15496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 14856);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(128, ng19);
    t2 = (t0 + 12296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 12296);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 12296);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 14856);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15496);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng33, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(129, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB25;

}

static void Always_133_47(char *t0)
{
    char t7[8];
    char t42[8];
    char t58[8];
    char t99[64];
    char t106[8];
    char t115[64];
    char t122[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    double t121;

LAB0:    t1 = (t0 + 34784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(133, ng19);
    t2 = (t0 + 35960);
    *((int *)t2) = 1;
    t3 = (t0 + 34816);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(134, ng19);
    t4 = (t0 + 8056U);
    t5 = *((char **)t4);
    t4 = (t0 + 8216U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB5;

LAB6:
LAB7:    t38 = (t0 + 15816);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng23)));
    memset(t42, 0, 8);
    t43 = (t40 + 4);
    t44 = (t41 + 4);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t41);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB11;

LAB8:    if (t54 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t42) = 1;

LAB11:    t59 = *((unsigned int *)t7);
    t60 = *((unsigned int *)t42);
    t61 = (t59 & t60);
    *((unsigned int *)t58) = t61;
    t62 = (t7 + 4);
    t63 = (t42 + 4);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t62);
    t66 = *((unsigned int *)t63);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = *((unsigned int *)t64);
    t69 = (t68 != 0);
    if (t69 == 1)
        goto LAB12;

LAB13:
LAB14:    t90 = (t58 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t58);
    t94 = (t93 & t92);
    t95 = (t94 != 0);
    if (t95 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB5:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t5);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB7;

LAB10:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB11;

LAB12:    t70 = *((unsigned int *)t58);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t58) = (t70 | t71);
    t72 = (t7 + 4);
    t73 = (t42 + 4);
    t74 = *((unsigned int *)t7);
    t75 = (~(t74));
    t76 = *((unsigned int *)t72);
    t77 = (~(t76));
    t78 = *((unsigned int *)t42);
    t79 = (~(t78));
    t80 = *((unsigned int *)t73);
    t81 = (~(t80));
    t82 = (t75 & t77);
    t83 = (t79 & t81);
    t84 = (~(t82));
    t85 = (~(t83));
    t86 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t86 & t84);
    t87 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t87 & t85);
    t88 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t88 & t84);
    t89 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t89 & t85);
    goto LAB14;

LAB15:    xsi_set_current_line(134, ng19);

LAB18:    xsi_set_current_line(135, ng19);
    t96 = (t0 + 12456);
    t97 = (t96 + 56U);
    t98 = *((char **)t97);
    t100 = (t0 + 12456);
    t101 = (t100 + 72U);
    t102 = *((char **)t101);
    t103 = (t0 + 12456);
    t104 = (t103 + 64U);
    t105 = *((char **)t104);
    t107 = (t0 + 15016);
    t108 = (t107 + 56U);
    t109 = *((char **)t108);
    t110 = (t0 + 15656);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    xsi_vlogtype_concat(t106, 20, 20, 2U, t112, 8, t109, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t98, t102, t105, 2, 1, t106, 20, 2);
    t113 = (t0 + 7576U);
    t114 = *((char **)t113);
    xsi_vlog_unsigned_not_equal(t115, 256, t99, 256, t114, 256);
    t113 = (t115 + 4);
    t116 = *((unsigned int *)t113);
    t117 = (~(t116));
    t118 = *((unsigned int *)t115);
    t119 = (t118 & t117);
    t120 = (t119 != 0);
    if (t120 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(141, ng19);
    t2 = (t0 + 8376U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t13 = (t10 & t9);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB21:    goto LAB17;

LAB19:    xsi_set_current_line(135, ng19);

LAB22:    xsi_set_current_line(136, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t122) = t121;
    xsi_vlogfile_write(1, 0, 0, ng35, 2, t0, (char)114, t122, 64);
    xsi_set_current_line(137, ng19);
    t2 = (t0 + 15656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 15016);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(138, ng19);
    t2 = (t0 + 12456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 12456);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 12456);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 15016);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15656);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng36, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(139, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB21;

LAB23:    xsi_set_current_line(141, ng19);

LAB26:    xsi_set_current_line(142, ng19);
    t121 = xsi_vlog_realtime(10000.000000000000, 1000.0000000000000);
    *((double *)t7) = t121;
    xsi_vlogfile_write(1, 0, 0, ng37, 2, t0, (char)114, t7, 64);
    xsi_set_current_line(143, ng19);
    t2 = (t0 + 15656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 15016);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 8, (char)118, t11, 12);
    xsi_set_current_line(144, ng19);
    t2 = (t0 + 12456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 12456);
    t6 = (t5 + 72U);
    t11 = *((char **)t6);
    t12 = (t0 + 12456);
    t20 = (t12 + 64U);
    t21 = *((char **)t20);
    t38 = (t0 + 15016);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 15656);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t7, 20, 20, 2U, t44, 8, t40, 12);
    xsi_vlog_generic_get_array_select_value(t99, 256, t4, t11, t21, 2, 1, t7, 20, 2);
    xsi_vlogfile_write(1, 0, 0, ng36, 2, t0, (char)118, t99, 256);
    xsi_set_current_line(145, ng19);
    t2 = (t0 + 7576U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng27, 2, t0, (char)118, t3, 256);
    goto LAB25;

}

static void Initial_151_48(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    t1 = (t0 + 35032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(151, ng13);

LAB4:    xsi_set_current_line(152, ng13);
    t2 = (t0 + 34840);
    xsi_process_wait(t2, 1000000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(153, ng13);
    t2 = ((char*)((ng38)));
    t3 = ((char*)((ng14)));
    t4 = (t0 + 34840);
    t5 = (t0 + 848);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 15976);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 512);
    t8 = (t0 + 16136);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 8);

LAB8:    t9 = (t0 + 34936);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB10:    if (t17 != 0)
        goto LAB11;

LAB6:    t10 = (t0 + 848);
    xsi_vlog_subprogram_popinvocation(t10);

LAB7:    t18 = (t0 + 34936);
    t19 = *((char **)t18);
    t18 = (t0 + 848);
    t20 = (t0 + 34840);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(154, ng13);
    t2 = ((char*)((ng39)));
    t3 = ((char*)((ng21)));
    t4 = (t0 + 34840);
    t5 = (t0 + 1280);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 17576);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 512);
    t8 = (t0 + 17736);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 8);

LAB14:    t9 = (t0 + 34936);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB16:    if (t17 != 0)
        goto LAB17;

LAB12:    t10 = (t0 + 1280);
    xsi_vlog_subprogram_popinvocation(t10);

LAB13:    t18 = (t0 + 34936);
    t19 = *((char **)t18);
    t18 = (t0 + 1280);
    t20 = (t0 + 34840);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(155, ng13);
    t2 = ((char*)((ng40)));
    t3 = ((char*)((ng22)));
    t4 = (t0 + 34840);
    t5 = (t0 + 1712);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 19176);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 512);
    t8 = (t0 + 19336);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 8);

LAB20:    t9 = (t0 + 34936);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB22:    if (t17 != 0)
        goto LAB23;

LAB18:    t10 = (t0 + 1712);
    xsi_vlog_subprogram_popinvocation(t10);

LAB19:    t18 = (t0 + 34936);
    t19 = *((char **)t18);
    t18 = (t0 + 1712);
    t20 = (t0 + 34840);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(156, ng13);
    t2 = ((char*)((ng41)));
    t3 = ((char*)((ng23)));
    t4 = (t0 + 34840);
    t5 = (t0 + 2144);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 20776);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 512);
    t8 = (t0 + 20936);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 8);

LAB26:    t9 = (t0 + 34936);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB28:    if (t17 != 0)
        goto LAB29;

LAB24:    t10 = (t0 + 2144);
    xsi_vlog_subprogram_popinvocation(t10);

LAB25:    t18 = (t0 + 34936);
    t19 = *((char **)t18);
    t18 = (t0 + 2144);
    t20 = (t0 + 34840);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    goto LAB1;

LAB9:;
LAB11:    t9 = (t0 + 35032U);
    *((char **)t9) = &&LAB8;
    goto LAB1;

LAB15:;
LAB17:    t9 = (t0 + 35032U);
    *((char **)t9) = &&LAB14;
    goto LAB1;

LAB21:;
LAB23:    t9 = (t0 + 35032U);
    *((char **)t9) = &&LAB20;
    goto LAB1;

LAB27:;
LAB29:    t9 = (t0 + 35032U);
    *((char **)t9) = &&LAB26;
    goto LAB1;

}


extern void work_m_13508571236155713864_2585718698_init()
{
	static char *pe[] = {(void *)Initial_109_0,(void *)Always_132_1,(void *)Always_133_2,(void *)Always_134_3,(void *)Always_135_4,(void *)Always_136_5,(void *)Always_137_6,(void *)Always_138_7,(void *)Always_139_8,(void *)Always_140_9,(void *)NetDecl_52_10,(void *)NetDecl_54_11,(void *)NetDecl_55_12,(void *)NetDecl_56_13,(void *)NetDecl_57_14,(void *)NetDecl_58_15,(void *)NetDecl_59_16,(void *)NetDecl_64_17,(void *)NetDecl_65_18,(void *)NetDecl_66_19,(void *)NetDecl_67_20,(void *)NetDecl_68_21,(void *)NetDecl_69_22,(void *)NetDecl_74_23,(void *)NetDecl_75_24,(void *)NetDecl_76_25,(void *)NetDecl_77_26,(void *)NetDecl_78_27,(void *)NetDecl_79_28,(void *)NetDecl_84_29,(void *)NetDecl_85_30,(void *)NetDecl_86_31,(void *)NetDecl_87_32,(void *)NetDecl_88_33,(void *)NetDecl_89_34,(void *)NetDecl_41_35,(void *)NetDecl_43_36,(void *)NetDecl_44_37,(void *)NetDecl_45_38,(void *)NetDecl_46_39,(void *)NetDecl_47_40,(void *)NetDecl_48_41,(void *)Always_54_42,(void *)Always_57_43,(void *)Always_85_44,(void *)Always_101_45,(void *)Always_117_46,(void *)Always_133_47,(void *)Initial_151_48};
	static char *se[] = {(void *)sp_nf10g_0_stim_packet_dump,(void *)sp_nf10g_1_stim_packet_dump,(void *)sp_nf10g_2_stim_packet_dump,(void *)sp_nf10g_3_stim_packet_dump};
	xsi_register_didat("work_m_13508571236155713864_2585718698", "isim/isim_system_axisim.sim/work/m_13508571236155713864_2585718698.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
