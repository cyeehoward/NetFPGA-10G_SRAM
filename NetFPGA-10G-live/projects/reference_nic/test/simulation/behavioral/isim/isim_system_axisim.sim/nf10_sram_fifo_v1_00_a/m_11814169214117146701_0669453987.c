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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/std/pcores/nf10_sram_fifo_v1_00_a/hdl/verilog/controller/qdrii_phy_init_sm.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2032U, 0U};
static unsigned int ng6[] = {2047U, 0U};
static unsigned int ng7[] = {15U, 0U};
static const char *ng8 = "Calibration completed at time %t";
static unsigned int ng9[] = {2U, 0U};
static unsigned int ng10[] = {4U, 0U};
static int ng11[] = {2, 0};
static unsigned int ng12[] = {16U, 0U};
static int ng13[] = {4, 0};
static unsigned int ng14[] = {8U, 0U};
static unsigned int ng15[] = {32U, 0U};
static unsigned int ng16[] = {64U, 0U};
static unsigned int ng17[] = {3U, 0U};
static unsigned int ng18[] = {128U, 0U};
static unsigned int ng19[] = {256U, 0U};
static unsigned int ng20[] = {512U, 0U};
static unsigned int ng21[] = {4096U, 0U};
static unsigned int ng22[] = {1024U, 0U};
static unsigned int ng23[] = {2048U, 0U};
static unsigned int ng24[] = {8192U, 0U};



static void Always_130_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 8808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 12352);
    *((int *)t2) = 1;
    t3 = (t0 + 8840);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(131, ng0);

LAB5:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 3976U);
    t3 = *((char **)t2);
    t2 = (t0 + 7736);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(133, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 7736);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

}

static void Always_153_1(char *t0)
{
    char t13[8];
    char t32[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
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
    char *t29;
    char *t30;
    char *t31;
    char *t33;

LAB0:    t1 = (t0 + 9056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 12368);
    *((int *)t2) = 1;
    t3 = (t0 + 9088);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(154, ng0);

LAB5:    xsi_set_current_line(155, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 5496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t15 = (t9 ^ t10);
    t16 = (t8 | t15);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    t19 = (t17 | t18);
    t22 = (~(t19));
    t23 = (t16 & t22);
    if (t23 != 0)
        goto LAB15;

LAB12:    if (t19 != 0)
        goto LAB14;

LAB13:    *((unsigned int *)t13) = 1;

LAB15:    t20 = (t13 + 4);
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t13);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB16;

LAB17:    xsi_set_current_line(165, ng0);
    t2 = (t0 + 7896);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7896);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);

LAB18:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(156, ng0);
    t11 = (t0 + 744);
    t12 = *((char **)t11);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_equal(t13, 32, t12, 32, t11, 32);
    t14 = (t13 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7896);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB11:    goto LAB8;

LAB9:    xsi_set_current_line(158, ng0);
    t20 = (t0 + 2784);
    t21 = *((char **)t20);
    t20 = (t0 + 7896);
    xsi_vlogvar_wait_assign_value(t20, t21, 0, 0, 32, 0LL);
    goto LAB11;

LAB14:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB15;

LAB16:    xsi_set_current_line(163, ng0);
    t21 = (t0 + 7896);
    t29 = (t21 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng2)));
    memset(t32, 0, 8);
    xsi_vlog_signed_add(t32, 32, t30, 32, t31, 32);
    t33 = (t0 + 7896);
    xsi_vlogvar_wait_assign_value(t33, t32, 0, 0, 32, 0LL);
    goto LAB18;

}

static void Always_168_2(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;

LAB0:    t1 = (t0 + 9304U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(168, ng0);
    t2 = (t0 + 12384);
    *((int *)t2) = 1;
    t3 = (t0 + 9336);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(169, ng0);

LAB5:    xsi_set_current_line(170, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(173, ng0);
    t2 = (t0 + 7896);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2784);
    t11 = *((char **)t5);
    memset(t13, 0, 8);
    xsi_vlog_signed_equal(t13, 32, t4, 32, t11, 32);
    t5 = (t13 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 5496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5496);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(171, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5496);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(174, ng0);
    t12 = ((char*)((ng4)));
    t14 = (t0 + 5496);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, 0, 1, 0LL);
    goto LAB11;

}

