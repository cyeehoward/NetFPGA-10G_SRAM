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
static int ng4[] = {1, 0};
static unsigned int ng5[] = {1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U};
static int ng6[] = {200, 0};
static int ng7[] = {202, 0};
static int ng8[] = {201, 0};
static unsigned int ng9[] = {1U, 0U};
static int ng10[] = {203, 0};
static int ng11[] = {215, 0};
static int ng12[] = {204, 0};
static unsigned int ng13[] = {46U, 0U};
static int ng14[] = {5, 0};



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

LAB0:    t1 = (t0 + 13112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 14920);
    *((int *)t2) = 1;
    t3 = (t0 + 13144);
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
    t2 = (t0 + 8840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6440);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 6760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 9800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6920);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 216, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 9960);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7080);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 10120);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7240);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 9480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7400);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 9640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7560);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 10440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6600);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 8040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8200);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 8360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8520);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 7720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7880);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 17, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(130, ng0);

LAB9:    xsi_set_current_line(131, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6440);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 216, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7080);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7240);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6600);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7400);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7560);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    goto LAB8;

}

static void Cont_166_1(char *t0)
{
    char t4[8];
    char t10[8];
    char t14[8];
    char t43[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
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
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;

LAB0:    t1 = (t0 + 13360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 5240U);
    t3 = *((char **)t2);
    t2 = (t0 + 5200U);
    t5 = (t2 + 72U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng3)));
    xsi_vlog_generic_get_index_select_value(t4, 32, t3, t6, 2, t7, 32, 1);
    t8 = (t0 + 5240U);
    t9 = *((char **)t8);
    t8 = (t0 + 5200U);
    t11 = (t8 + 72U);
    t12 = *((char **)t11);
    t13 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t10, 32, t9, t12, 2, t13, 32, 1);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t10);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = (t4 + 4);
    t19 = (t10 + 4);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t19);
    t23 = (t21 | t22);
    *((unsigned int *)t20) = t23;
    t24 = *((unsigned int *)t20);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB4;

LAB5:
LAB6:    t42 = ((char*)((ng3)));
    memset(t43, 0, 8);
    t44 = (t14 + 4);
    t45 = (t42 + 4);
    t46 = *((unsigned int *)t14);
    t47 = *((unsigned int *)t42);
    t48 = (t46 ^ t47);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = (t48 | t51);
    t53 = *((unsigned int *)t44);
    t54 = *((unsigned int *)t45);
    t55 = (t53 | t54);
    t56 = (~(t55));
    t57 = (t52 & t56);
    if (t57 != 0)
        goto LAB10;

LAB7:    if (t55 != 0)
        goto LAB9;

LAB8:    *((unsigned int *)t43) = 1;

LAB10:    t59 = (t0 + 15096);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memset(t63, 0, 8);
    t64 = 1U;
    t65 = t64;
    t66 = (t43 + 4);
    t67 = *((unsigned int *)t43);
    t64 = (t64 & t67);
    t68 = *((unsigned int *)t66);
    t65 = (t65 & t68);
    t69 = (t63 + 4);
    t70 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t70 | t64);
    t71 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t71 | t65);
    xsi_driver_vfirst_trans(t59, 0, 0);
    t72 = (t0 + 14936);
    *((int *)t72) = 1;

LAB1:    return;
LAB4:    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t14) = (t26 | t27);
    t28 = (t4 + 4);
    t29 = (t10 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (~(t30));
    t32 = *((unsigned int *)t4);
    t33 = (t32 & t31);
    t34 = *((unsigned int *)t29);
    t35 = (~(t34));
    t36 = *((unsigned int *)t10);
    t37 = (t36 & t35);
    t38 = (~(t33));
    t39 = (~(t37));
    t40 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t40 & t38);
    t41 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t41 & t39);
    goto LAB6;

LAB9:    t58 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB10;

}

static void Cont_167_2(char *t0)
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

LAB0:    t1 = (t0 + 13608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 5400U);
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

LAB10:    t58 = (t0 + 15160);
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
    t71 = (t0 + 14952);
    *((int *)t71) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t15 = (t0 + 9320);
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

static void Always_184_3(char *t0)
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

LAB0:    t1 = (t0 + 13856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(184, ng0);
    t2 = (t0 + 14968);
    *((int *)t2) = 1;
    t3 = (t0 + 13888);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(185, ng0);

LAB5:    xsi_set_current_line(186, ng0);
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

LAB7:    xsi_set_current_line(192, ng0);

LAB10:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 5080U);
    t3 = *((char **)t2);
    t2 = (t0 + 11560);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 216, 0LL);
    xsi_set_current_line(194, ng0);
    t2 = (t0 + 5400U);
    t3 = *((char **)t2);
    t2 = (t0 + 11720);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(187, ng0);

LAB9:    xsi_set_current_line(188, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 11560);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 216, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}

static void Always_200_4(char *t0)
{
    char t6[56];
    char t7[8];
    char t19[8];
    char t20[8];
    char t57[8];
    char t89[8];
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
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    char *t32;
    unsigned int t33;
    int t34;
    int t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    int t40;
    int t41;
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
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
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
    char *t68;
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
    unsigned int t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t90;
    char *t91;
    char *t92;
    char *t93;
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

LAB0:    t1 = (t0 + 14104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(200, ng0);
    t2 = (t0 + 14984);
    *((int *)t2) = 1;
    t3 = (t0 + 14136);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(204, ng0);

LAB5:    xsi_set_current_line(205, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 8840);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(206, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6760);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(207, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9640);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(208, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9960);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 19);
    xsi_set_current_line(210, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 19);
    xsi_set_current_line(212, ng0);
    t2 = (t0 + 5080U);
    t3 = *((char **)t2);
    xsi_vlog_get_part_select_value(t6, 201, t3, 200, 0);
    t2 = (t0 + 6120);
    xsi_vlogvar_assign_value(t2, t6, 0, 0, 201);
    xsi_set_current_line(213, ng0);
    t2 = (t0 + 5080U);
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
    t14 = (t0 + 5960);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 2);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 11720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(224, ng0);

