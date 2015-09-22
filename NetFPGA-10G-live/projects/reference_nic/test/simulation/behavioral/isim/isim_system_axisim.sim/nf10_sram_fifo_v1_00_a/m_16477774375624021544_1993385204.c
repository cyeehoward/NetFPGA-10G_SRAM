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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/std/pcores/nf10_sram_fifo_v1_00_a/hdl/verilog/r_w_ctrl.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U};
static int ng3[] = {0, 0};
static int ng4[] = {200, 0};
static int ng5[] = {202, 0};
static int ng6[] = {201, 0};
static int ng7[] = {203, 0};
static int ng8[] = {215, 0};
static int ng9[] = {204, 0};
static unsigned int ng10[] = {1U, 0U};
static int ng11[] = {18, 0};
static int ng12[] = {17, 0};
static int ng13[] = {16, 0};
static int ng14[] = {1, 0};
static int ng15[] = {5, 0};



static void Always_127_0(char *t0)
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

LAB0:    t1 = (t0 + 11992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 14296);
    *((int *)t2) = 1;
    t3 = (t0 + 12024);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(128, ng0);

LAB5:    xsi_set_current_line(129, ng0);
    t4 = (t0 + 2840U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(144, ng0);

LAB10:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 8360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5960);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 6280);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8520);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 9320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6440);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 216, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 9480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6600);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 9640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6760);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 9000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6920);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 9160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7080);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 9960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6120);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 7560);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7720);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 7880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8040);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 7240);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7400);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 17, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(130, ng0);

LAB9:    xsi_set_current_line(131, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5960);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6440);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 216, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6600);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6760);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6120);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7080);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7400);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    goto LAB8;

}

static void Always_162_1(char *t0)
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

LAB0:    t1 = (t0 + 12240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 14312);
    *((int *)t2) = 1;
    t3 = (t0 + 12272);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(163, ng0);

LAB5:    xsi_set_current_line(164, ng0);
    t4 = (t0 + 2840U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(169, ng0);

LAB10:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(165, ng0);

LAB9:    goto LAB8;

}

static void Always_162_2(char *t0)
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

LAB0:    t1 = (t0 + 12488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 14328);
    *((int *)t2) = 1;
    t3 = (t0 + 12520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(163, ng0);

LAB5:    xsi_set_current_line(164, ng0);
    t4 = (t0 + 2840U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(169, ng0);

LAB10:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(165, ng0);

LAB9:    goto LAB8;

}

static void Always_162_3(char *t0)
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

LAB0:    t1 = (t0 + 12736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 14344);
    *((int *)t2) = 1;
    t3 = (t0 + 12768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(163, ng0);

LAB5:    xsi_set_current_line(164, ng0);
    t4 = (t0 + 2840U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(169, ng0);

LAB10:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(165, ng0);

LAB9:    goto LAB8;

}

static void Always_162_4(char *t0)
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

LAB0:    t1 = (t0 + 12984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 14360);
    *((int *)t2) = 1;
    t3 = (t0 + 13016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(163, ng0);

LAB5:    xsi_set_current_line(164, ng0);
    t4 = (t0 + 2840U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(169, ng0);

LAB10:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(165, ng0);

LAB9:    goto LAB8;

}

static void Cont_181_5(char *t0)
{
    char t3[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
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
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;

LAB0:    t1 = (t0 + 13232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(181, ng0);
    t2 = (t0 + 4920U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 7U);
    if (t9 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t11 = ((char*)((ng3)));
    memset(t12, 0, 8);
    t13 = (t3 + 4);
    t14 = (t11 + 4);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t11);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t13);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = (t17 | t20);
    t22 = *((unsigned int *)t13);
    t23 = *((unsigned int *)t14);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB11;

LAB8:    if (t24 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t12) = 1;

LAB11:    t28 = (t0 + 14504);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memset(t32, 0, 8);
    t33 = 1U;
    t34 = t33;
    t35 = (t12 + 4);
    t36 = *((unsigned int *)t12);
    t33 = (t33 & t36);
    t37 = *((unsigned int *)t35);
    t34 = (t34 & t37);
    t38 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t39 | t33);
    t40 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t40 | t34);
    xsi_driver_vfirst_trans(t28, 0, 0);
    t41 = (t0 + 14376);
    *((int *)t41) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB10:    t27 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB11;

}

static void Cont_182_6(char *t0)
{
    char t4[8];
    char t18[8];
    char t26[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;

LAB0:    t1 = (t0 + 13480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 5080U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t3);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t11 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t11);
    t14 = (t12 || t13);
    if (t14 > 0)
        goto LAB8;

LAB9:    memcpy(t26, t4, 8);

LAB10:    t58 = (t0 + 14568);
    t59 = (t58 + 56U);
    t60 = *((char **)t59);
    t61 = (t60 + 56U);
    t62 = *((char **)t61);
    memset(t62, 0, 8);
    t63 = 1U;
    t64 = t63;
    t65 = (t26 + 4);
    t66 = *((unsigned int *)t26);
    t63 = (t63 & t66);
    t67 = *((unsigned int *)t65);
    t64 = (t64 & t67);
    t68 = (t62 + 4);
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t69 | t63);
    t70 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t70 | t64);
    xsi_driver_vfirst_trans(t58, 0, 0);
    t71 = (t0 + 14392);
    *((int *)t71) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t15 = (t0 + 8840);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t17);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t19) != 0)
        goto LAB13;