static void Always_179_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 9552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(179, ng0);
    t2 = (t0 + 12400);
    *((int *)t2) = 1;
    t3 = (t0 + 9584);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(180, ng0);

LAB5:    xsi_set_current_line(181, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 5816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 4856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4856);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(181, ng0);

LAB9:    xsi_set_current_line(182, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4856);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(183, ng0);

LAB13:    xsi_set_current_line(184, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 4856);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB12;

}

static void Always_190_4(char *t0)
{
    char t13[8];
    char t21[8];
    char t37[8];
    char t45[8];
    char t87[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    int t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t88;

LAB0:    t1 = (t0 + 9800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 12416);
    *((int *)t2) = 1;
    t3 = (t0 + 9832);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(191, ng0);

LAB5:    xsi_set_current_line(192, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 5496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t5) != 0)
        goto LAB11;

LAB12:    t12 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t12);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB13;

LAB14:    memcpy(t45, t13, 8);

LAB15:    t77 = (t45 + 4);
    t78 = *((unsigned int *)t77);
    t79 = (~(t78));
    t80 = *((unsigned int *)t45);
    t81 = (t80 & t79);
    t82 = (t81 != 0);
    if (t82 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 6296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6296);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 11, 0LL);

LAB29:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(194, ng0);
    t11 = ((char*)((ng5)));
    t12 = (t0 + 6296);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 11, 0LL);
    goto LAB8;

LAB9:    *((unsigned int *)t13) = 1;
    goto LAB12;

LAB11:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB12;

LAB13:    t17 = (t0 + 6296);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = ((char*)((ng6)));
    memset(t21, 0, 8);
    t22 = (t19 + 4);
    t23 = (t20 + 4);
    t24 = *((unsigned int *)t19);
    t25 = *((unsigned int *)t20);
    t26 = (t24 ^ t25);
    t27 = *((unsigned int *)t22);
    t28 = *((unsigned int *)t23);
    t29 = (t27 ^ t28);
    t30 = (t26 | t29);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t23);
    t33 = (t31 | t32);
    t34 = (~(t33));
    t35 = (t30 & t34);
    if (t35 != 0)
        goto LAB17;

LAB16:    if (t33 != 0)
        goto LAB18;

LAB19:    memset(t37, 0, 8);
    t38 = (t21 + 4);
    t39 = *((unsigned int *)t38);
    t40 = (~(t39));
    t41 = *((unsigned int *)t21);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t38) != 0)
        goto LAB22;

LAB23:    t46 = *((unsigned int *)t13);
    t47 = *((unsigned int *)t37);
    t48 = (t46 & t47);
    *((unsigned int *)t45) = t48;
    t49 = (t13 + 4);
    t50 = (t37 + 4);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t49);
    t53 = *((unsigned int *)t50);
    t54 = (t52 | t53);
    *((unsigned int *)t51) = t54;
    t55 = *((unsigned int *)t51);
    t56 = (t55 != 0);
    if (t56 == 1)
        goto LAB24;

LAB25:
LAB26:    goto LAB15;

LAB17:    *((unsigned int *)t21) = 1;
    goto LAB19;

LAB18:    t36 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB19;

LAB20:    *((unsigned int *)t37) = 1;
    goto LAB23;

LAB22:    t44 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB23;

LAB24:    t57 = *((unsigned int *)t45);
    t58 = *((unsigned int *)t51);
    *((unsigned int *)t45) = (t57 | t58);
    t59 = (t13 + 4);
    t60 = (t37 + 4);
    t61 = *((unsigned int *)t13);
    t62 = (~(t61));
    t63 = *((unsigned int *)t59);
    t64 = (~(t63));
    t65 = *((unsigned int *)t37);
    t66 = (~(t65));
    t67 = *((unsigned int *)t60);
    t68 = (~(t67));
    t69 = (t62 & t64);
    t70 = (t66 & t68);
    t71 = (~(t69));
    t72 = (~(t70));
    t73 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t73 & t71);
    t74 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t74 & t72);
    t75 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t75 & t71);
    t76 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t76 & t72);
    goto LAB26;

