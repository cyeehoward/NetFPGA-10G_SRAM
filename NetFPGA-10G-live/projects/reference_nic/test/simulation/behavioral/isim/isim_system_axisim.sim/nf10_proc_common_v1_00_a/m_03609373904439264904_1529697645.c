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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/std/pcores/nf10_proc_common_v1_00_a/hdl/verilog/ipif_regs.v";
static int ng1[] = {0, 0};
static int ng2[] = {2, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {1U, 0U};



static int sp_log2(char *t1, char *t2)
{
    char t7[8];
    char t11[8];
    char t22[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;

LAB0:    t0 = 1;
    xsi_set_current_line(83, ng0);

LAB2:    xsi_set_current_line(84, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t1 + 5528);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(85, ng0);

LAB3:    t3 = ((char*)((ng2)));
    t4 = (t1 + 5528);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_signed_power(t7, 32, t3, 32, t6, 32, 1);
    t8 = (t1 + 5688);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    xsi_vlog_signed_less(t11, 32, t7, 32, t10, 32);
    t12 = (t11 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t11);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB4;

LAB5:    t0 = 0;

LAB1:    return t0;
LAB4:    xsi_set_current_line(85, ng0);

LAB6:    xsi_set_current_line(86, ng0);
    t18 = (t1 + 5528);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng3)));
    memset(t22, 0, 8);
    xsi_vlog_signed_add(t22, 32, t20, 32, t21, 32);
    t23 = (t1 + 5528);
    xsi_vlogvar_assign_value(t23, t22, 0, 0, 32);
    goto LAB3;

}

static void Cont_113_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 6600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 5368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 5368);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 5368);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t0 + 9096);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t13, 0, 31);
    t18 = (t0 + 8904);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_114_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 6848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 5368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 5368);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 5368);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t0 + 9160);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t13, 128, 159);
    t18 = (t0 + 8920);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_120_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 7096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4168U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 4294967295U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 4294967295U);
    t12 = (t0 + 9224);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t3, 8);
    xsi_driver_vfirst_trans(t12, 96, 127);
    t17 = (t0 + 8936);
    *((int *)t17) = 1;

LAB1:    return;
}

static void Cont_120_3(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 7344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4168U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 8);
    t6 = (t4 + 12);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t3) = t8;
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t11 & 4294967295U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 4294967295U);
    t13 = (t0 + 9288);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t3, 8);
    xsi_driver_vfirst_trans(t13, 64, 95);
    t18 = (t0 + 8952);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_120_4(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 7592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4168U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 16);
    t6 = (t4 + 20);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t3) = t8;
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t11 & 4294967295U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 4294967295U);
    t13 = (t0 + 9352);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t3, 8);
    xsi_driver_vfirst_trans(t13, 32, 63);
    t18 = (t0 + 8968);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_120_5(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 7840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4168U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 24);
    t6 = (t4 + 28);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t3) = t8;
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t11 & 4294967295U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 4294967295U);
    t13 = (t0 + 9416);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t3, 8);
    xsi_driver_vfirst_trans(t13, 0, 31);
    t18 = (t0 + 8984);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_126_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 8088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 9480);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Always_129_7(char *t0)
{
    char t4[8];
    char t31[8];
    char t32[8];
    char t33[8];
    char t72[8];
    char t81[8];
    char t92[8];
    char t93[8];
    char t96[8];
    char t104[8];
    char t142[8];
    char t143[8];
    char t150[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    int t42;
    char *t43;
    int t44;
    int t45;
    int t46;
    int t47;
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
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    char *t94;
    char *t95;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    char *t140;
    char *t141;
    char *t144;
    char *t145;
    char *t146;
    char *t147;
    char *t148;
    char *t149;
    char *t151;
    char *t152;
    char *t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    unsigned int t161;
    char *t162;
    unsigned int t163;
    int t164;
    int t165;
    unsigned int t166;
    unsigned int t167;
    int t168;
    int t169;

LAB0:    t1 = (t0 + 8336U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 9000);
    *((int *)t2) = 1;
    t3 = (t0 + 8368);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(129, ng0);

LAB5:    xsi_set_current_line(130, ng0);
    t5 = (t0 + 2728U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t4 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(136, ng0);

LAB21:    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t2) != 0)
        goto LAB24;

LAB25:    t6 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t6);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB26;

LAB27:    memcpy(t33, t4, 8);