LAB18:    xsi_set_current_line(225, ng0);
    t2 = (t0 + 3640U);
    t3 = *((char **)t2);
    t2 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng6)));
    t16 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t7, t19, t20, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t7 + 4);
    t8 = *((unsigned int *)t17);
    t27 = (!(t8));
    t18 = (t19 + 4);
    t9 = *((unsigned int *)t18);
    t30 = (!(t9));
    t31 = (t27 && t30);
    t21 = (t20 + 4);
    t10 = *((unsigned int *)t21);
    t34 = (!(t10));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 3480U);
    t3 = *((char **)t2);
    t2 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng7)));
    t16 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t7, t19, t20, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t7 + 4);
    t8 = *((unsigned int *)t17);
    t27 = (!(t8));
    t18 = (t19 + 4);
    t9 = *((unsigned int *)t18);
    t30 = (!(t9));
    t31 = (t27 && t30);
    t21 = (t20 + 4);
    t10 = *((unsigned int *)t21);
    t34 = (!(t10));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB21;

LAB22:    xsi_set_current_line(227, ng0);
    t2 = (t0 + 3960U);
    t3 = *((char **)t2);
    t2 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng10)));
    xsi_vlog_generic_convert_bit_index(t7, t14, 2, t15, 32, 1);
    t16 = (t7 + 4);
    t8 = *((unsigned int *)t16);
    t27 = (!(t8));
    if (t27 == 1)
        goto LAB23;

LAB24:    xsi_set_current_line(228, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng11)));
    t16 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t7, t19, t20, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t7 + 4);
    t8 = *((unsigned int *)t17);
    t27 = (!(t8));
    t18 = (t19 + 4);
    t9 = *((unsigned int *)t18);
    t30 = (!(t9));
    t31 = (t27 && t30);
    t21 = (t20 + 4);
    t10 = *((unsigned int *)t21);
    t34 = (!(t10));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB25;

LAB26:
LAB8:    xsi_set_current_line(231, ng0);
    t2 = (t0 + 5080U);
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
    t14 = (t0 + 9320);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 1);
    xsi_set_current_line(232, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(233, ng0);
    t2 = (t0 + 7880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7720);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 17);
    xsi_set_current_line(239, ng0);
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
        goto LAB27;

LAB28:    if (*((unsigned int *)t2) != 0)
        goto LAB29;

LAB30:    t5 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t29 = *((unsigned int *)t5);
    t33 = (t13 || t29);
    if (t33 > 0)
        goto LAB31;

LAB32:    memcpy(t57, t7, 8);

LAB33:    t83 = (t57 + 4);
    t84 = *((unsigned int *)t83);
    t85 = (~(t84));
    t86 = *((unsigned int *)t57);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(254, ng0);
    t2 = (t0 + 7240);
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
        goto LAB67;

LAB68:    if (*((unsigned int *)t5) != 0)
        goto LAB69;

LAB70:    t15 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t29 = *((unsigned int *)t15);
    t33 = (t13 || t29);
    if (t33 > 0)
        goto LAB71;

LAB72:    memcpy(t57, t7, 8);

LAB73:    t91 = (t57 + 4);
    t84 = *((unsigned int *)t91);
    t85 = (~(t84));
    t86 = *((unsigned int *)t57);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB87;

LAB88:    xsi_set_current_line(263, ng0);

LAB98:    xsi_set_current_line(264, ng0);
    t2 = (t0 + 8200);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9480);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);

LAB89:
LAB49:    xsi_set_current_line(269, ng0);
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
        goto LAB99;

LAB100:    if (*((unsigned int *)t2) != 0)
        goto LAB101;

LAB102:    t5 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t29 = *((unsigned int *)t5);
    t33 = (t13 || t29);
    if (t33 > 0)
        goto LAB103;

LAB104:    memcpy(t57, t7, 8);

LAB105:    t83 = (t57 + 4);
    t84 = *((unsigned int *)t83);
    t85 = (~(t84));
    t86 = *((unsigned int *)t57);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB119;

LAB120:    xsi_set_current_line(284, ng0);
    t2 = (t0 + 4760U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB139;

LAB140:    if (*((unsigned int *)t2) != 0)
        goto LAB141;

LAB142:    t5 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t29 = *((unsigned int *)t5);
    t33 = (t13 || t29);
    if (t33 > 0)
        goto LAB143;

LAB144:    memcpy(t57, t7, 8);

LAB145:    t83 = (t57 + 4);
    t84 = *((unsigned int *)t83);
    t85 = (~(t84));
    t86 = *((unsigned int *)t57);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB159;

LAB160:    xsi_set_current_line(292, ng0);

LAB170:    xsi_set_current_line(293, ng0);
    t2 = (t0 + 8520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9960);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);

LAB161:
LAB121:    xsi_set_current_line(298, ng0);
    t2 = (t0 + 9640);
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
        goto LAB171;

LAB172:    if (*((unsigned int *)t5) != 0)
        goto LAB173;

LAB174:    t15 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t29 = *((unsigned int *)t15);
    t33 = (t13 || t29);
    if (t33 > 0)
        goto LAB175;