LAB27:    xsi_set_current_line(196, ng0);
    t83 = (t0 + 6296);
    t84 = (t83 + 56U);
    t85 = *((char **)t84);
    t86 = ((char*)((ng2)));
    memset(t87, 0, 8);
    xsi_vlog_unsigned_add(t87, 32, t85, 11, t86, 32);
    t88 = (t0 + 6296);
    xsi_vlogvar_wait_assign_value(t88, t87, 0, 0, 11, 0LL);
    goto LAB29;

}

static void Always_201_5(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 10048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 12432);
    *((int *)t2) = 1;
    t3 = (t0 + 10080);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(203, ng0);

LAB5:    xsi_set_current_line(204, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(206, ng0);
    t2 = (t0 + 6296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB12;

LAB9:    if (t18 != 0)
        goto LAB11;

LAB10:    *((unsigned int *)t13) = 1;

LAB12:    t22 = (t13 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 6456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6456);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(205, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6456);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB11:    t21 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB12;

LAB13:    xsi_set_current_line(207, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 6456);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    goto LAB15;

}

static void Always_223_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 10296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(223, ng0);
    t2 = (t0 + 12448);
    *((int *)t2) = 1;
    t3 = (t0 + 10328);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(224, ng0);

LAB5:    xsi_set_current_line(225, ng0);
    t4 = (t0 + 4296U);
    t5 = *((char **)t4);
    t4 = (t0 + 7416);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(226, ng0);
    t2 = (t0 + 7416);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7576);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB2;

}

static void Always_229_7(char *t0)
{
    char t13[8];
    char t20[8];
    char t28[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    int t52;
    int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;

LAB0:    t1 = (t0 + 10544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(229, ng0);
    t2 = (t0 + 12464);
    *((int *)t2) = 1;
    t3 = (t0 + 10576);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(230, ng0);

LAB5:    xsi_set_current_line(231, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(233, ng0);
    t2 = (t0 + 6456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t5) != 0)
        goto LAB12;

LAB13:    t12 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t12);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB14;

LAB15:    memcpy(t28, t13, 8);

LAB16:    t60 = (t28 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t28);
    t64 = (t63 & t62);
    t65 = (t64 != 0);
    if (t65 > 0)
        goto LAB24;

LAB25:
LAB26:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(231, ng0);

LAB9:    xsi_set_current_line(232, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4696);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t13) = 1;
    goto LAB13;

LAB12:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB13;

LAB14:    t17 = (t0 + 7576);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t20, 0, 8);
    t21 = (t19 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t19);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t21) != 0)
        goto LAB19;

LAB20:    t29 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t20);
    t31 = (t29 & t30);
    *((unsigned int *)t28) = t31;
    t32 = (t13 + 4);
    t33 = (t20 + 4);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t32);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t38 = *((unsigned int *)t34);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB16;

LAB17:    *((unsigned int *)t20) = 1;
    goto LAB20;

LAB19:    t27 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB20;

LAB21:    t40 = *((unsigned int *)t28);
    t41 = *((unsigned int *)t34);
    *((unsigned int *)t28) = (t40 | t41);
    t42 = (t13 + 4);
    t43 = (t20 + 4);
    t44 = *((unsigned int *)t13);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t47 = (~(t46));
    t48 = *((unsigned int *)t20);
    t49 = (~(t48));
    t50 = *((unsigned int *)t43);
    t51 = (~(t50));
    t52 = (t45 & t47);
    t53 = (t49 & t51);
    t54 = (~(t52));
    t55 = (~(t53));
    t56 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t56 & t54);
    t57 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t57 & t55);
    t58 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t58 & t54);
    t59 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t59 & t55);
    goto LAB23;

LAB24:    xsi_set_current_line(233, ng0);

LAB27:    xsi_set_current_line(234, ng0);
    t66 = ((char*)((ng4)));
    t67 = (t0 + 4696);
    xsi_vlogvar_wait_assign_value(t67, t66, 0, 0, 1, 0LL);
    goto LAB26;

}