LAB28:    memset(t72, 0, 8);
    t38 = (t33 + 4);
    t73 = *((unsigned int *)t38);
    t74 = (~(t73));
    t75 = *((unsigned int *)t33);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t38) != 0)
        goto LAB42;

LAB43:    t40 = (t72 + 4);
    t78 = *((unsigned int *)t72);
    t79 = *((unsigned int *)t40);
    t80 = (t78 || t79);
    if (t80 > 0)
        goto LAB44;

LAB45:    memcpy(t104, t72, 8);

LAB46:    t134 = (t104 + 4);
    t135 = *((unsigned int *)t134);
    t136 = (~(t135));
    t137 = *((unsigned int *)t104);
    t138 = (t137 & t136);
    t139 = (t138 != 0);
    if (t139 > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t2) != 0)
        goto LAB67;

LAB68:    t6 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t6);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB69;

LAB70:    memcpy(t33, t4, 8);

LAB71:    memset(t72, 0, 8);
    t38 = (t33 + 4);
    t73 = *((unsigned int *)t38);
    t74 = (~(t73));
    t75 = *((unsigned int *)t33);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t38) != 0)
        goto LAB85;

LAB86:    t40 = (t72 + 4);
    t78 = *((unsigned int *)t72);
    t79 = *((unsigned int *)t40);
    t80 = (t78 || t79);
    if (t80 > 0)
        goto LAB87;

LAB88:    memcpy(t104, t72, 8);

LAB89:    t134 = (t104 + 4);
    t135 = *((unsigned int *)t134);
    t136 = (~(t135));
    t137 = *((unsigned int *)t104);
    t138 = (t137 & t136);
    t139 = (t138 != 0);
    if (t139 > 0)
        goto LAB102;

LAB103:
LAB104:
LAB61:
LAB14:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB11:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

LAB12:    xsi_set_current_line(130, ng0);

LAB15:    xsi_set_current_line(131, ng0);
    xsi_set_current_line(131, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 5208);
    xsi_vlogvar_assign_value(t30, t29, 0, 0, 32);

LAB16:    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 744);
    t12 = *((char **)t6);
    t6 = (t0 + 880);
    t13 = *((char **)t6);
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 32, t12, 32, t13, 32);
    memset(t31, 0, 8);
    xsi_vlog_signed_less(t31, 32, t5, 32, t4, 32);
    t6 = (t31 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t31);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB14;

LAB17:    xsi_set_current_line(132, ng0);
    t14 = ((char*)((ng4)));
    t23 = (t0 + 5368);
    t29 = (t0 + 5368);
    t30 = (t29 + 72U);
    t34 = *((char **)t30);
    t35 = (t0 + 5368);
    t36 = (t35 + 64U);
    t37 = *((char **)t36);
    t38 = (t0 + 5208);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    xsi_vlog_generic_convert_array_indices(t32, t33, t34, t37, 2, 1, t40, 32, 1);
    t41 = (t32 + 4);
    t15 = *((unsigned int *)t41);
    t42 = (!(t15));
    t43 = (t33 + 4);
    t16 = *((unsigned int *)t43);
    t44 = (!(t16));
    t45 = (t42 && t44);
    if (t45 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 32, t5, 32, t6, 32);
    t12 = (t0 + 5208);
    xsi_vlogvar_assign_value(t12, t4, 0, 0, 32);
    goto LAB16;

LAB19:    t17 = *((unsigned int *)t32);
    t18 = *((unsigned int *)t33);
    t46 = (t17 - t18);
    t47 = (t46 + 1);
    xsi_vlogvar_wait_assign_value(t23, t14, 0, *((unsigned int *)t33), t47, 0LL);
    goto LAB20;

LAB22:    *((unsigned int *)t4) = 1;
    goto LAB25;

LAB24:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB25;

LAB26:    t12 = (t0 + 3208U);
    t13 = *((char **)t12);
    memset(t31, 0, 8);
    t12 = (t13 + 4);
    t18 = *((unsigned int *)t12);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB32;

LAB30:    if (*((unsigned int *)t12) == 0)
        goto LAB29;

LAB31:    t14 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t14) = 1;

LAB32:    memset(t32, 0, 8);
    t23 = (t31 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t31);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t23) != 0)
        goto LAB35;