LAB14:    t27 = *((unsigned int *)t4);
    t28 = *((unsigned int *)t18);
    t29 = (t27 & t28);
    *((unsigned int *)t26) = t29;
    t30 = (t4 + 4);
    t31 = (t18 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB10;

LAB11:    *((unsigned int *)t18) = 1;
    goto LAB14;

LAB13:    t25 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB14;

LAB15:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    t40 = (t4 + 4);
    t41 = (t18 + 4);
    t42 = *((unsigned int *)t4);
    t43 = (~(t42));
    t44 = *((unsigned int *)t40);
    t45 = (~(t44));
    t46 = *((unsigned int *)t18);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t50 = (t43 & t45);
    t51 = (t47 & t49);
    t52 = (~(t50));
    t53 = (~(t51));
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t52);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t53);
    t56 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t56 & t52);
    t57 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t57 & t53);
    goto LAB17;

}

static void Always_201_7(char *t0)
{
    char t6[56];
    char t7[8];
    char t15[8];
    char t16[8];
    char t52[8];
    char t92[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    char *t21;
    int t22;
    int t23;
    char *t24;
    int t25;
    int t26;
    int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
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
    char *t51;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    char *t107;

LAB0:    t1 = (t0 + 13728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 14408);
    *((int *)t2) = 1;
    t3 = (t0 + 13760);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(204, ng0);

LAB5:    xsi_set_current_line(205, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 8360);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(206, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(207, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(208, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 19);
    xsi_set_current_line(210, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9000);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 19);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 4760U);
    t3 = *((char **)t2);
    xsi_vlog_get_part_select_value(t6, 201, t3, 200, 0);
    t2 = (t0 + 5640);
    xsi_vlogvar_assign_value(t2, t6, 0, 0, 201);
    xsi_set_current_line(212, ng0);
    t2 = (t0 + 4760U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t4 = (t3 + 48);
    t5 = (t3 + 52);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 9);
    *((unsigned int *)t7) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 9);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t12 & 3U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 3U);
    t14 = (t0 + 5480);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 2);
    xsi_set_current_line(213, ng0);
    t2 = (t0 + 3640U);
    t3 = *((char **)t2);
    t2 = (t0 + 9320);
    t4 = (t0 + 9320);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t17 = ((char*)((ng4)));
    t18 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t7, t15, t16, ((int*)(t14)), 2, t17, 32, 1, t18, 32, 1);
    t19 = (t7 + 4);
    t8 = *((unsigned int *)t19);
    t20 = (!(t8));
    t21 = (t15 + 4);
    t9 = *((unsigned int *)t21);
    t22 = (!(t9));
    t23 = (t20 && t22);
    t24 = (t16 + 4);
    t10 = *((unsigned int *)t24);
    t25 = (!(t10));
    t26 = (t23 && t25);
    if (t26 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(214, ng0);
    t2 = (t0 + 3480U);
    t3 = *((char **)t2);
    t2 = (t0 + 9320);
    t4 = (t0 + 9320);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t17 = ((char*)((ng5)));
    t18 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t7, t15, t16, ((int*)(t14)), 2, t17, 32, 1, t18, 32, 1);
    t19 = (t7 + 4);
    t8 = *((unsigned int *)t19);
    t20 = (!(t8));
    t21 = (t15 + 4);
    t9 = *((unsigned int *)t21);
    t22 = (!(t9));
    t23 = (t20 && t22);
    t24 = (t16 + 4);
    t10 = *((unsigned int *)t24);
    t25 = (!(t10));
    t26 = (t23 && t25);
    if (t26 == 1)
        goto LAB8;