LAB176:    memcpy(t57, t7, 8);

LAB177:    t91 = (t57 + 4);
    t84 = *((unsigned int *)t91);
    t85 = (~(t84));
    t86 = *((unsigned int *)t57);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB191;

LAB192:
LAB193:    xsi_set_current_line(302, ng0);
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
        goto LAB195;

LAB196:    if (*((unsigned int *)t5) != 0)
        goto LAB197;

LAB198:    t15 = (t7 + 4);
    t13 = *((unsigned int *)t7);
    t29 = *((unsigned int *)t15);
    t33 = (t13 || t29);
    if (t33 > 0)
        goto LAB199;

LAB200:    memcpy(t57, t7, 8);

LAB201:    t91 = (t57 + 4);
    t84 = *((unsigned int *)t91);
    t85 = (~(t84));
    t86 = *((unsigned int *)t57);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB215;

LAB216:
LAB217:    xsi_set_current_line(306, ng0);
    t2 = (t0 + 9160);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 10120);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB2;

LAB6:    xsi_set_current_line(216, ng0);

LAB9:    xsi_set_current_line(217, ng0);
    t14 = (t0 + 11560);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng5)));
    xsi_vlog_unsigned_add(t6, 216, t16, 216, t17, 216);
    t18 = (t0 + 9800);
    t21 = (t0 + 9800);
    t22 = (t21 + 72U);
    t23 = *((char **)t22);
    t24 = ((char*)((ng6)));
    t25 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t7, t19, t20, ((int*)(t23)), 2, t24, 32, 1, t25, 32, 1);
    t26 = (t7 + 4);
    t13 = *((unsigned int *)t26);
    t27 = (!(t13));
    t28 = (t19 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    t32 = (t20 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (!(t33));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB10;

LAB11:    xsi_set_current_line(218, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng7)));
    t16 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t7, t19, t20, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t7 + 4);
    t8 = *((unsigned int *)t17);
    t27 = (!(t8));
    t18 = (t19 + 4);
    t9 = *((unsigned int *)t18);
    t30 = (!(t9));
    t31 = (t27 && t30);
    t21 = (t20 + 4);
    t10 = *((unsigned int *)t21);
    t34 = (!(t10));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(219, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng10)));
    xsi_vlog_generic_convert_bit_index(t7, t14, 2, t15, 32, 1);
    t16 = (t7 + 4);
    t8 = *((unsigned int *)t16);
    t27 = (!(t8));
    if (t27 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(220, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9800);
    t4 = (t0 + 9800);
    t5 = (t4 + 72U);
    t14 = *((char **)t5);
    t15 = ((char*)((ng11)));
    t16 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t7, t19, t20, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t7 + 4);
    t8 = *((unsigned int *)t17);
    t27 = (!(t8));
    t18 = (t19 + 4);
    t9 = *((unsigned int *)t18);
    t30 = (!(t9));
    t31 = (t27 && t30);
    t21 = (t20 + 4);
    t10 = *((unsigned int *)t21);
    t34 = (!(t10));
    t35 = (t31 && t34);
    if (t35 == 1)
        goto LAB16;

LAB17:    goto LAB8;

LAB10:    t36 = *((unsigned int *)t20);
    t37 = (t36 + 0);
    t38 = *((unsigned int *)t7);
    t39 = *((unsigned int *)t19);
    t40 = (t38 - t39);
    t41 = (t40 + 1);
    xsi_vlogvar_assign_value(t18, t6, t37, *((unsigned int *)t19), t41);
    goto LAB11;

LAB12:    t11 = *((unsigned int *)t20);
    t37 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t19);
    t40 = (t12 - t13);
    t41 = (t40 + 1);
    xsi_vlogvar_assign_value(t3, t2, t37, *((unsigned int *)t19), t41);
    goto LAB13;

LAB14:    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t7), 1);
    goto LAB15;

LAB16:    t11 = *((unsigned int *)t20);
    t37 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t19);
    t40 = (t12 - t13);
    t41 = (t40 + 1);
    xsi_vlogvar_assign_value(t3, t2, t37, *((unsigned int *)t19), t41);
    goto LAB17;

LAB19:    t11 = *((unsigned int *)t20);
    t37 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t19);
    t40 = (t12 - t13);
    t41 = (t40 + 1);
    xsi_vlogvar_assign_value(t2, t3, t37, *((unsigned int *)t19), t41);
    goto LAB20;

LAB21:    t11 = *((unsigned int *)t20);
    t37 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t19);
    t40 = (t12 - t13);
    t41 = (t40 + 1);
    xsi_vlogvar_assign_value(t2, t3, t37, *((unsigned int *)t19), t41);
    goto LAB22;

LAB23:    xsi_vlogvar_assign_value(t2, t3, 0, *((unsigned int *)t7), 1);
    goto LAB24;

LAB25:    t11 = *((unsigned int *)t20);
    t37 = (t11 + 0);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t19);
    t40 = (t12 - t13);
    t41 = (t40 + 1);
    xsi_vlogvar_assign_value(t3, t2, t37, *((unsigned int *)t19), t41);
    goto LAB26;

LAB27:    *((unsigned int *)t7) = 1;
    goto LAB30;

LAB29:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB30;

LAB31:    t14 = (t0 + 6440);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t19, 0, 8);
    t17 = (t16 + 4);
    t36 = *((unsigned int *)t17);
    t38 = (~(t36));
    t39 = *((unsigned int *)t16);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB37;

LAB35:    if (*((unsigned int *)t17) == 0)
        goto LAB34;

LAB36:    t18 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t18) = 1;