LAB36:    t48 = *((unsigned int *)t4);
    t49 = *((unsigned int *)t32);
    t50 = (t48 & t49);
    *((unsigned int *)t33) = t50;
    t30 = (t4 + 4);
    t34 = (t32 + 4);
    t35 = (t33 + 4);
    t51 = *((unsigned int *)t30);
    t52 = *((unsigned int *)t34);
    t53 = (t51 | t52);
    *((unsigned int *)t35) = t53;
    t54 = *((unsigned int *)t35);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB28;

LAB29:    *((unsigned int *)t31) = 1;
    goto LAB32;

LAB33:    *((unsigned int *)t32) = 1;
    goto LAB36;

LAB35:    t29 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB36;

LAB37:    t56 = *((unsigned int *)t33);
    t57 = *((unsigned int *)t35);
    *((unsigned int *)t33) = (t56 | t57);
    t36 = (t4 + 4);
    t37 = (t32 + 4);
    t58 = *((unsigned int *)t4);
    t59 = (~(t58));
    t60 = *((unsigned int *)t36);
    t61 = (~(t60));
    t62 = *((unsigned int *)t32);
    t63 = (~(t62));
    t64 = *((unsigned int *)t37);
    t65 = (~(t64));
    t42 = (t59 & t61);
    t44 = (t63 & t65);
    t66 = (~(t42));
    t67 = (~(t44));
    t68 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t68 & t66);
    t69 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t69 & t67);
    t70 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t70 & t66);
    t71 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t71 & t67);
    goto LAB39;

LAB40:    *((unsigned int *)t72) = 1;
    goto LAB43;

LAB42:    t39 = (t72 + 4);
    *((unsigned int *)t72) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB43;

LAB44:    t41 = (t0 + 2888U);
    t43 = *((char **)t41);
    memset(t81, 0, 8);
    t41 = (t81 + 4);
    t82 = (t43 + 4);
    t83 = *((unsigned int *)t43);
    t84 = (t83 >> 2);
    *((unsigned int *)t81) = t84;
    t85 = *((unsigned int *)t82);
    t86 = (t85 >> 2);
    *((unsigned int *)t41) = t86;
    t87 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t87 & 7U);
    t88 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t88 & 7U);
    t89 = (t0 + 744);
    t90 = *((char **)t89);
    t89 = (t0 + 880);
    t91 = *((char **)t89);
    memset(t92, 0, 8);
    xsi_vlog_unsigned_add(t92, 32, t90, 32, t91, 32);
    memset(t93, 0, 8);
    t89 = (t81 + 4);
    if (*((unsigned int *)t89) != 0)
        goto LAB48;

LAB47:    t94 = (t92 + 4);
    if (*((unsigned int *)t94) != 0)
        goto LAB48;

LAB51:    if (*((unsigned int *)t81) < *((unsigned int *)t92))
        goto LAB49;

LAB50:    memset(t96, 0, 8);
    t97 = (t93 + 4);
    t98 = *((unsigned int *)t97);
    t99 = (~(t98));
    t100 = *((unsigned int *)t93);
    t101 = (t100 & t99);
    t102 = (t101 & 1U);
    if (t102 != 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t97) != 0)
        goto LAB54;

LAB55:    t105 = *((unsigned int *)t72);
    t106 = *((unsigned int *)t96);
    t107 = (t105 & t106);
    *((unsigned int *)t104) = t107;
    t108 = (t72 + 4);
    t109 = (t96 + 4);
    t110 = (t104 + 4);
    t111 = *((unsigned int *)t108);
    t112 = *((unsigned int *)t109);
    t113 = (t111 | t112);
    *((unsigned int *)t110) = t113;
    t114 = *((unsigned int *)t110);
    t115 = (t114 != 0);
    if (t115 == 1)
        goto LAB56;

LAB57:
LAB58:    goto LAB46;

LAB48:    t95 = (t93 + 4);
    *((unsigned int *)t93) = 1;
    *((unsigned int *)t95) = 1;
    goto LAB50;

LAB49:    *((unsigned int *)t93) = 1;
    goto LAB50;

LAB52:    *((unsigned int *)t96) = 1;
    goto LAB55;

LAB54:    t103 = (t96 + 4);
    *((unsigned int *)t96) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB55;