static void Always_238_8(char *t0)
{
    char t13[8];
    char t32[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;

LAB0:    t1 = (t0 + 10792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(238, ng0);
    t2 = (t0 + 12480);
    *((int *)t2) = 1;
    t3 = (t0 + 10824);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(239, ng0);

LAB5:    xsi_set_current_line(240, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(242, ng0);
    t2 = (t0 + 5816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(244, ng0);
    t2 = (t0 + 5656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB15;

LAB14:    if (t18 != 0)
        goto LAB16;

LAB17:    t22 = (t13 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(246, ng0);

LAB22:    xsi_set_current_line(247, ng0);
    t2 = (t0 + 5656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5656);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);

LAB20:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(240, ng0);

LAB9:    xsi_set_current_line(241, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5656);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(242, ng0);

LAB13:    xsi_set_current_line(243, ng0);
    t11 = ((char*)((ng7)));
    t12 = (t0 + 5656);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB12;

LAB15:    *((unsigned int *)t13) = 1;
    goto LAB17;

LAB16:    t21 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(244, ng0);

LAB21:    xsi_set_current_line(245, ng0);
    t28 = (t0 + 5656);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng2)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_minus(t32, 32, t30, 4, t31, 32);
    t33 = (t0 + 5656);
    xsi_vlogvar_wait_assign_value(t33, t32, 0, 0, 4, 0LL);
    goto LAB20;

}

static void Always_251_9(char *t0)
{
    char t13[8];
    char t19[8];
    char t35[8];
    char t43[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
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
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    int t67;
    int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    char *t82;

LAB0:    t1 = (t0 + 11040U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(251, ng0);
    t2 = (t0 + 12496);
    *((int *)t2) = 1;
    t3 = (t0 + 11072);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(252, ng0);

LAB5:    xsi_set_current_line(253, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(255, ng0);
    t2 = (t0 + 4136U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t2) != 0)
        goto LAB11;

LAB12:    t5 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t5);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB13;

LAB14:    memcpy(t43, t13, 8);

LAB15:    t75 = (t43 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (~(t76));
    t78 = *((unsigned int *)t43);
    t79 = (t78 & t77);
    t80 = (t79 != 0);
    if (t80 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(258, ng0);
    t2 = (t0 + 6616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6616);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB29:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(254, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6616);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB9:    *((unsigned int *)t13) = 1;
    goto LAB12;

LAB11:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB13:    t11 = (t0 + 5656);
    t12 = (t11 + 56U);
    t17 = *((char **)t12);
    t18 = ((char*)((ng1)));
    memset(t19, 0, 8);
    t20 = (t17 + 4);
    t21 = (t18 + 4);
    t22 = *((unsigned int *)t17);
    t23 = *((unsigned int *)t18);
    t24 = (t22 ^ t23);
    t25 = *((unsigned int *)t20);
    t26 = *((unsigned int *)t21);
    t27 = (t25 ^ t26);
    t28 = (t24 | t27);
    t29 = *((unsigned int *)t20);
    t30 = *((unsigned int *)t21);
    t31 = (t29 | t30);
    t32 = (~(t31));
    t33 = (t28 & t32);
    if (t33 != 0)
        goto LAB19;

LAB16:    if (t31 != 0)
        goto LAB18;

LAB17:    *((unsigned int *)t19) = 1;

LAB19:    memset(t35, 0, 8);
    t36 = (t19 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t19);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t36) != 0)
        goto LAB22;

LAB23:    t44 = *((unsigned int *)t13);
    t45 = *((unsigned int *)t35);
    t46 = (t44 & t45);
    *((unsigned int *)t43) = t46;
    t47 = (t13 + 4);
    t48 = (t35 + 4);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t47);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB24;

LAB25:
LAB26:    goto LAB15;

LAB18:    t34 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB19;

LAB20:    *((unsigned int *)t35) = 1;
    goto LAB23;

LAB22:    t42 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB23;

LAB24:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t43) = (t55 | t56);
    t57 = (t13 + 4);
    t58 = (t35 + 4);
    t59 = *((unsigned int *)t13);
    t60 = (~(t59));
    t61 = *((unsigned int *)t57);
    t62 = (~(t61));
    t63 = *((unsigned int *)t35);
    t64 = (~(t63));
    t65 = *((unsigned int *)t58);
    t66 = (~(t65));
    t67 = (t60 & t62);
    t68 = (t64 & t66);
    t69 = (~(t67));
    t70 = (~(t68));
    t71 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t71 & t69);
    t72 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t72 & t70);
    t73 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t73 & t69);
    t74 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t74 & t70);
    goto LAB26;