LAB9:    xsi_set_current_line(215, ng0);
    t2 = (t0 + 3960U);
    t3 = *((char **)t2);
    t2 = (t0 + 9320);
    t4 = (t0 + 9320);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t17 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t7, t14, 2, t17, 32, 1);
    t18 = (t7 + 4);
    t8 = *((unsigned int *)t18);
    t20 = (!(t8));
    if (t20 == 1)
        goto LAB10;

LAB11:    xsi_set_current_line(216, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9320);
    t4 = (t0 + 9320);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t17 = ((char*)((ng8)));
    t18 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t7, t15, t16, ((int*)(t14)), 2, t17, 32, 1, t18, 32, 1);
    t19 = (t7 + 4);
    t8 = *((unsigned int *)t19);
    t20 = (!(t8));
    t21 = (t15 + 4);
    t9 = *((unsigned int *)t21);
    t22 = (!(t9));
    t23 = (t20 && t22);
    t24 = (t16 + 4);
    t10 = *((unsigned int *)t24);
    t25 = (!(t10));
    t26 = (t23 && t25);
    if (t26 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(217, ng0);
    t2 = (t0 + 4760U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t4 = (t3 + 48);
    t5 = (t3 + 52);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 11);
    t10 = (t9 & 1);
    *((unsigned int *)t7) = t10;
    t11 = *((unsigned int *)t5);
    t12 = (t11 >> 11);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    t14 = (t0 + 8840);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 1);
    xsi_set_current_line(218, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(219, ng0);
    t2 = (t0 + 7400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7240);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 17);
    xsi_set_current_line(225, ng0);
    t2 = (t0 + 3160U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t2) != 0)
        goto LAB16;

LAB17:    t5 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t30 = *((unsigned int *)t5);
    t31 = (t13 || t30);
    if (t31 > 0)
        goto LAB18;

LAB19:    memcpy(t52, t7, 8);

LAB20:    t82 = (t52 + 4);
    t83 = *((unsigned int *)t82);
    t84 = (~(t83));
    t85 = *((unsigned int *)t52);
    t86 = (t85 & t84);
    t87 = (t86 != 0);
    if (t87 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(243, ng0);

LAB56:    xsi_set_current_line(244, ng0);
    t2 = (t0 + 7720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7560);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);

LAB34:    xsi_set_current_line(249, ng0);
    t2 = (t0 + 3960U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB57;

LAB58:    if (*((unsigned int *)t2) != 0)
        goto LAB59;

LAB60:    t5 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t30 = *((unsigned int *)t5);
    t31 = (t13 || t30);
    if (t31 > 0)
        goto LAB61;

LAB62:    memcpy(t52, t7, 8);

LAB63:    t82 = (t52 + 4);
    t84 = *((unsigned int *)t82);
    t85 = (~(t84));
    t86 = *((unsigned int *)t52);
    t87 = (t86 & t85);
    t93 = (t87 != 0);
    if (t93 > 0)
        goto LAB77;

LAB78:    xsi_set_current_line(265, ng0);

LAB97:    xsi_set_current_line(266, ng0);
    t2 = (t0 + 8040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9480);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);