LAB56:    t116 = *((unsigned int *)t104);
    t117 = *((unsigned int *)t110);
    *((unsigned int *)t104) = (t116 | t117);
    t118 = (t72 + 4);
    t119 = (t96 + 4);
    t120 = *((unsigned int *)t72);
    t121 = (~(t120));
    t122 = *((unsigned int *)t118);
    t123 = (~(t122));
    t124 = *((unsigned int *)t96);
    t125 = (~(t124));
    t126 = *((unsigned int *)t119);
    t127 = (~(t126));
    t45 = (t121 & t123);
    t46 = (t125 & t127);
    t128 = (~(t45));
    t129 = (~(t46));
    t130 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t130 & t128);
    t131 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t131 & t129);
    t132 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t132 & t128);
    t133 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t133 & t129);
    goto LAB58;

LAB59:    xsi_set_current_line(139, ng0);

LAB62:    xsi_set_current_line(140, ng0);
    t140 = (t0 + 3368U);
    t141 = *((char **)t140);
    t140 = (t0 + 5368);
    t144 = (t0 + 5368);
    t145 = (t144 + 72U);
    t146 = *((char **)t145);
    t147 = (t0 + 5368);
    t148 = (t147 + 64U);
    t149 = *((char **)t148);
    t151 = (t0 + 2888U);
    t152 = *((char **)t151);
    memset(t150, 0, 8);
    t151 = (t150 + 4);
    t153 = (t152 + 4);
    t154 = *((unsigned int *)t152);
    t155 = (t154 >> 2);
    *((unsigned int *)t150) = t155;
    t156 = *((unsigned int *)t153);
    t157 = (t156 >> 2);
    *((unsigned int *)t151) = t157;
    t158 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t158 & 7U);
    t159 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t159 & 7U);
    xsi_vlog_generic_convert_array_indices(t142, t143, t146, t149, 2, 1, t150, 3, 2);
    t160 = (t142 + 4);
    t161 = *((unsigned int *)t160);
    t47 = (!(t161));
    t162 = (t143 + 4);
    t163 = *((unsigned int *)t162);
    t164 = (!(t163));
    t165 = (t47 && t164);
    if (t165 == 1)
        goto LAB63;

LAB64:    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB61;

LAB63:    t166 = *((unsigned int *)t142);
    t167 = *((unsigned int *)t143);
    t168 = (t166 - t167);
    t169 = (t168 + 1);
    xsi_vlogvar_wait_assign_value(t140, t141, 0, *((unsigned int *)t143), t169, 0LL);
    goto LAB64;

LAB65:    *((unsigned int *)t4) = 1;
    goto LAB68;

LAB67:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB68;

LAB69:    t12 = (t0 + 3208U);
    t13 = *((char **)t12);
    memset(t31, 0, 8);
    t12 = (t13 + 4);
    t18 = *((unsigned int *)t12);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB75;

LAB73:    if (*((unsigned int *)t12) == 0)
        goto LAB72;

LAB74:    t14 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t14) = 1;

LAB75:    memset(t32, 0, 8);
    t23 = (t31 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t31);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t23) != 0)
        goto LAB78;

LAB79:    t48 = *((unsigned int *)t4);
    t49 = *((unsigned int *)t32);
    t50 = (t48 & t49);
    *((unsigned int *)t33) = t50;
    t30 = (t4 + 4);
    t34 = (t32 + 4);
    t35 = (t33 + 4);
    t51 = *((unsigned int *)t30);
    t52 = *((unsigned int *)t34);
    t53 = (t51 | t52);
    *((unsigned int *)t35) = t53;
    t54 = *((unsigned int *)t35);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB80;

LAB81:
LAB82:    goto LAB71;

LAB72:    *((unsigned int *)t31) = 1;
    goto LAB75;

LAB76:    *((unsigned int *)t32) = 1;
    goto LAB79;

LAB78:    t29 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB79;

LAB80:    t56 = *((unsigned int *)t33);
    t57 = *((unsigned int *)t35);
    *((unsigned int *)t33) = (t56 | t57);
    t36 = (t4 + 4);
    t37 = (t32 + 4);
    t58 = *((unsigned int *)t4);
    t59 = (~(t58));
    t60 = *((unsigned int *)t36);
    t61 = (~(t60));
    t62 = *((unsigned int *)t32);
    t63 = (~(t62));
    t64 = *((unsigned int *)t37);
    t65 = (~(t64));
    t42 = (t59 & t61);
    t44 = (t63 & t65);
    t66 = (~(t42));
    t67 = (~(t44));
    t68 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t68 & t66);
    t69 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t69 & t67);
    t70 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t70 & t66);
    t71 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t71 & t67);
    goto LAB82;