LAB27:    xsi_set_current_line(256, ng0);
    t81 = ((char*)((ng4)));
    t82 = (t0 + 6616);
    xsi_vlogvar_wait_assign_value(t82, t81, 0, 0, 1, 0LL);
    goto LAB29;

}

static void Always_278_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 11288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(278, ng0);
    t2 = (t0 + 12512);
    *((int *)t2) = 1;
    t3 = (t0 + 11320);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(279, ng0);

LAB5:    xsi_set_current_line(280, ng0);
    t4 = (t0 + 6616);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 6776);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 1, 0LL);
    xsi_set_current_line(281, ng0);
    t2 = (t0 + 6776);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6936);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(282, ng0);
    t2 = (t0 + 6936);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7096);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(283, ng0);
    t2 = (t0 + 7096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7256);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(284, ng0);
    t2 = (t0 + 7256);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5336);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB2;

}

static void Always_288_11(char *t0)
{
    char t4[8];
    char t19[16];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t20;

LAB0:    t1 = (t0 + 11536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(288, ng0);
    t2 = (t0 + 12528);
    *((int *)t2) = 1;
    t3 = (t0 + 11568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(288, ng0);

LAB5:    xsi_set_current_line(289, ng0);
    t5 = (t0 + 3656U);
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
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(290, ng0);
    t20 = xsi_vlog_time(t19, 10000.000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng8, 2, t0, (char)118, t19, 64);
    goto LAB12;

}

static void Always_294_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 11784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(294, ng0);
    t2 = (t0 + 12544);
    *((int *)t2) = 1;
    t3 = (t0 + 11816);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(295, ng0);

LAB5:    xsi_set_current_line(296, ng0);
    t4 = (t0 + 3656U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(299, ng0);
    t2 = (t0 + 5976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6136);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 14, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(297, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 6136);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 14, 0LL);
    goto LAB8;

}

static void Always_302_13(char *t0)
{
    char t9[8];
    char t22[8];
    char t30[8];
    char t69[8];
    char t70[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t101;

LAB0:    t1 = (t0 + 12032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(302, ng0);
    t2 = (t0 + 12560);
    *((int *)t2) = 1;
    t3 = (t0 + 12064);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(303, ng0);

LAB5:    xsi_set_current_line(304, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(305, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(306, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5816);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(308, ng0);
    t2 = (t0 + 6136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t5, 14);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng20)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng22)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng23)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng24)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 14, t2, 14);
    if (t6 == 1)
        goto LAB33;

LAB34:
LAB36:
LAB35:    xsi_set_current_line(445, ng0);

LAB135:    xsi_set_current_line(446, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5016);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(447, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(448, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB37:    goto LAB2;

LAB7:    xsi_set_current_line(309, ng0);

LAB38:    xsi_set_current_line(310, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 5016);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 2);
    xsi_set_current_line(311, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(312, ng0);
    t2 = (t0 + 6456);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t9, 0, 8);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t7) != 0)
        goto LAB41;

LAB42:    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    t17 = *((unsigned int *)t15);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB43;

LAB44:    memcpy(t30, t9, 8);