LAB79:    xsi_set_current_line(271, ng0);
    t2 = (t0 + 9160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB98;

LAB99:    if (*((unsigned int *)t5) != 0)
        goto LAB100;

LAB101:    t17 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t30 = *((unsigned int *)t17);
    t31 = (t13 || t30);
    if (t31 > 0)
        goto LAB102;

LAB103:    memcpy(t52, t7, 8);

LAB104:    t89 = (t52 + 4);
    t84 = *((unsigned int *)t89);
    t85 = (~(t84));
    t86 = *((unsigned int *)t52);
    t87 = (t86 & t85);
    t93 = (t87 != 0);
    if (t93 > 0)
        goto LAB118;

LAB119:
LAB120:    xsi_set_current_line(275, ng0);
    t2 = (t0 + 8680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB122;

LAB123:    if (*((unsigned int *)t5) != 0)
        goto LAB124;

LAB125:    t17 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t30 = *((unsigned int *)t17);
    t31 = (t13 || t30);
    if (t31 > 0)
        goto LAB126;

LAB127:    memcpy(t52, t7, 8);

LAB128:    t89 = (t52 + 4);
    t84 = *((unsigned int *)t89);
    t85 = (~(t84));
    t86 = *((unsigned int *)t52);
    t87 = (t86 & t85);
    t93 = (t87 != 0);
    if (t93 > 0)
        goto LAB142;

LAB143:
LAB144:    xsi_set_current_line(279, ng0);
    t2 = (t0 + 8680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9640);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB2;

LAB6:    t11 = *((unsigned int *)t16);
    t27 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t28 = (t12 - t13);
    t29 = (t28 + 1);
    xsi_vlogvar_assign_value(t2, t3, t27, *((unsigned int *)t15), t29);
    goto LAB7;

LAB8:    t11 = *((unsigned int *)t16);
    t27 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t28 = (t12 - t13);
    t29 = (t28 + 1);
    xsi_vlogvar_assign_value(t2, t3, t27, *((unsigned int *)t15), t29);
    goto LAB9;

LAB10:    xsi_vlogvar_assign_value(t2, t3, 0, *((unsigned int *)t7), 1);
    goto LAB11;

LAB12:    t11 = *((unsigned int *)t16);
    t27 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t28 = (t12 - t13);
    t29 = (t28 + 1);
    xsi_vlogvar_assign_value(t3, t2, t27, *((unsigned int *)t15), t29);
    goto LAB13;

LAB14:    *((unsigned int *)t7) = 1;
    goto LAB17;

LAB16:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB17;

LAB18:    t14 = (t0 + 5960);
    t17 = (t14 + 56U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng3)));
    memset(t15, 0, 8);
    t21 = (t18 + 4);
    t24 = (t19 + 4);
    t32 = *((unsigned int *)t18);
    t33 = *((unsigned int *)t19);
    t34 = (t32 ^ t33);
    t35 = *((unsigned int *)t21);
    t36 = *((unsigned int *)t24);
    t37 = (t35 ^ t36);
    t38 = (t34 | t37);
    t39 = *((unsigned int *)t21);
    t40 = *((unsigned int *)t24);
    t41 = (t39 | t40);
    t42 = (~(t41));
    t43 = (t38 & t42);
    if (t43 != 0)
        goto LAB24;

LAB21:    if (t41 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t15) = 1;

LAB24:    memset(t16, 0, 8);
    t45 = (t15 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t15);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t45) != 0)
        goto LAB27;

LAB28:    t53 = *((unsigned int *)t7);
    t54 = *((unsigned int *)t16);
    t55 = (t53 & t54);
    *((unsigned int *)t52) = t55;
    t56 = (t7 + 4);
    t57 = (t16 + 4);
    t58 = (t52 + 4);
    t59 = *((unsigned int *)t56);
    t60 = *((unsigned int *)t57);
    t61 = (t59 | t60);
    *((unsigned int *)t58) = t61;
    t62 = *((unsigned int *)t58);
    t63 = (t62 != 0);
    if (t63 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB20;

LAB23:    t44 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t16) = 1;
    goto LAB28;

LAB27:    t51 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB28;

LAB29:    t64 = *((unsigned int *)t52);
    t65 = *((unsigned int *)t58);
    *((unsigned int *)t52) = (t64 | t65);
    t66 = (t7 + 4);
    t67 = (t16 + 4);
    t68 = *((unsigned int *)t7);
    t69 = (~(t68));
    t70 = *((unsigned int *)t66);
    t71 = (~(t70));
    t72 = *((unsigned int *)t16);
    t73 = (~(t72));
    t74 = *((unsigned int *)t67);
    t75 = (~(t74));
    t20 = (t69 & t71);
    t22 = (t73 & t75);
    t76 = (~(t20));
    t77 = (~(t22));
    t78 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t78 & t76);
    t79 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t79 & t77);
    t80 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t80 & t76);
    t81 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t81 & t77);
    goto LAB31;

LAB32:    xsi_set_current_line(226, ng0);

LAB35:    xsi_set_current_line(227, ng0);
    t88 = (t0 + 7720);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    t91 = (t0 + 9000);
    xsi_vlogvar_assign_value(t91, t90, 0, 0, 19);
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 5800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB39;

LAB37:    if (*((unsigned int *)t5) == 0)
        goto LAB36;

LAB38:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;

LAB39:    t17 = (t7 + 4);
    t13 = *((unsigned int *)t17);
    t30 = (~(t13));
    t31 = *((unsigned int *)t7);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(238, ng0);

LAB55:    xsi_set_current_line(239, ng0);
    t2 = (t0 + 7720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7560);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);

LAB42:    goto LAB34;

LAB36:    *((unsigned int *)t7) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(229, ng0);