LAB37:    t21 = (t19 + 4);
    t22 = (t16 + 4);
    t44 = *((unsigned int *)t16);
    t45 = (~(t44));
    *((unsigned int *)t19) = t45;
    *((unsigned int *)t21) = 0;
    if (*((unsigned int *)t22) != 0)
        goto LAB39;

LAB38:    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & 1U);
    t51 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t51 & 1U);
    memset(t20, 0, 8);
    t23 = (t19 + 4);
    t52 = *((unsigned int *)t23);
    t53 = (~(t52));
    t54 = *((unsigned int *)t19);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t23) != 0)
        goto LAB42;

LAB43:    t58 = *((unsigned int *)t7);
    t59 = *((unsigned int *)t20);
    t60 = (t58 & t59);
    *((unsigned int *)t57) = t60;
    t25 = (t7 + 4);
    t26 = (t20 + 4);
    t28 = (t57 + 4);
    t61 = *((unsigned int *)t25);
    t62 = *((unsigned int *)t26);
    t63 = (t61 | t62);
    *((unsigned int *)t28) = t63;
    t64 = *((unsigned int *)t28);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB44;

LAB45:
LAB46:    goto LAB33;

LAB34:    *((unsigned int *)t19) = 1;
    goto LAB37;

LAB39:    t46 = *((unsigned int *)t19);
    t47 = *((unsigned int *)t22);
    *((unsigned int *)t19) = (t46 | t47);
    t48 = *((unsigned int *)t21);
    t49 = *((unsigned int *)t22);
    *((unsigned int *)t21) = (t48 | t49);
    goto LAB38;

LAB40:    *((unsigned int *)t20) = 1;
    goto LAB43;

LAB42:    t24 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB43;

LAB44:    t66 = *((unsigned int *)t57);
    t67 = *((unsigned int *)t28);
    *((unsigned int *)t57) = (t66 | t67);
    t32 = (t7 + 4);
    t68 = (t20 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t32);
    t72 = (~(t71));
    t73 = *((unsigned int *)t20);
    t74 = (~(t73));
    t75 = *((unsigned int *)t68);
    t76 = (~(t75));
    t27 = (t70 & t72);
    t30 = (t74 & t76);
    t77 = (~(t27));
    t78 = (~(t30));
    t79 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t79 & t77);
    t80 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t80 & t78);
    t81 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t81 & t77);
    t82 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t82 & t78);
    goto LAB46;

LAB47:    xsi_set_current_line(240, ng0);

LAB50:    xsi_set_current_line(241, ng0);
    t90 = (t0 + 6280);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    memset(t89, 0, 8);
    t93 = (t92 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t92);
    t97 = (t96 & t95);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB54;

LAB52:    if (*((unsigned int *)t93) == 0)
        goto LAB51;

LAB53:    t99 = (t89 + 4);
    *((unsigned int *)t89) = 1;
    *((unsigned int *)t99) = 1;

LAB54:    t100 = (t89 + 4);
    t101 = *((unsigned int *)t100);
    t102 = (~(t101));
    t103 = *((unsigned int *)t89);
    t104 = (t103 & t102);
    t105 = (t104 != 0);
    if (t105 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(250, ng0);

LAB66:    xsi_set_current_line(251, ng0);
    t2 = (t0 + 8200);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9480);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);

LAB57:    goto LAB49;

LAB51:    *((unsigned int *)t89) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(242, ng0);

LAB58:    xsi_set_current_line(243, ng0);
    t106 = ((char*)((ng9)));
    t107 = (t0 + 9640);
    xsi_vlogvar_assign_value(t107, t106, 0, 0, 1);
    xsi_set_current_line(244, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 8680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(245, ng0);
    t2 = (t0 + 12040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng13)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 19, t4, 19, t5, 19);
    t14 = (t0 + 9480);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 19);
    xsi_set_current_line(246, ng0);
    t2 = (t0 + 6440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t14 = (t4 + 4);
    t15 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t14);
    t12 = *((unsigned int *)t15);
    t13 = (t11 ^ t12);
    t29 = (t10 | t13);
    t33 = *((unsigned int *)t14);
    t36 = *((unsigned int *)t15);
    t38 = (t33 | t36);
    t39 = (~(t38));
    t42 = (t29 & t39);
    if (t42 != 0)
        goto LAB62;

LAB59:    if (t38 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t7) = 1;

LAB62:    t17 = (t7 + 4);
    t43 = *((unsigned int *)t17);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB63;

LAB64:
LAB65:    goto LAB57;

LAB61:    t16 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB62;

LAB63:    xsi_set_current_line(247, ng0);
    t18 = ((char*)((ng9)));
    t21 = (t0 + 8840);
    xsi_vlogvar_assign_value(t21, t18, 0, 0, 1);
    goto LAB65;

LAB67:    *((unsigned int *)t7) = 1;
    goto LAB70;

LAB69:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB70;

LAB71:    t16 = (t0 + 6440);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t21 = (t18 + 4);
    t36 = *((unsigned int *)t21);
    t38 = (~(t36));
    t39 = *((unsigned int *)t18);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB77;

LAB75:    if (*((unsigned int *)t21) == 0)
        goto LAB74;

LAB76:    t22 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t22) = 1;

LAB77:    t23 = (t19 + 4);
    t24 = (t18 + 4);
    t44 = *((unsigned int *)t18);
    t45 = (~(t44));
    *((unsigned int *)t19) = t45;
    *((unsigned int *)t23) = 0;
    if (*((unsigned int *)t24) != 0)
        goto LAB79;