LAB83:    *((unsigned int *)t72) = 1;
    goto LAB86;

LAB85:    t39 = (t72 + 4);
    *((unsigned int *)t72) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB86;

LAB87:    t41 = (t0 + 2888U);
    t43 = *((char **)t41);
    memset(t81, 0, 8);
    t41 = (t81 + 4);
    t82 = (t43 + 4);
    t83 = *((unsigned int *)t43);
    t84 = (t83 >> 2);
    *((unsigned int *)t81) = t84;
    t85 = *((unsigned int *)t82);
    t86 = (t85 >> 2);
    *((unsigned int *)t41) = t86;
    t87 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t87 & 7U);
    t88 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t88 & 7U);
    t89 = (t0 + 744);
    t90 = *((char **)t89);
    t89 = (t0 + 880);
    t91 = *((char **)t89);
    memset(t92, 0, 8);
    xsi_vlog_unsigned_add(t92, 32, t90, 32, t91, 32);
    memset(t93, 0, 8);
    t89 = (t81 + 4);
    if (*((unsigned int *)t89) != 0)
        goto LAB91;

LAB90:    t94 = (t92 + 4);
    if (*((unsigned int *)t94) != 0)
        goto LAB91;

LAB94:    if (*((unsigned int *)t81) < *((unsigned int *)t92))
        goto LAB93;

LAB92:    *((unsigned int *)t93) = 1;

LAB93:    memset(t96, 0, 8);
    t97 = (t93 + 4);
    t98 = *((unsigned int *)t97);
    t99 = (~(t98));
    t100 = *((unsigned int *)t93);
    t101 = (t100 & t99);
    t102 = (t101 & 1U);
    if (t102 != 0)
        goto LAB95;

LAB96:    if (*((unsigned int *)t97) != 0)
        goto LAB97;

LAB98:    t105 = *((unsigned int *)t72);
    t106 = *((unsigned int *)t96);
    t107 = (t105 & t106);
    *((unsigned int *)t104) = t107;
    t108 = (t72 + 4);
    t109 = (t96 + 4);
    t110 = (t104 + 4);
    t111 = *((unsigned int *)t108);
    t112 = *((unsigned int *)t109);
    t113 = (t111 | t112);
    *((unsigned int *)t110) = t113;
    t114 = *((unsigned int *)t110);
    t115 = (t114 != 0);
    if (t115 == 1)
        goto LAB99;

LAB100:
LAB101:    goto LAB89;

LAB91:    t95 = (t93 + 4);
    *((unsigned int *)t93) = 1;
    *((unsigned int *)t95) = 1;
    goto LAB93;

LAB95:    *((unsigned int *)t96) = 1;
    goto LAB98;

LAB97:    t103 = (t96 + 4);
    *((unsigned int *)t96) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB98;

LAB99:    t116 = *((unsigned int *)t104);
    t117 = *((unsigned int *)t110);
    *((unsigned int *)t104) = (t116 | t117);
    t118 = (t72 + 4);
    t119 = (t96 + 4);
    t120 = *((unsigned int *)t72);
    t121 = (~(t120));
    t122 = *((unsigned int *)t118);
    t123 = (~(t122));
    t124 = *((unsigned int *)t96);
    t125 = (~(t124));
    t126 = *((unsigned int *)t119);
    t127 = (~(t126));
    t45 = (t121 & t123);
    t46 = (t125 & t127);
    t128 = (~(t45));
    t129 = (~(t46));
    t130 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t130 & t128);
    t131 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t131 & t129);
    t132 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t132 & t128);
    t133 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t133 & t129);
    goto LAB101;

LAB102:    xsi_set_current_line(144, ng0);

LAB105:    xsi_set_current_line(145, ng0);
    t140 = ((char*)((ng5)));
    t141 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t141, t140, 0, 0, 1, 0LL);
    goto LAB104;

}