LAB43:    xsi_set_current_line(230, ng0);
    t18 = ((char*)((ng10)));
    t19 = (t0 + 9160);
    xsi_vlogvar_assign_value(t19, t18, 0, 0, 1);
    xsi_set_current_line(231, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 8200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(232, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7560);
    t4 = (t0 + 7560);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t17 = ((char*)((ng11)));
    t18 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t7, t15, t16, ((int*)(t14)), 2, t17, 32, 1, t18, 32, 1);
    t19 = (t7 + 4);
    t8 = *((unsigned int *)t19);
    t20 = (!(t8));
    t21 = (t15 + 4);
    t9 = *((unsigned int *)t21);
    t22 = (!(t9));
    t23 = (t20 && t22);
    t24 = (t16 + 4);
    t10 = *((unsigned int *)t24);
    t25 = (!(t10));
    t26 = (t23 && t25);
    if (t26 == 1)
        goto LAB44;

LAB45:    xsi_set_current_line(233, ng0);
    t2 = (t0 + 7720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t14 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t7) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t12 & 131071U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 131071U);
    t17 = ((char*)((ng10)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 17, t7, 17, t17, 17);
    t18 = (t0 + 7560);
    t19 = (t0 + 7560);
    t21 = (t19 + 72U);
    t24 = *((char **)t21);
    t44 = ((char*)((ng13)));
    t45 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t16, t52, t92, ((int*)(t24)), 2, t44, 32, 1, t45, 32, 1);
    t51 = (t16 + 4);
    t30 = *((unsigned int *)t51);
    t20 = (!(t30));
    t56 = (t52 + 4);
    t31 = *((unsigned int *)t56);
    t22 = (!(t31));
    t23 = (t20 && t22);
    t57 = (t92 + 4);
    t32 = *((unsigned int *)t57);
    t25 = (!(t32));
    t26 = (t23 && t25);
    if (t26 == 1)
        goto LAB46;

LAB47:    xsi_set_current_line(234, ng0);
    t2 = (t0 + 5960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t14 = (t4 + 4);
    t17 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t14);
    t12 = *((unsigned int *)t17);
    t13 = (t11 ^ t12);
    t30 = (t10 | t13);
    t31 = *((unsigned int *)t14);
    t32 = *((unsigned int *)t17);
    t33 = (t31 | t32);
    t34 = (~(t33));
    t35 = (t30 & t34);
    if (t35 != 0)
        goto LAB51;

LAB48:    if (t33 != 0)
        goto LAB50;

LAB49:    *((unsigned int *)t7) = 1;

LAB51:    t19 = (t7 + 4);
    t36 = *((unsigned int *)t19);
    t37 = (~(t36));
    t38 = *((unsigned int *)t7);
    t39 = (t38 & t37);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB52;

LAB53:
LAB54:    goto LAB42;

LAB44:    t11 = *((unsigned int *)t16);
    t27 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t15);
    t28 = (t12 - t13);
    t29 = (t28 + 1);
    xsi_vlogvar_assign_value(t3, t2, t27, *((unsigned int *)t15), t29);
    goto LAB45;

LAB46:    t33 = *((unsigned int *)t92);
    t27 = (t33 + 0);
    t34 = *((unsigned int *)t16);
    t35 = *((unsigned int *)t52);
    t28 = (t34 - t35);
    t29 = (t28 + 1);
    xsi_vlogvar_assign_value(t18, t15, t27, *((unsigned int *)t52), t29);
    goto LAB47;

LAB50:    t18 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB51;

LAB52:    xsi_set_current_line(235, ng0);
    t21 = ((char*)((ng10)));
    t24 = (t0 + 8360);
    xsi_vlogvar_assign_value(t24, t21, 0, 0, 1);
    goto LAB54;

LAB57:    *((unsigned int *)t7) = 1;
    goto LAB60;

LAB59:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB60;

LAB61:    t14 = (t0 + 8520);
    t17 = (t14 + 56U);
    t18 = *((char **)t17);
    memset(t15, 0, 8);
    t19 = (t18 + 4);
    t32 = *((unsigned int *)t19);
    t33 = (~(t32));
    t34 = *((unsigned int *)t18);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB67;

LAB65:    if (*((unsigned int *)t19) == 0)
        goto LAB64;

LAB66:    t21 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t21) = 1;

LAB67:    t24 = (t15 + 4);
    t44 = (t18 + 4);
    t37 = *((unsigned int *)t18);
    t38 = (~(t37));
    *((unsigned int *)t15) = t38;
    *((unsigned int *)t24) = 0;
    if (*((unsigned int *)t44) != 0)
        goto LAB69;

LAB68:    t43 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t43 & 1U);
    t46 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t46 & 1U);
    memset(t16, 0, 8);
    t45 = (t15 + 4);
    t47 = *((unsigned int *)t45);
    t48 = (~(t47));
    t49 = *((unsigned int *)t15);
    t50 = (t49 & t48);
    t53 = (t50 & 1U);
    if (t53 != 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t45) != 0)
        goto LAB72;