LAB78:    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & 1U);
    t51 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t51 & 1U);
    memset(t20, 0, 8);
    t25 = (t19 + 4);
    t52 = *((unsigned int *)t25);
    t53 = (~(t52));
    t54 = *((unsigned int *)t19);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t25) != 0)
        goto LAB82;

LAB83:    t58 = *((unsigned int *)t7);
    t59 = *((unsigned int *)t20);
    t60 = (t58 & t59);
    *((unsigned int *)t57) = t60;
    t28 = (t7 + 4);
    t32 = (t20 + 4);
    t68 = (t57 + 4);
    t61 = *((unsigned int *)t28);
    t62 = *((unsigned int *)t32);
    t63 = (t61 | t62);
    *((unsigned int *)t68) = t63;
    t64 = *((unsigned int *)t68);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB84;

LAB85:
LAB86:    goto LAB73;

LAB74:    *((unsigned int *)t19) = 1;
    goto LAB77;

LAB79:    t46 = *((unsigned int *)t19);
    t47 = *((unsigned int *)t24);
    *((unsigned int *)t19) = (t46 | t47);
    t48 = *((unsigned int *)t23);
    t49 = *((unsigned int *)t24);
    *((unsigned int *)t23) = (t48 | t49);
    goto LAB78;

LAB80:    *((unsigned int *)t20) = 1;
    goto LAB83;

LAB82:    t26 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB83;

LAB84:    t66 = *((unsigned int *)t57);
    t67 = *((unsigned int *)t68);
    *((unsigned int *)t57) = (t66 | t67);
    t83 = (t7 + 4);
    t90 = (t20 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t83);
    t72 = (~(t71));
    t73 = *((unsigned int *)t20);
    t74 = (~(t73));
    t75 = *((unsigned int *)t90);
    t76 = (~(t75));
    t27 = (t70 & t72);
    t30 = (t74 & t76);
    t77 = (~(t27));
    t78 = (~(t30));
    t79 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t79 & t77);
    t80 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t80 & t78);
    t81 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t81 & t77);
    t82 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t82 & t78);
    goto LAB86;

LAB87:    xsi_set_current_line(255, ng0);

LAB90:    xsi_set_current_line(256, ng0);
    t92 = ((char*)((ng9)));
    t93 = (t0 + 9640);
    xsi_vlogvar_assign_value(t93, t92, 0, 0, 1);
    xsi_set_current_line(257, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 8680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(258, ng0);
    t2 = (t0 + 5560U);
    t3 = *((char **)t2);
    t2 = (t0 + 9480);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 19);
    xsi_set_current_line(259, ng0);
    t2 = (t0 + 6440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t14 = (t4 + 4);
    t15 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t14);
    t12 = *((unsigned int *)t15);
    t13 = (t11 ^ t12);
    t29 = (t10 | t13);
    t33 = *((unsigned int *)t14);
    t36 = *((unsigned int *)t15);
    t38 = (t33 | t36);
    t39 = (~(t38));
    t42 = (t29 & t39);
    if (t42 != 0)
        goto LAB94;

LAB91:    if (t38 != 0)
        goto LAB93;

LAB92:    *((unsigned int *)t7) = 1;

LAB94:    t17 = (t7 + 4);
    t43 = *((unsigned int *)t17);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB95;

LAB96:
LAB97:    goto LAB89;

LAB93:    t16 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB94;

LAB95:    xsi_set_current_line(260, ng0);
    t18 = ((char*)((ng9)));
    t21 = (t0 + 8840);
    xsi_vlogvar_assign_value(t21, t18, 0, 0, 1);
    goto LAB97;

LAB99:    *((unsigned int *)t7) = 1;
    goto LAB102;

LAB101:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB102;

LAB103:    t14 = (t0 + 9000);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t19, 0, 8);
    t17 = (t16 + 4);
    t36 = *((unsigned int *)t17);
    t38 = (~(t36));
    t39 = *((unsigned int *)t16);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB109;

LAB107:    if (*((unsigned int *)t17) == 0)
        goto LAB106;

LAB108:    t18 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t18) = 1;

LAB109:    t21 = (t19 + 4);
    t22 = (t16 + 4);
    t44 = *((unsigned int *)t16);
    t45 = (~(t44));
    *((unsigned int *)t19) = t45;
    *((unsigned int *)t21) = 0;
    if (*((unsigned int *)t22) != 0)
        goto LAB111;

LAB110:    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & 1U);
    t51 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t51 & 1U);
    memset(t20, 0, 8);
    t23 = (t19 + 4);
    t52 = *((unsigned int *)t23);
    t53 = (~(t52));
    t54 = *((unsigned int *)t19);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB112;

LAB113:    if (*((unsigned int *)t23) != 0)
        goto LAB114;

LAB115:    t58 = *((unsigned int *)t7);
    t59 = *((unsigned int *)t20);
    t60 = (t58 & t59);
    *((unsigned int *)t57) = t60;
    t25 = (t7 + 4);
    t26 = (t20 + 4);
    t28 = (t57 + 4);
    t61 = *((unsigned int *)t25);
    t62 = *((unsigned int *)t26);
    t63 = (t61 | t62);
    *((unsigned int *)t28) = t63;
    t64 = *((unsigned int *)t28);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB116;

LAB117:
LAB118:    goto LAB105;

LAB106:    *((unsigned int *)t19) = 1;
    goto LAB109;

LAB111:    t46 = *((unsigned int *)t19);
    t47 = *((unsigned int *)t22);
    *((unsigned int *)t19) = (t46 | t47);
    t48 = *((unsigned int *)t21);
    t49 = *((unsigned int *)t22);
    *((unsigned int *)t21) = (t48 | t49);
    goto LAB110;