LAB45:    t61 = (t30 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (~(t62));
    t64 = *((unsigned int *)t30);
    t65 = (t64 & t63);
    t66 = (t65 != 0);
    if (t66 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(315, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB55:    goto LAB37;

LAB9:    xsi_set_current_line(319, ng0);

LAB56:    xsi_set_current_line(320, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(321, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(322, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);
    goto LAB37;

LAB11:    xsi_set_current_line(329, ng0);

LAB57:    xsi_set_current_line(330, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(331, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(332, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng11)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB58;

LAB59:    xsi_set_current_line(337, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng13)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB64;

LAB65:
LAB66:
LAB60:    goto LAB37;

LAB13:    xsi_set_current_line(341, ng0);

LAB67:    xsi_set_current_line(342, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(343, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(344, ng0);
    t2 = (t0 + 3976U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB68;

LAB69:    xsi_set_current_line(347, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB70:    goto LAB37;

LAB15:    xsi_set_current_line(353, ng0);

LAB71:    xsi_set_current_line(354, ng0);
    t3 = ((char*)((ng9)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(355, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(356, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng11)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB72;

LAB73:    xsi_set_current_line(358, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng13)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB75;

LAB76:
LAB77:
LAB74:    goto LAB37;

LAB17:    xsi_set_current_line(362, ng0);

LAB78:    xsi_set_current_line(363, ng0);
    t3 = ((char*)((ng17)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(364, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(365, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);
    goto LAB37;

LAB19:    xsi_set_current_line(372, ng0);

LAB79:    xsi_set_current_line(373, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(374, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(375, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng11)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB80;

LAB81:    xsi_set_current_line(377, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng13)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB83;

LAB84:
LAB85:
LAB82:    goto LAB37;

LAB21:    xsi_set_current_line(381, ng0);

LAB86:    xsi_set_current_line(382, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(383, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(384, ng0);
    t2 = (t0 + 3816U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB87;

LAB88:    xsi_set_current_line(387, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB89:    goto LAB37;

LAB23:    xsi_set_current_line(390, ng0);

LAB90:    xsi_set_current_line(391, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(392, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(393, ng0);
    t2 = (t0 + 3816U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB91;

LAB92:    xsi_set_current_line(396, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB93:    goto LAB37;

LAB25:    xsi_set_current_line(400, ng0);

LAB94:    xsi_set_current_line(401, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(402, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(403, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5816);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(404, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);
    goto LAB37;

LAB27:    xsi_set_current_line(411, ng0);

LAB95:    xsi_set_current_line(412, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(413, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(414, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5816);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(415, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng11)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB96;

LAB97:    xsi_set_current_line(417, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = ((char*)((ng13)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t3, 32, t2, 32);
    t5 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (~(t10));
    t12 = *((unsigned int *)t9);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB99;

LAB100:
LAB101:
LAB98:    goto LAB37;

LAB29:    xsi_set_current_line(421, ng0);

LAB102:    xsi_set_current_line(422, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(423, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(424, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5816);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(425, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);
    goto LAB37;

LAB31:    xsi_set_current_line(428, ng0);

LAB103:    xsi_set_current_line(429, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(430, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(431, ng0);
    t2 = (t0 + 5336);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB104;

LAB105:    xsi_set_current_line(433, ng0);
    t2 = (t0 + 4136U);
    t3 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB110;

LAB108:    if (*((unsigned int *)t2) == 0)
        goto LAB107;

LAB109:    t5 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t5) = 1;

LAB110:    t7 = (t9 + 4);
    t8 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (~(t16));
    *((unsigned int *)t9) = t17;
    *((unsigned int *)t7) = 0;
    if (*((unsigned int *)t8) != 0)
        goto LAB112;

LAB111:    t27 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t27 & 1U);
    t28 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t28 & 1U);
    memset(t22, 0, 8);
    t15 = (t9 + 4);
    t31 = *((unsigned int *)t15);
    t32 = (~(t31));
    t33 = *((unsigned int *)t9);
    t37 = (t33 & t32);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB113;

LAB114:    if (*((unsigned int *)t15) != 0)
        goto LAB115;

LAB116:    t20 = (t22 + 4);
    t39 = *((unsigned int *)t22);
    t40 = *((unsigned int *)t20);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB117;

LAB118:    memcpy(t70, t22, 8);

LAB119:    t94 = (t70 + 4);
    t95 = *((unsigned int *)t94);
    t96 = (~(t95));
    t97 = *((unsigned int *)t70);
    t98 = (t97 & t96);
    t99 = (t98 != 0);
    if (t99 > 0)
        goto LAB131;

LAB132:    xsi_set_current_line(436, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB133:
LAB106:    goto LAB37;

LAB33:    xsi_set_current_line(439, ng0);

LAB134:    xsi_set_current_line(440, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5016);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(441, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5176);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(442, ng0);
    t2 = ((char*)((ng24)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);
    goto LAB37;

LAB39:    *((unsigned int *)t9) = 1;
    goto LAB42;

LAB41:    t8 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB42;

LAB43:    t19 = (t0 + 7576);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memset(t22, 0, 8);
    t23 = (t21 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t21);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t23) != 0)
        goto LAB48;

LAB49:    t31 = *((unsigned int *)t9);
    t32 = *((unsigned int *)t22);
    t33 = (t31 & t32);
    *((unsigned int *)t30) = t33;
    t34 = (t9 + 4);
    t35 = (t22 + 4);
    t36 = (t30 + 4);
    t37 = *((unsigned int *)t34);
    t38 = *((unsigned int *)t35);
    t39 = (t37 | t38);
    *((unsigned int *)t36) = t39;
    t40 = *((unsigned int *)t36);
    t41 = (t40 != 0);
    if (t41 == 1)
        goto LAB50;

LAB51:
LAB52:    goto LAB45;

LAB46:    *((unsigned int *)t22) = 1;
    goto LAB49;

LAB48:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB49;

LAB50:    t42 = *((unsigned int *)t30);
    t43 = *((unsigned int *)t36);
    *((unsigned int *)t30) = (t42 | t43);
    t44 = (t9 + 4);
    t45 = (t22 + 4);
    t46 = *((unsigned int *)t9);
    t47 = (~(t46));
    t48 = *((unsigned int *)t44);
    t49 = (~(t48));
    t50 = *((unsigned int *)t22);
    t51 = (~(t50));
    t52 = *((unsigned int *)t45);
    t53 = (~(t52));
    t6 = (t47 & t49);
    t54 = (t51 & t53);
    t55 = (~(t6));
    t56 = (~(t54));
    t57 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t57 & t55);
    t58 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t58 & t56);
    t59 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t59 & t55);
    t60 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t60 & t56);
    goto LAB52;

LAB53:    xsi_set_current_line(313, ng0);
    t67 = ((char*)((ng9)));
    t68 = (t0 + 5976);
    xsi_vlogvar_assign_value(t68, t67, 0, 0, 14);
    goto LAB55;

LAB58:    xsi_set_current_line(333, ng0);
    t7 = (t0 + 7736);
    t8 = (t7 + 56U);
    t15 = *((char **)t8);
    t19 = (t15 + 4);
    t16 = *((unsigned int *)t19);
    t17 = (~(t16));
    t18 = *((unsigned int *)t15);
    t24 = (t18 & t17);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB61;

LAB62:    xsi_set_current_line(336, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 5976);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 14);

LAB63:    goto LAB60;

LAB61:    xsi_set_current_line(334, ng0);
    t20 = ((char*)((ng12)));
    t21 = (t0 + 5976);
    xsi_vlogvar_assign_value(t21, t20, 0, 0, 14);
    goto LAB63;

LAB64:    xsi_set_current_line(338, ng0);
    t7 = ((char*)((ng14)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB66;

LAB68:    xsi_set_current_line(345, ng0);
    t5 = ((char*)((ng12)));
    t7 = (t0 + 5976);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 14);
    goto LAB70;

LAB72:    xsi_set_current_line(357, ng0);
    t7 = ((char*)((ng15)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB74;

LAB75:    xsi_set_current_line(359, ng0);
    t7 = ((char*)((ng16)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB77;

LAB80:    xsi_set_current_line(376, ng0);
    t7 = ((char*)((ng18)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB82;

LAB83:    xsi_set_current_line(378, ng0);
    t7 = ((char*)((ng19)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB85;

LAB87:    xsi_set_current_line(385, ng0);
    t5 = ((char*)((ng20)));
    t7 = (t0 + 5976);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 14);
    goto LAB89;

LAB91:    xsi_set_current_line(394, ng0);
    t5 = ((char*)((ng20)));
    t7 = (t0 + 5976);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 14);
    goto LAB93;

LAB96:    xsi_set_current_line(416, ng0);
    t7 = ((char*)((ng23)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB98;

LAB99:    xsi_set_current_line(418, ng0);
    t7 = ((char*)((ng21)));
    t8 = (t0 + 5976);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 14);
    goto LAB101;

LAB104:    xsi_set_current_line(432, ng0);
    t8 = ((char*)((ng24)));
    t15 = (t0 + 5976);
    xsi_vlogvar_assign_value(t15, t8, 0, 0, 14);
    goto LAB106;

LAB107:    *((unsigned int *)t9) = 1;
    goto LAB110;

LAB112:    t18 = *((unsigned int *)t9);
    t24 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t18 | t24);
    t25 = *((unsigned int *)t7);
    t26 = *((unsigned int *)t8);
    *((unsigned int *)t7) = (t25 | t26);
    goto LAB111;

LAB113:    *((unsigned int *)t22) = 1;
    goto LAB116;

LAB115:    t19 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB116;

LAB117:    t21 = (t0 + 5656);
    t23 = (t21 + 56U);
    t29 = *((char **)t23);
    t34 = ((char*)((ng1)));
    memset(t30, 0, 8);
    t35 = (t29 + 4);
    t36 = (t34 + 4);
    t42 = *((unsigned int *)t29);
    t43 = *((unsigned int *)t34);
    t46 = (t42 ^ t43);
    t47 = *((unsigned int *)t35);
    t48 = *((unsigned int *)t36);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t35);
    t52 = *((unsigned int *)t36);
    t53 = (t51 | t52);
    t55 = (~(t53));
    t56 = (t50 & t55);
    if (t56 != 0)
        goto LAB123;

LAB120:    if (t53 != 0)
        goto LAB122;

LAB121:    *((unsigned int *)t30) = 1;

LAB123:    memset(t69, 0, 8);
    t45 = (t30 + 4);
    t57 = *((unsigned int *)t45);
    t58 = (~(t57));
    t59 = *((unsigned int *)t30);
    t60 = (t59 & t58);
    t62 = (t60 & 1U);
    if (t62 != 0)
        goto LAB124;

LAB125:    if (*((unsigned int *)t45) != 0)
        goto LAB126;

LAB127:    t63 = *((unsigned int *)t22);
    t64 = *((unsigned int *)t69);
    t65 = (t63 & t64);
    *((unsigned int *)t70) = t65;
    t67 = (t22 + 4);
    t68 = (t69 + 4);
    t71 = (t70 + 4);
    t66 = *((unsigned int *)t67);
    t72 = *((unsigned int *)t68);
    t73 = (t66 | t72);
    *((unsigned int *)t71) = t73;
    t74 = *((unsigned int *)t71);
    t75 = (t74 != 0);
    if (t75 == 1)
        goto LAB128;

LAB129:
LAB130:    goto LAB119;

LAB122:    t44 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB123;

LAB124:    *((unsigned int *)t69) = 1;
    goto LAB127;

LAB126:    t61 = (t69 + 4);
    *((unsigned int *)t69) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB127;

LAB128:    t76 = *((unsigned int *)t70);
    t77 = *((unsigned int *)t71);
    *((unsigned int *)t70) = (t76 | t77);
    t78 = (t22 + 4);
    t79 = (t69 + 4);
    t80 = *((unsigned int *)t22);
    t81 = (~(t80));
    t82 = *((unsigned int *)t78);
    t83 = (~(t82));
    t84 = *((unsigned int *)t69);
    t85 = (~(t84));
    t86 = *((unsigned int *)t79);
    t87 = (~(t86));
    t6 = (t81 & t83);
    t54 = (t85 & t87);
    t88 = (~(t6));
    t89 = (~(t54));
    t90 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t90 & t88);
    t91 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t91 & t89);
    t92 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t92 & t88);
    t93 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t93 & t89);
    goto LAB130;

LAB131:    xsi_set_current_line(434, ng0);
    t100 = ((char*)((ng22)));
    t101 = (t0 + 5976);
    xsi_vlogvar_assign_value(t101, t100, 0, 0, 14);
    goto LAB133;

}


extern void nf10_sram_fifo_v1_00_a_m_11814169214117146701_0669453987_init()
{
	static char *pe[] = {(void *)Always_130_0,(void *)Always_153_1,(void *)Always_168_2,(void *)Always_179_3,(void *)Always_190_4,(void *)Always_201_5,(void *)Always_223_6,(void *)Always_229_7,(void *)Always_238_8,(void *)Always_251_9,(void *)Always_278_10,(void *)Always_288_11,(void *)Always_294_12,(void *)Always_302_13};
	xsi_register_didat("nf10_sram_fifo_v1_00_a_m_11814169214117146701_0669453987", "isim/isim_system_axisim.sim/nf10_sram_fifo_v1_00_a/m_11814169214117146701_0669453987.didat");
	xsi_register_executes(pe);
}