static void Always_151_8(char *t0)
{
    char t4[8];
    char t31[8];
    char t32[8];
    char t56[8];
    char t68[8];
    char t80[8];
    char t83[8];
    char t91[8];
    char t131[8];
    char t137[8];
    char t149[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    char *t81;
    char *t82;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    int t115;
    int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;
    char *t130;
    char *t132;
    char *t133;
    char *t134;
    char *t135;
    char *t136;
    char *t138;
    char *t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    char *t147;
    char *t148;

LAB0:    t1 = (t0 + 8584U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 9016);
    *((int *)t2) = 1;
    t3 = (t0 + 8616);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(151, ng0);

LAB5:    xsi_set_current_line(152, ng0);
    t5 = (t0 + 2728U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t4 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(156, ng0);

LAB16:    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t2) != 0)
        goto LAB19;

LAB20:    t6 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t6);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB21;

LAB22:    memcpy(t32, t4, 8);

LAB23:    memset(t56, 0, 8);
    t57 = (t32 + 4);
    t58 = *((unsigned int *)t57);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t57) != 0)
        goto LAB33;

LAB34:    t64 = (t56 + 4);
    t65 = *((unsigned int *)t56);
    t66 = *((unsigned int *)t64);
    t67 = (t65 || t66);
    if (t67 > 0)
        goto LAB35;

LAB36:    memcpy(t91, t56, 8);

LAB37:    t123 = (t91 + 4);
    t124 = *((unsigned int *)t123);
    t125 = (~(t124));
    t126 = *((unsigned int *)t91);
    t127 = (t126 & t125);
    t128 = (t127 != 0);
    if (t128 > 0)
        goto LAB50;

LAB51:
LAB52:
LAB14:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB11:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

LAB12:    xsi_set_current_line(152, ng0);

LAB15:    xsi_set_current_line(153, ng0);
    t29 = ((char*)((ng4)));
    t30 = (t0 + 4728);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 32, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB14;

LAB17:    *((unsigned int *)t4) = 1;
    goto LAB20;

LAB19:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB20;

LAB21:    t12 = (t0 + 3208U);
    t13 = *((char **)t12);
    memset(t31, 0, 8);
    t12 = (t13 + 4);
    t18 = *((unsigned int *)t12);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t12) != 0)
        goto LAB26;

LAB27:    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t31);
    t26 = (t24 & t25);
    *((unsigned int *)t32) = t26;
    t23 = (t4 + 4);
    t29 = (t31 + 4);
    t30 = (t32 + 4);
    t27 = *((unsigned int *)t23);
    t28 = *((unsigned int *)t29);
    t33 = (t27 | t28);
    *((unsigned int *)t30) = t33;
    t34 = *((unsigned int *)t30);
    t35 = (t34 != 0);
    if (t35 == 1)
        goto LAB28;

LAB29:
LAB30:    goto LAB23;

LAB24:    *((unsigned int *)t31) = 1;
    goto LAB27;

LAB26:    t14 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB27;

LAB28:    t36 = *((unsigned int *)t32);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t32) = (t36 | t37);
    t38 = (t4 + 4);
    t39 = (t31 + 4);
    t40 = *((unsigned int *)t4);
    t41 = (~(t40));
    t42 = *((unsigned int *)t38);
    t43 = (~(t42));
    t44 = *((unsigned int *)t31);
    t45 = (~(t44));
    t46 = *((unsigned int *)t39);
    t47 = (~(t46));
    t48 = (t41 & t43);
    t49 = (t45 & t47);
    t50 = (~(t48));
    t51 = (~(t49));
    t52 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t52 & t50);
    t53 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t53 & t51);
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t50);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t51);
    goto LAB30;

LAB31:    *((unsigned int *)t56) = 1;
    goto LAB34;

LAB33:    t63 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB34;

LAB35:    t69 = (t0 + 2888U);
    t70 = *((char **)t69);
    memset(t68, 0, 8);
    t69 = (t68 + 4);
    t71 = (t70 + 4);
    t72 = *((unsigned int *)t70);
    t73 = (t72 >> 2);
    *((unsigned int *)t68) = t73;
    t74 = *((unsigned int *)t71);
    t75 = (t74 >> 2);
    *((unsigned int *)t69) = t75;
    t76 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t76 & 7U);
    t77 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t77 & 7U);
    t78 = (t0 + 744);
    t79 = *((char **)t78);
    memset(t80, 0, 8);
    t78 = (t68 + 4);
    if (*((unsigned int *)t78) != 0)
        goto LAB39;

LAB38:    t81 = (t79 + 4);
    if (*((unsigned int *)t81) != 0)
        goto LAB39;

LAB42:    if (*((unsigned int *)t68) < *((unsigned int *)t79))
        goto LAB41;