LAB73:    t54 = *((unsigned int *)t7);
    t55 = *((unsigned int *)t16);
    t59 = (t54 & t55);
    *((unsigned int *)t52) = t59;
    t56 = (t7 + 4);
    t57 = (t16 + 4);
    t58 = (t52 + 4);
    t60 = *((unsigned int *)t56);
    t61 = *((unsigned int *)t57);
    t62 = (t60 | t61);
    *((unsigned int *)t58) = t62;
    t63 = *((unsigned int *)t58);
    t64 = (t63 != 0);
    if (t64 == 1)
        goto LAB74;

LAB75:
LAB76:    goto LAB63;

LAB64:    *((unsigned int *)t15) = 1;
    goto LAB67;

LAB69:    t39 = *((unsigned int *)t15);
    t40 = *((unsigned int *)t44);
    *((unsigned int *)t15) = (t39 | t40);
    t41 = *((unsigned int *)t24);
    t42 = *((unsigned int *)t44);
    *((unsigned int *)t24) = (t41 | t42);
    goto LAB68;

LAB70:    *((unsigned int *)t16) = 1;
    goto LAB73;

LAB72:    t51 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB73;

LAB74:    t65 = *((unsigned int *)t52);
    t68 = *((unsigned int *)t58);
    *((unsigned int *)t52) = (t65 | t68);
    t66 = (t7 + 4);
    t67 = (t16 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t66);
    t72 = (~(t71));
    t73 = *((unsigned int *)t16);
    t74 = (~(t73));
    t75 = *((unsigned int *)t67);
    t76 = (~(t75));
    t20 = (t70 & t72);
    t22 = (t74 & t76);
    t77 = (~(t20));
    t78 = (~(t22));
    t79 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t79 & t77);
    t80 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t80 & t78);
    t81 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t81 & t77);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t78);
    goto LAB76;

LAB77:    xsi_set_current_line(250, ng0);

LAB80:    xsi_set_current_line(251, ng0);
    t88 = (t0 + 6120);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    memset(t92, 0, 8);
    t91 = (t90 + 4);
    t94 = *((unsigned int *)t91);
    t95 = (~(t94));
    t96 = *((unsigned int *)t90);
    t97 = (t96 & t95);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB84;

LAB82:    if (*((unsigned int *)t91) == 0)
        goto LAB81;

LAB83:    t99 = (t92 + 4);
    *((unsigned int *)t92) = 1;
    *((unsigned int *)t99) = 1;

LAB84:    t100 = (t92 + 4);
    t101 = *((unsigned int *)t100);
    t102 = (~(t101));
    t103 = *((unsigned int *)t92);
    t104 = (t103 & t102);
    t105 = (t104 != 0);
    if (t105 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(259, ng0);

LAB96:    xsi_set_current_line(260, ng0);
    t2 = (t0 + 8040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9480);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);
    xsi_set_current_line(261, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB87:    goto LAB79;

LAB81:    *((unsigned int *)t92) = 1;
    goto LAB84;

LAB85:    xsi_set_current_line(252, ng0);

LAB88:    xsi_set_current_line(253, ng0);
    t106 = (t0 + 3800U);
    t107 = *((char **)t106);
    t106 = (t0 + 9480);
    xsi_vlogvar_assign_value(t106, t107, 0, 0, 19);
    xsi_set_current_line(254, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 8680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(255, ng0);
    t2 = (t0 + 8520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t14 = (t4 + 4);
    t17 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t14);
    t12 = *((unsigned int *)t17);
    t13 = (t11 ^ t12);
    t30 = (t10 | t13);
    t31 = *((unsigned int *)t14);
    t32 = *((unsigned int *)t17);
    t33 = (t31 | t32);
    t34 = (~(t33));
    t35 = (t30 & t34);
    if (t35 != 0)
        goto LAB92;

LAB89:    if (t33 != 0)
        goto LAB91;

LAB90:    *((unsigned int *)t7) = 1;

LAB92:    t19 = (t7 + 4);
    t36 = *((unsigned int *)t19);
    t37 = (~(t36));
    t38 = *((unsigned int *)t7);
    t39 = (t38 & t37);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB93;

LAB94:
LAB95:    goto LAB87;

LAB91:    t18 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB92;

LAB93:    xsi_set_current_line(256, ng0);
    t21 = ((char*)((ng10)));
    t24 = (t0 + 6280);
    xsi_vlogvar_assign_value(t24, t21, 0, 0, 1);
    goto LAB95;

LAB98:    *((unsigned int *)t7) = 1;
    goto LAB101;

LAB100:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB101;

LAB102:    t18 = (t0 + 8680);
    t19 = (t18 + 56U);
    t21 = *((char **)t19);
    memset(t15, 0, 8);
    t24 = (t21 + 4);
    t32 = *((unsigned int *)t24);
    t33 = (~(t32));
    t34 = *((unsigned int *)t21);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB108;

LAB106:    if (*((unsigned int *)t24) == 0)
        goto LAB105;

LAB107:    t44 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t44) = 1;

LAB108:    t45 = (t15 + 4);
    t51 = (t21 + 4);
    t37 = *((unsigned int *)t21);
    t38 = (~(t37));
    *((unsigned int *)t15) = t38;
    *((unsigned int *)t45) = 0;
    if (*((unsigned int *)t51) != 0)
        goto LAB110;

LAB109:    t43 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t43 & 1U);
    t46 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t46 & 1U);
    memset(t16, 0, 8);
    t56 = (t15 + 4);
    t47 = *((unsigned int *)t56);
    t48 = (~(t47));
    t49 = *((unsigned int *)t15);
    t50 = (t49 & t48);
    t53 = (t50 & 1U);
    if (t53 != 0)
        goto LAB111;