LAB112:    *((unsigned int *)t20) = 1;
    goto LAB115;

LAB114:    t24 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB115;

LAB116:    t66 = *((unsigned int *)t57);
    t67 = *((unsigned int *)t28);
    *((unsigned int *)t57) = (t66 | t67);
    t32 = (t7 + 4);
    t68 = (t20 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t32);
    t72 = (~(t71));
    t73 = *((unsigned int *)t20);
    t74 = (~(t73));
    t75 = *((unsigned int *)t68);
    t76 = (~(t75));
    t27 = (t70 & t72);
    t30 = (t74 & t76);
    t77 = (~(t27));
    t78 = (~(t30));
    t79 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t79 & t77);
    t80 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t80 & t78);
    t81 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t81 & t77);
    t82 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t82 & t78);
    goto LAB118;

LAB119:    xsi_set_current_line(270, ng0);

LAB122:    xsi_set_current_line(271, ng0);
    t90 = (t0 + 6600);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    memset(t89, 0, 8);
    t93 = (t92 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t92);
    t97 = (t96 & t95);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB126;

LAB124:    if (*((unsigned int *)t93) == 0)
        goto LAB123;

LAB125:    t99 = (t89 + 4);
    *((unsigned int *)t89) = 1;
    *((unsigned int *)t99) = 1;

LAB126:    t100 = (t89 + 4);
    t101 = *((unsigned int *)t100);
    t102 = (~(t101));
    t103 = *((unsigned int *)t89);
    t104 = (t103 & t102);
    t105 = (t104 != 0);
    if (t105 > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(279, ng0);

LAB138:    xsi_set_current_line(280, ng0);
    t2 = (t0 + 8520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9960);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 19);
    xsi_set_current_line(281, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB129:    goto LAB121;

LAB123:    *((unsigned int *)t89) = 1;
    goto LAB126;

LAB127:    xsi_set_current_line(272, ng0);

LAB130:    xsi_set_current_line(273, ng0);
    t106 = (t0 + 3800U);
    t107 = *((char **)t106);
    t106 = (t0 + 9960);
    xsi_vlogvar_assign_value(t106, t107, 0, 0, 19);
    xsi_set_current_line(274, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 9160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(275, ng0);
    t2 = (t0 + 9000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t14 = (t4 + 4);
    t15 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t14);
    t12 = *((unsigned int *)t15);
    t13 = (t11 ^ t12);
    t29 = (t10 | t13);
    t33 = *((unsigned int *)t14);
    t36 = *((unsigned int *)t15);
    t38 = (t33 | t36);
    t39 = (~(t38));
    t42 = (t29 & t39);
    if (t42 != 0)
        goto LAB134;

LAB131:    if (t38 != 0)
        goto LAB133;

LAB132:    *((unsigned int *)t7) = 1;

LAB134:    t17 = (t7 + 4);
    t43 = *((unsigned int *)t17);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB135;

LAB136:
LAB137:    goto LAB129;

LAB133:    t16 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB134;

LAB135:    xsi_set_current_line(276, ng0);
    t18 = ((char*)((ng9)));
    t21 = (t0 + 6760);
    xsi_vlogvar_assign_value(t21, t18, 0, 0, 1);
    goto LAB137;

LAB139:    *((unsigned int *)t7) = 1;
    goto LAB142;

LAB141:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB142;

LAB143:    t14 = (t0 + 9000);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t19, 0, 8);
    t17 = (t16 + 4);
    t36 = *((unsigned int *)t17);
    t38 = (~(t36));
    t39 = *((unsigned int *)t16);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB149;

LAB147:    if (*((unsigned int *)t17) == 0)
        goto LAB146;

LAB148:    t18 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t18) = 1;

LAB149:    t21 = (t19 + 4);
    t22 = (t16 + 4);
    t44 = *((unsigned int *)t16);
    t45 = (~(t44));
    *((unsigned int *)t19) = t45;
    *((unsigned int *)t21) = 0;
    if (*((unsigned int *)t22) != 0)
        goto LAB151;

LAB150:    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & 1U);
    t51 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t51 & 1U);
    memset(t20, 0, 8);
    t23 = (t19 + 4);
    t52 = *((unsigned int *)t23);
    t53 = (~(t52));
    t54 = *((unsigned int *)t19);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB152;

LAB153:    if (*((unsigned int *)t23) != 0)
        goto LAB154;

LAB155:    t58 = *((unsigned int *)t7);
    t59 = *((unsigned int *)t20);
    t60 = (t58 & t59);
    *((unsigned int *)t57) = t60;
    t25 = (t7 + 4);
    t26 = (t20 + 4);
    t28 = (t57 + 4);
    t61 = *((unsigned int *)t25);
    t62 = *((unsigned int *)t26);
    t63 = (t61 | t62);
    *((unsigned int *)t28) = t63;
    t64 = *((unsigned int *)t28);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB156;

LAB157:
LAB158:    goto LAB145;

LAB146:    *((unsigned int *)t19) = 1;
    goto LAB149;

LAB151:    t46 = *((unsigned int *)t19);
    t47 = *((unsigned int *)t22);
    *((unsigned int *)t19) = (t46 | t47);
    t48 = *((unsigned int *)t21);
    t49 = *((unsigned int *)t22);
    *((unsigned int *)t21) = (t48 | t49);
    goto LAB150;

LAB152:    *((unsigned int *)t20) = 1;
    goto LAB155;

LAB154:    t24 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB155;