LAB40:    *((unsigned int *)t80) = 1;

LAB41:    memset(t83, 0, 8);
    t84 = (t80 + 4);
    t85 = *((unsigned int *)t84);
    t86 = (~(t85));
    t87 = *((unsigned int *)t80);
    t88 = (t87 & t86);
    t89 = (t88 & 1U);
    if (t89 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t84) != 0)
        goto LAB45;

LAB46:    t92 = *((unsigned int *)t56);
    t93 = *((unsigned int *)t83);
    t94 = (t92 & t93);
    *((unsigned int *)t91) = t94;
    t95 = (t56 + 4);
    t96 = (t83 + 4);
    t97 = (t91 + 4);
    t98 = *((unsigned int *)t95);
    t99 = *((unsigned int *)t96);
    t100 = (t98 | t99);
    *((unsigned int *)t97) = t100;
    t101 = *((unsigned int *)t97);
    t102 = (t101 != 0);
    if (t102 == 1)
        goto LAB47;

LAB48:
LAB49:    goto LAB37;

LAB39:    t82 = (t80 + 4);
    *((unsigned int *)t80) = 1;
    *((unsigned int *)t82) = 1;
    goto LAB41;

LAB43:    *((unsigned int *)t83) = 1;
    goto LAB46;

LAB45:    t90 = (t83 + 4);
    *((unsigned int *)t83) = 1;
    *((unsigned int *)t90) = 1;
    goto LAB46;

LAB47:    t103 = *((unsigned int *)t91);
    t104 = *((unsigned int *)t97);
    *((unsigned int *)t91) = (t103 | t104);
    t105 = (t56 + 4);
    t106 = (t83 + 4);
    t107 = *((unsigned int *)t56);
    t108 = (~(t107));
    t109 = *((unsigned int *)t105);
    t110 = (~(t109));
    t111 = *((unsigned int *)t83);
    t112 = (~(t111));
    t113 = *((unsigned int *)t106);
    t114 = (~(t113));
    t115 = (t108 & t110);
    t116 = (t112 & t114);
    t117 = (~(t115));
    t118 = (~(t116));
    t119 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t119 & t117);
    t120 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t120 & t118);
    t121 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t121 & t117);
    t122 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t122 & t118);
    goto LAB49;

LAB50:    xsi_set_current_line(159, ng0);

LAB53:    xsi_set_current_line(160, ng0);
    t129 = (t0 + 4328U);
    t130 = *((char **)t129);
    t129 = (t0 + 4288U);
    t132 = (t129 + 72U);
    t133 = *((char **)t132);
    t134 = (t0 + 4288U);
    t135 = (t134 + 48U);
    t136 = *((char **)t135);
    t138 = (t0 + 2888U);
    t139 = *((char **)t138);
    memset(t137, 0, 8);
    t138 = (t137 + 4);
    t140 = (t139 + 4);
    t141 = *((unsigned int *)t139);
    t142 = (t141 >> 2);
    *((unsigned int *)t137) = t142;
    t143 = *((unsigned int *)t140);
    t144 = (t143 >> 2);
    *((unsigned int *)t138) = t144;
    t145 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t145 & 7U);
    t146 = *((unsigned int *)t138);
    *((unsigned int *)t138) = (t146 & 7U);
    t147 = (t0 + 744);
    t148 = *((char **)t147);
    memset(t149, 0, 8);
    xsi_vlog_unsigned_minus(t149, 32, t137, 32, t148, 32);
    xsi_vlog_generic_get_array_select_value(t131, 32, t130, t133, t136, 2, 1, t149, 32, 2);
    t147 = (t0 + 4728);
    xsi_vlogvar_wait_assign_value(t147, t131, 0, 0, 32, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB52;

}


extern void nf10_proc_common_v1_00_a_m_03609373904439264904_1529697645_init()
{
	static char *pe[] = {(void *)Cont_113_0,(void *)Cont_114_1,(void *)Cont_120_2,(void *)Cont_120_3,(void *)Cont_120_4,(void *)Cont_120_5,(void *)Cont_126_6,(void *)Always_129_7,(void *)Always_151_8};
	static char *se[] = {(void *)sp_log2};
	xsi_register_didat("nf10_proc_common_v1_00_a_m_03609373904439264904_1529697645", "isim/isim_system_axisim.sim/nf10_proc_common_v1_00_a/m_03609373904439264904_1529697645.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