LAB112:    if (*((unsigned int *)t56) != 0)
        goto LAB113;

LAB114:    t54 = *((unsigned int *)t7);
    t55 = *((unsigned int *)t16);
    t59 = (t54 & t55);
    *((unsigned int *)t52) = t59;
    t58 = (t7 + 4);
    t66 = (t16 + 4);
    t67 = (t52 + 4);
    t60 = *((unsigned int *)t58);
    t61 = *((unsigned int *)t66);
    t62 = (t60 | t61);
    *((unsigned int *)t67) = t62;
    t63 = *((unsigned int *)t67);
    t64 = (t63 != 0);
    if (t64 == 1)
        goto LAB115;

LAB116:
LAB117:    goto LAB104;

LAB105:    *((unsigned int *)t15) = 1;
    goto LAB108;

LAB110:    t39 = *((unsigned int *)t15);
    t40 = *((unsigned int *)t51);
    *((unsigned int *)t15) = (t39 | t40);
    t41 = *((unsigned int *)t45);
    t42 = *((unsigned int *)t51);
    *((unsigned int *)t45) = (t41 | t42);
    goto LAB109;

LAB111:    *((unsigned int *)t16) = 1;
    goto LAB114;

LAB113:    t57 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB114;

LAB115:    t65 = *((unsigned int *)t52);
    t68 = *((unsigned int *)t67);
    *((unsigned int *)t52) = (t65 | t68);
    t82 = (t7 + 4);
    t88 = (t16 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t82);
    t72 = (~(t71));
    t73 = *((unsigned int *)t16);
    t74 = (~(t73));
    t75 = *((unsigned int *)t88);
    t76 = (~(t75));
    t20 = (t70 & t72);
    t22 = (t74 & t76);
    t77 = (~(t20));
    t78 = (~(t22));
    t79 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t79 & t77);
    t80 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t80 & t78);
    t81 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t81 & t77);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t78);
    goto LAB117;

LAB118:    xsi_set_current_line(272, ng0);

LAB121:    xsi_set_current_line(273, ng0);
    t90 = (t0 + 7400);
    t91 = (t90 + 56U);
    t99 = *((char **)t91);
    t100 = ((char*)((ng14)));
    memset(t92, 0, 8);
    xsi_vlog_unsigned_minus(t92, 32, t99, 17, t100, 32);
    t106 = (t0 + 7240);
    xsi_vlogvar_assign_value(t106, t92, 0, 0, 17);
    goto LAB120;

LAB122:    *((unsigned int *)t7) = 1;
    goto LAB125;

LAB124:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB125;

LAB126:    t18 = (t0 + 9160);
    t19 = (t18 + 56U);
    t21 = *((char **)t19);
    memset(t15, 0, 8);
    t24 = (t21 + 4);
    t32 = *((unsigned int *)t24);
    t33 = (~(t32));
    t34 = *((unsigned int *)t21);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB132;

LAB130:    if (*((unsigned int *)t24) == 0)
        goto LAB129;

LAB131:    t44 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t44) = 1;

LAB132:    t45 = (t15 + 4);
    t51 = (t21 + 4);
    t37 = *((unsigned int *)t21);
    t38 = (~(t37));
    *((unsigned int *)t15) = t38;
    *((unsigned int *)t45) = 0;
    if (*((unsigned int *)t51) != 0)
        goto LAB134;