LAB156:    t66 = *((unsigned int *)t57);
    t67 = *((unsigned int *)t28);
    *((unsigned int *)t57) = (t66 | t67);
    t32 = (t7 + 4);
    t68 = (t20 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t32);
    t72 = (~(t71));
    t73 = *((unsigned int *)t20);
    t74 = (~(t73));
    t75 = *((unsigned int *)t68);
    t76 = (~(t75));
    t27 = (t70 & t72);
    t30 = (t74 & t76);
    t77 = (~(t27));
    t78 = (~(t30));
    t79 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t79 & t77);
    t80 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t80 & t78);
    t81 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t81 & t77);
    t82 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t82 & t78);
    goto LAB158;

LAB159:    xsi_set_current_line(285, ng0);

LAB162:    xsi_set_current_line(286, ng0);
    t90 = (t0 + 5560U);
    t91 = *((char **)t90);
    t90 = (t0 + 9960);
    xsi_vlogvar_assign_value(t90, t91, 0, 0, 19);
    xsi_set_current_line(287, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 9160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(288, ng0);
    t2 = (t0 + 9000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t14 = (t4 + 4);
    t15 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t14);
    t12 = *((unsigned int *)t15);
    t13 = (t11 ^ t12);
    t29 = (t10 | t13);
    t33 = *((unsigned int *)t14);
    t36 = *((unsigned int *)t15);
    t38 = (t33 | t36);
    t39 = (~(t38));
    t42 = (t29 & t39);
    if (t42 != 0)
        goto LAB166;

LAB163:    if (t38 != 0)
        goto LAB165;

LAB164:    *((unsigned int *)t7) = 1;

LAB166:    t17 = (t7 + 4);
    t43 = *((unsigned int *)t17);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB167;

LAB168:
LAB169:    goto LAB161;

LAB165:    t16 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB166;

LAB167:    xsi_set_current_line(289, ng0);
    t18 = ((char*)((ng9)));
    t21 = (t0 + 6760);
    xsi_vlogvar_assign_value(t21, t18, 0, 0, 1);
    goto LAB169;

LAB171:    *((unsigned int *)t7) = 1;
    goto LAB174;

LAB173:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB174;

LAB175:    t16 = (t0 + 9160);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t21 = (t18 + 4);
    t36 = *((unsigned int *)t21);
    t38 = (~(t36));
    t39 = *((unsigned int *)t18);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB181;

LAB179:    if (*((unsigned int *)t21) == 0)
        goto LAB178;

LAB180:    t22 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t22) = 1;

LAB181:    t23 = (t19 + 4);
    t24 = (t18 + 4);
    t44 = *((unsigned int *)t18);
    t45 = (~(t44));
    *((unsigned int *)t19) = t45;
    *((unsigned int *)t23) = 0;
    if (*((unsigned int *)t24) != 0)
        goto LAB183;

LAB182:    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & 1U);
    t51 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t51 & 1U);
    memset(t20, 0, 8);
    t25 = (t19 + 4);
    t52 = *((unsigned int *)t25);
    t53 = (~(t52));
    t54 = *((unsigned int *)t19);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB184;

LAB185:    if (*((unsigned int *)t25) != 0)
        goto LAB186;

LAB187:    t58 = *((unsigned int *)t7);
    t59 = *((unsigned int *)t20);
    t60 = (t58 & t59);
    *((unsigned int *)t57) = t60;
    t28 = (t7 + 4);
    t32 = (t20 + 4);
    t68 = (t57 + 4);
    t61 = *((unsigned int *)t28);
    t62 = *((unsigned int *)t32);
    t63 = (t61 | t62);
    *((unsigned int *)t68) = t63;
    t64 = *((unsigned int *)t68);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB188;

LAB189:
LAB190:    goto LAB177;

LAB178:    *((unsigned int *)t19) = 1;
    goto LAB181;

LAB183:    t46 = *((unsigned int *)t19);
    t47 = *((unsigned int *)t24);
    *((unsigned int *)t19) = (t46 | t47);
    t48 = *((unsigned int *)t23);
    t49 = *((unsigned int *)t24);
    *((unsigned int *)t23) = (t48 | t49);
    goto LAB182;

LAB184:    *((unsigned int *)t20) = 1;
    goto LAB187;

LAB186:    t26 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB187;

LAB188:    t66 = *((unsigned int *)t57);
    t67 = *((unsigned int *)t68);
    *((unsigned int *)t57) = (t66 | t67);
    t83 = (t7 + 4);
    t90 = (t20 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t83);
    t72 = (~(t71));
    t73 = *((unsigned int *)t20);
    t74 = (~(t73));
    t75 = *((unsigned int *)t90);
    t76 = (~(t75));
    t27 = (t70 & t72);
    t30 = (t74 & t76);
    t77 = (~(t27));
    t78 = (~(t30));
    t79 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t79 & t77);
    t80 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t80 & t78);
    t81 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t81 & t77);
    t82 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t82 & t78);
    goto LAB190;

LAB191:    xsi_set_current_line(299, ng0);

LAB194:    xsi_set_current_line(300, ng0);
    t92 = (t0 + 7880);
    t93 = (t92 + 56U);
    t99 = *((char **)t93);
    t100 = ((char*)((ng4)));
    memset(t89, 0, 8);
    xsi_vlog_unsigned_minus(t89, 32, t99, 17, t100, 32);
    t106 = (t0 + 7720);
    xsi_vlogvar_assign_value(t106, t89, 0, 0, 17);
    goto LAB193;

LAB195:    *((unsigned int *)t7) = 1;
    goto LAB198;

LAB197:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB198;