LAB133:    t43 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t43 & 1U);
    t46 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t46 & 1U);
    memset(t16, 0, 8);
    t56 = (t15 + 4);
    t47 = *((unsigned int *)t56);
    t48 = (~(t47));
    t49 = *((unsigned int *)t15);
    t50 = (t49 & t48);
    t53 = (t50 & 1U);
    if (t53 != 0)
        goto LAB135;

LAB136:    if (*((unsigned int *)t56) != 0)
        goto LAB137;

LAB138:    t54 = *((unsigned int *)t7);
    t55 = *((unsigned int *)t16);
    t59 = (t54 & t55);
    *((unsigned int *)t52) = t59;
    t58 = (t7 + 4);
    t66 = (t16 + 4);
    t67 = (t52 + 4);
    t60 = *((unsigned int *)t58);
    t61 = *((unsigned int *)t66);
    t62 = (t60 | t61);
    *((unsigned int *)t67) = t62;
    t63 = *((unsigned int *)t67);
    t64 = (t63 != 0);
    if (t64 == 1)
        goto LAB139;

LAB140:
LAB141:    goto LAB128;

LAB129:    *((unsigned int *)t15) = 1;
    goto LAB132;

LAB134:    t39 = *((unsigned int *)t15);
    t40 = *((unsigned int *)t51);
    *((unsigned int *)t15) = (t39 | t40);
    t41 = *((unsigned int *)t45);
    t42 = *((unsigned int *)t51);
    *((unsigned int *)t45) = (t41 | t42);
    goto LAB133;

LAB135:    *((unsigned int *)t16) = 1;
    goto LAB138;

LAB137:    t57 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB138;

LAB139:    t65 = *((unsigned int *)t52);
    t68 = *((unsigned int *)t67);
    *((unsigned int *)t52) = (t65 | t68);
    t82 = (t7 + 4);
    t88 = (t16 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t82);
    t72 = (~(t71));
    t73 = *((unsigned int *)t16);
    t74 = (~(t73));
    t75 = *((unsigned int *)t88);
    t76 = (~(t75));
    t20 = (t70 & t72);
    t22 = (t74 & t76);
    t77 = (~(t20));
    t78 = (~(t22));
    t79 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t79 & t77);
    t80 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t80 & t78);
    t81 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t81 & t77);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t78);
    goto LAB141;

LAB142:    xsi_set_current_line(276, ng0);

LAB145:    xsi_set_current_line(277, ng0);
    t90 = (t0 + 7400);
    t91 = (t90 + 56U);
    t99 = *((char **)t91);
    t100 = ((char*)((ng14)));
    memset(t92, 0, 8);
    xsi_vlog_unsigned_add(t92, 32, t99, 17, t100, 32);
    t106 = (t0 + 7240);
    xsi_vlogvar_assign_value(t106, t92, 0, 0, 17);
    goto LAB144;

}

static void Always_284_8(char *t0)
{
    char t8[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 13976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(284, ng0);
    t2 = (t0 + 14424);
    *((int *)t2) = 1;
    t3 = (t0 + 14008);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(285, ng0);

LAB5:    xsi_set_current_line(286, ng0);
    t4 = (t0 + 7400);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng3)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t24 = (t0 + 5800);
    xsi_vlogvar_assign_value(t24, t8, 0, 0, 1);
    xsi_set_current_line(287, ng0);
    t2 = (t0 + 7400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1696);
    t6 = *((char **)t5);
    t5 = ((char*)((ng15)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_minus(t8, 32, t6, 32, t5, 32);
    memset(t25, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB11;

LAB10:    t9 = (t8 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t4) < *((unsigned int *)t8))
        goto LAB13;

LAB12:    *((unsigned int *)t25) = 1;

LAB13:    t23 = (t0 + 9960);
    xsi_vlogvar_assign_value(t23, t25, 0, 0, 1);
    goto LAB2;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB11:    t10 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB13;

}


extern void nf10_sram_fifo_v1_00_a_m_16477774375624021544_1993385204_init()
{
	static char *pe[] = {(void *)Always_127_0,(void *)Always_162_1,(void *)Always_162_2,(void *)Always_162_3,(void *)Always_162_4,(void *)Cont_181_5,(void *)Cont_182_6,(void *)Always_201_7,(void *)Always_284_8};
	xsi_register_didat("nf10_sram_fifo_v1_00_a_m_16477774375624021544_1993385204", "isim/isim_system_axisim.sim/nf10_sram_fifo_v1_00_a/m_16477774375624021544_1993385204.didat");
	xsi_register_executes(pe);
}