LAB199:    t16 = (t0 + 9640);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t21 = (t18 + 4);
    t36 = *((unsigned int *)t21);
    t38 = (~(t36));
    t39 = *((unsigned int *)t18);
    t42 = (t39 & t38);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB205;

LAB203:    if (*((unsigned int *)t21) == 0)
        goto LAB202;

LAB204:    t22 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t22) = 1;

LAB205:    t23 = (t19 + 4);
    t24 = (t18 + 4);
    t44 = *((unsigned int *)t18);
    t45 = (~(t44));
    *((unsigned int *)t19) = t45;
    *((unsigned int *)t23) = 0;
    if (*((unsigned int *)t24) != 0)
        goto LAB207;

LAB206:    t50 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t50 & 1U);
    t51 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t51 & 1U);
    memset(t20, 0, 8);
    t25 = (t19 + 4);
    t52 = *((unsigned int *)t25);
    t53 = (~(t52));
    t54 = *((unsigned int *)t19);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB208;

LAB209:    if (*((unsigned int *)t25) != 0)
        goto LAB210;

LAB211:    t58 = *((unsigned int *)t7);
    t59 = *((unsigned int *)t20);
    t60 = (t58 & t59);
    *((unsigned int *)t57) = t60;
    t28 = (t7 + 4);
    t32 = (t20 + 4);
    t68 = (t57 + 4);
    t61 = *((unsigned int *)t28);
    t62 = *((unsigned int *)t32);
    t63 = (t61 | t62);
    *((unsigned int *)t68) = t63;
    t64 = *((unsigned int *)t68);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB212;

LAB213:
LAB214:    goto LAB201;

LAB202:    *((unsigned int *)t19) = 1;
    goto LAB205;

LAB207:    t46 = *((unsigned int *)t19);
    t47 = *((unsigned int *)t24);
    *((unsigned int *)t19) = (t46 | t47);
    t48 = *((unsigned int *)t23);
    t49 = *((unsigned int *)t24);
    *((unsigned int *)t23) = (t48 | t49);
    goto LAB206;

LAB208:    *((unsigned int *)t20) = 1;
    goto LAB211;

LAB210:    t26 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB211;

LAB212:    t66 = *((unsigned int *)t57);
    t67 = *((unsigned int *)t68);
    *((unsigned int *)t57) = (t66 | t67);
    t83 = (t7 + 4);
    t90 = (t20 + 4);
    t69 = *((unsigned int *)t7);
    t70 = (~(t69));
    t71 = *((unsigned int *)t83);
    t72 = (~(t71));
    t73 = *((unsigned int *)t20);
    t74 = (~(t73));
    t75 = *((unsigned int *)t90);
    t76 = (~(t75));
    t27 = (t70 & t72);
    t30 = (t74 & t76);
    t77 = (~(t27));
    t78 = (~(t30));
    t79 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t79 & t77);
    t80 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t80 & t78);
    t81 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t81 & t77);
    t82 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t82 & t78);
    goto LAB214;

LAB215:    xsi_set_current_line(303, ng0);

LAB218:    xsi_set_current_line(304, ng0);
    t92 = (t0 + 7880);
    t93 = (t92 + 56U);
    t99 = *((char **)t93);
    t100 = ((char*)((ng4)));
    memset(t89, 0, 8);
    xsi_vlog_unsigned_add(t89, 32, t99, 17, t100, 32);
    t106 = (t0 + 7720);
    xsi_vlogvar_assign_value(t106, t89, 0, 0, 17);
    goto LAB217;

}

static void Always_311_5(char *t0)
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

LAB0:    t1 = (t0 + 14352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(311, ng0);
    t2 = (t0 + 15000);
    *((int *)t2) = 1;
    t3 = (t0 + 14384);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(312, ng0);

LAB5:    xsi_set_current_line(313, ng0);
    t4 = (t0 + 7880);
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

LAB9:    t24 = (t0 + 6280);
    xsi_vlogvar_assign_value(t24, t8, 0, 0, 1);
    xsi_set_current_line(314, ng0);
    t2 = (t0 + 7880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1696);
    t6 = *((char **)t5);
    t5 = ((char*)((ng14)));
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

LAB13:    t23 = (t0 + 10440);
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

static void Always_321_6(char *t0)
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

LAB0:    t1 = (t0 + 14600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(321, ng0);
    t2 = (t0 + 15016);
    *((int *)t2) = 1;
    t3 = (t0 + 14632);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(322, ng0);

LAB5:    xsi_set_current_line(323, ng0);
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

LAB7:    xsi_set_current_line(329, ng0);

LAB10:    xsi_set_current_line(330, ng0);
    t2 = (t0 + 3800U);
    t3 = *((char **)t2);
    t2 = (t0 + 12040);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 19, 0LL);
    xsi_set_current_line(331, ng0);
    t2 = (t0 + 5560U);
    t3 = *((char **)t2);
    t2 = (t0 + 12200);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 19, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(324, ng0);

LAB9:    xsi_set_current_line(325, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 12040);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 19, 0LL);
    xsi_set_current_line(326, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 12200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);
    goto LAB8;

}


extern void nf10_sram_fifo_v1_00_a_m_00415927260401957101_1993385204_init()
{
	static char *pe[] = {(void *)Always_127_0,(void *)Cont_166_1,(void *)Cont_167_2,(void *)Always_184_3,(void *)Always_200_4,(void *)Always_311_5,(void *)Always_321_6};
	xsi_register_didat("nf10_sram_fifo_v1_00_a_m_00415927260401957101_1993385204", "isim/isim_system_axisim.sim/nf10_sram_fifo_v1_00_a/m_00415927260401957101_1993385204.didat");
	xsi_register_executes(pe);
}
