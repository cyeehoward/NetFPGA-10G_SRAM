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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/std/pcores/nf10_axis_converter_v1_00_a/hdl/verilog/nf10_axis_converter.v";
static int ng1[] = {0, 0};
static int ng2[] = {2, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {1U, 0U};
static int ng6[] = {8, 0};
static unsigned int ng7[] = {0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U};



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
    xsi_set_current_line(85, ng0);

LAB2:    xsi_set_current_line(86, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t1 + 11872);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(87, ng0);

LAB3:    t3 = ((char*)((ng2)));
    t4 = (t1 + 11872);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_signed_power(t7, 32, t3, 32, t6, 32, 1);
    t8 = (t1 + 12032);
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
LAB4:    xsi_set_current_line(87, ng0);

LAB6:    xsi_set_current_line(88, ng0);
    t18 = (t1 + 11872);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng3)));
    memset(t22, 0, 8);
    xsi_vlog_signed_add(t22, 32, t20, 32, t21, 32);
    t23 = (t1 + 11872);
    xsi_vlogvar_assign_value(t23, t22, 0, 0, 32);
    goto LAB3;

}

static void NetDecl_123_0(char *t0)
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

LAB0:    t1 = (t0 + 12944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 16216);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 255U;
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
    xsi_driver_vfirst_trans(t3, 0, 7U);

LAB1:    return;
}

static void NetDecl_124_1(char *t0)
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

LAB0:    t1 = (t0 + 13192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 16280);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 255U;
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
    xsi_driver_vfirst_trans(t3, 0, 7U);

LAB1:    return;
}

static void Always_154_2(char *t0)
{
    char t4[8];
    char t23[8];
    char t42[8];
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
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    int t66;
    int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;

LAB0:    t1 = (t0 + 13440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 15992);
    *((int *)t2) = 1;
    t3 = (t0 + 13472);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(154, ng0);

LAB5:    xsi_set_current_line(155, ng0);
    t5 = (t0 + 5232U);
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
    t24 = (t0 + 6192U);
    t25 = *((char **)t24);
    memset(t23, 0, 8);
    t24 = (t25 + 4);
    t26 = *((unsigned int *)t24);
    t27 = (~(t26));
    t28 = *((unsigned int *)t25);
    t29 = (t28 & t27);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB15;

LAB13:    if (*((unsigned int *)t24) == 0)
        goto LAB12;

LAB14:    t31 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t31) = 1;

LAB15:    t32 = (t23 + 4);
    t33 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = (~(t34));
    *((unsigned int *)t23) = t35;
    *((unsigned int *)t32) = 0;
    if (*((unsigned int *)t33) != 0)
        goto LAB17;

LAB16:    t40 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t40 & 1U);
    t41 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t41 & 1U);
    t43 = *((unsigned int *)t4);
    t44 = *((unsigned int *)t23);
    t45 = (t43 & t44);
    *((unsigned int *)t42) = t45;
    t46 = (t4 + 4);
    t47 = (t23 + 4);
    t48 = (t42 + 4);
    t49 = *((unsigned int *)t46);
    t50 = *((unsigned int *)t47);
    t51 = (t49 | t50);
    *((unsigned int *)t48) = t51;
    t52 = *((unsigned int *)t48);
    t53 = (t52 != 0);
    if (t53 == 1)
        goto LAB18;

LAB19:
LAB20:    t74 = (t0 + 8512);
    xsi_vlogvar_wait_assign_value(t74, t42, 0, 0, 1, 0LL);
    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB11:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

LAB12:    *((unsigned int *)t23) = 1;
    goto LAB15;

LAB17:    t36 = *((unsigned int *)t23);
    t37 = *((unsigned int *)t33);
    *((unsigned int *)t23) = (t36 | t37);
    t38 = *((unsigned int *)t32);
    t39 = *((unsigned int *)t33);
    *((unsigned int *)t32) = (t38 | t39);
    goto LAB16;

LAB18:    t54 = *((unsigned int *)t42);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t42) = (t54 | t55);
    t56 = (t4 + 4);
    t57 = (t23 + 4);
    t58 = *((unsigned int *)t4);
    t59 = (~(t58));
    t60 = *((unsigned int *)t56);
    t61 = (~(t60));
    t62 = *((unsigned int *)t23);
    t63 = (~(t62));
    t64 = *((unsigned int *)t57);
    t65 = (~(t64));
    t66 = (t59 & t61);
    t67 = (t63 & t65);
    t68 = (~(t66));
    t69 = (~(t67));
    t70 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t70 & t68);
    t71 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t71 & t69);
    t72 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t72 & t68);
    t73 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t73 & t69);
    goto LAB20;

}

static void Always_208_3(char *t0)
{
    char t11[8];
    char t51[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    int t66;
    int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t81;

LAB0:    t1 = (t0 + 13688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(208, ng0);
    t2 = (t0 + 16008);
    *((int *)t2) = 1;
    t3 = (t0 + 13720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(208, ng0);

LAB5:    xsi_set_current_line(209, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t0 + 8832);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(210, ng0);
    t2 = (t0 + 11232);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11392);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 11232);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = (t0 + 2512);
    t6 = *((char **)t5);
    t7 = xsi_vlog_unsigned_case_compare(t4, 1, t6, 32);
    if (t7 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 2648);
    t3 = *((char **)t2);
    t7 = xsi_vlog_unsigned_case_compare(t4, 1, t3, 32);
    if (t7 == 1)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    xsi_set_current_line(212, ng0);

LAB12:    xsi_set_current_line(213, ng0);
    t5 = (t0 + 4912U);
    t8 = *((char **)t5);
    t5 = (t0 + 8512);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t12 = *((unsigned int *)t8);
    t13 = *((unsigned int *)t10);
    t14 = (t12 & t13);
    *((unsigned int *)t11) = t14;
    t15 = (t8 + 4);
    t16 = (t10 + 4);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t15);
    t19 = *((unsigned int *)t16);
    t20 = (t18 | t19);
    *((unsigned int *)t17) = t20;
    t21 = *((unsigned int *)t17);
    t22 = (t21 != 0);
    if (t22 == 1)
        goto LAB13;

LAB14:
LAB15:    t43 = (t11 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (~(t44));
    t46 = *((unsigned int *)t11);
    t47 = (t46 & t45);
    t48 = (t47 != 0);
    if (t48 > 0)
        goto LAB16;

LAB17:
LAB18:    goto LAB11;

LAB9:    xsi_set_current_line(218, ng0);

LAB20:    xsi_set_current_line(219, ng0);
    t2 = (t0 + 4912U);
    t5 = *((char **)t2);
    t2 = (t0 + 8512);
    t6 = (t2 + 56U);
    t8 = *((char **)t6);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t8);
    t14 = (t12 & t13);
    *((unsigned int *)t11) = t14;
    t9 = (t5 + 4);
    t10 = (t8 + 4);
    t15 = (t11 + 4);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    *((unsigned int *)t15) = t20;
    t21 = *((unsigned int *)t15);
    t22 = (t21 != 0);
    if (t22 == 1)
        goto LAB21;

LAB22:
LAB23:    t25 = (t0 + 5072U);
    t26 = *((char **)t25);
    t44 = *((unsigned int *)t11);
    t45 = *((unsigned int *)t26);
    t46 = (t44 & t45);
    *((unsigned int *)t51) = t46;
    t25 = (t11 + 4);
    t43 = (t26 + 4);
    t49 = (t51 + 4);
    t47 = *((unsigned int *)t25);
    t48 = *((unsigned int *)t43);
    t52 = (t47 | t48);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB24;

LAB25:
LAB26:    t74 = (t51 + 4);
    t75 = *((unsigned int *)t74);
    t76 = (~(t75));
    t77 = *((unsigned int *)t51);
    t78 = (t77 & t76);
    t79 = (t78 != 0);
    if (t79 > 0)
        goto LAB27;

LAB28:
LAB29:    goto LAB11;

LAB13:    t23 = *((unsigned int *)t11);
    t24 = *((unsigned int *)t17);
    *((unsigned int *)t11) = (t23 | t24);
    t25 = (t8 + 4);
    t26 = (t10 + 4);
    t27 = *((unsigned int *)t8);
    t28 = (~(t27));
    t29 = *((unsigned int *)t25);
    t30 = (~(t29));
    t31 = *((unsigned int *)t10);
    t32 = (~(t31));
    t33 = *((unsigned int *)t26);
    t34 = (~(t33));
    t35 = (t28 & t30);
    t36 = (t32 & t34);
    t37 = (~(t35));
    t38 = (~(t36));
    t39 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t39 & t37);
    t40 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t40 & t38);
    t41 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t41 & t37);
    t42 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t42 & t38);
    goto LAB15;

LAB16:    xsi_set_current_line(213, ng0);

LAB19:    xsi_set_current_line(214, ng0);
    t49 = ((char*)((ng5)));
    t50 = (t0 + 8832);
    xsi_vlogvar_assign_value(t50, t49, 0, 0, 1);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 2648);
    t3 = *((char **)t2);
    t2 = (t0 + 11392);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB18;

LAB21:    t23 = *((unsigned int *)t11);
    t24 = *((unsigned int *)t15);
    *((unsigned int *)t11) = (t23 | t24);
    t16 = (t5 + 4);
    t17 = (t8 + 4);
    t27 = *((unsigned int *)t5);
    t28 = (~(t27));
    t29 = *((unsigned int *)t16);
    t30 = (~(t29));
    t31 = *((unsigned int *)t8);
    t32 = (~(t31));
    t33 = *((unsigned int *)t17);
    t34 = (~(t33));
    t35 = (t28 & t30);
    t36 = (t32 & t34);
    t37 = (~(t35));
    t38 = (~(t36));
    t39 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t39 & t37);
    t40 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t40 & t38);
    t41 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t41 & t37);
    t42 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t42 & t38);
    goto LAB23;

LAB24:    t55 = *((unsigned int *)t51);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t51) = (t55 | t56);
    t50 = (t11 + 4);
    t57 = (t26 + 4);
    t58 = *((unsigned int *)t11);
    t59 = (~(t58));
    t60 = *((unsigned int *)t50);
    t61 = (~(t60));
    t62 = *((unsigned int *)t26);
    t63 = (~(t62));
    t64 = *((unsigned int *)t57);
    t65 = (~(t64));
    t66 = (t59 & t61);
    t67 = (t63 & t65);
    t68 = (~(t66));
    t69 = (~(t67));
    t70 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t70 & t68);
    t71 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t71 & t69);
    t72 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t72 & t68);
    t73 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t73 & t69);
    goto LAB26;

LAB27:    xsi_set_current_line(219, ng0);

LAB30:    xsi_set_current_line(220, ng0);
    t80 = (t0 + 2512);
    t81 = *((char **)t80);
    t80 = (t0 + 11392);
    xsi_vlogvar_assign_value(t80, t81, 0, 0, 1);
    goto LAB29;

}

static void Always_226_4(char *t0)
{
    char t4[8];
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

LAB0:    t1 = (t0 + 13936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 16024);
    *((int *)t2) = 1;
    t3 = (t0 + 13968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(226, ng0);

LAB5:    xsi_set_current_line(227, ng0);
    t5 = (t0 + 3952U);
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

LAB13:    xsi_set_current_line(230, ng0);

LAB16:    xsi_set_current_line(231, ng0);
    t2 = (t0 + 11392);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 11232);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 1, 0LL);

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

LAB12:    xsi_set_current_line(227, ng0);

LAB15:    xsi_set_current_line(228, ng0);
    t29 = (t0 + 2512);
    t30 = *((char **)t29);
    t29 = (t0 + 11232);
    xsi_vlogvar_wait_assign_value(t29, t30, 0, 0, 1, 0LL);
    goto LAB14;

}

static void NetDecl_263_5(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 14184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(263, ng0);
    t2 = (t0 + 11552);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 2, t4, 2, t5, 2);
    t7 = (t0 + 16344);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 3U;
    t13 = t12;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans(t7, 0, 1U);
    t20 = (t0 + 16040);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Always_265_6(char *t0)
{
    char t7[8];
    char t15[8];
    char t22[8];
    char t30[8];
    char t34[8];
    char t38[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t35;
    unsigned int t36;
    int t37;
    char *t39;
    char *t41;
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

LAB0:    t1 = (t0 + 14432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(265, ng0);
    t2 = (t0 + 16056);
    *((int *)t2) = 1;
    t3 = (t0 + 14464);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(265, ng0);

LAB5:    xsi_set_current_line(266, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t0 + 8672);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(267, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 8992);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(269, ng0);
    t2 = (t0 + 9792);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7872);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 256);
    xsi_set_current_line(270, ng0);
    t2 = (t0 + 10112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8032);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(271, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 8352);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(273, ng0);
    t2 = (t0 + 9792);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9952);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 256);
    xsi_set_current_line(274, ng0);
    t2 = (t0 + 10112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 10272);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(276, ng0);
    t2 = (t0 + 11552);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11712);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(277, ng0);
    t2 = (t0 + 10432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 10592);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(278, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 8192);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(280, ng0);
    xsi_set_current_line(280, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10912);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB6:    t2 = (t0 + 10912);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 608);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t4, 32, t6, 32);
    t5 = (t7 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(281, ng0);
    xsi_set_current_line(281, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11072);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB11:    t2 = (t0 + 11072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 608);
    t6 = *((char **)t5);
    t5 = ((char*)((ng6)));
    memset(t7, 0, 8);
    xsi_vlog_signed_divide(t7, 32, t6, 32, t5, 32);
    memset(t15, 0, 8);
    xsi_vlog_signed_less(t15, 32, t4, 32, t7, 32);
    t13 = (t15 + 4);
    t8 = *((unsigned int *)t13);
    t9 = (~(t8));
    t10 = *((unsigned int *)t15);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(283, ng0);
    t2 = (t0 + 5392U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB19;

LAB17:    if (*((unsigned int *)t2) == 0)
        goto LAB16;

LAB18:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;

LAB19:    t5 = (t7 + 4);
    t6 = (t3 + 4);
    t36 = *((unsigned int *)t3);
    t42 = (~(t36));
    *((unsigned int *)t7) = t42;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB21;

LAB20:    t47 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t47 & 1U);
    t48 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t48 & 1U);
    t13 = (t7 + 4);
    t49 = *((unsigned int *)t13);
    t50 = (~(t49));
    t51 = *((unsigned int *)t7);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB22;

LAB23:
LAB24:    goto LAB2;

LAB7:    xsi_set_current_line(280, ng0);
    t13 = (t0 + 5552U);
    t14 = *((char **)t13);
    t13 = (t0 + 5512U);
    t16 = (t13 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 10912);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    xsi_vlog_generic_get_index_select_value(t15, 1, t14, t17, 2, t20, 32, 1);
    t21 = (t0 + 7872);
    t23 = (t0 + 7872);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = (t0 + 608);
    t27 = *((char **)t26);
    t26 = (t0 + 11552);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    memset(t30, 0, 8);
    xsi_vlog_unsigned_multiply(t30, 32, t27, 32, t29, 2);
    t31 = (t0 + 10912);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t34, 0, 8);
    xsi_vlog_unsigned_add(t34, 32, t30, 32, t33, 32);
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t34, 32, 2);
    t35 = (t22 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(280, ng0);
    t2 = (t0 + 10912);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 10912);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB6;

LAB9:    xsi_vlogvar_assign_value(t21, t15, 0, *((unsigned int *)t22), 1);
    goto LAB10;

LAB12:    xsi_set_current_line(281, ng0);
    t14 = (t0 + 5712U);
    t16 = *((char **)t14);
    t14 = (t0 + 5672U);
    t17 = (t14 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 11072);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    xsi_vlog_generic_get_index_select_value(t22, 1, t16, t18, 2, t21, 32, 1);
    t23 = (t0 + 8032);
    t24 = (t0 + 8032);
    t25 = (t24 + 72U);
    t26 = *((char **)t25);
    t27 = (t0 + 608);
    t28 = *((char **)t27);
    t27 = ((char*)((ng6)));
    memset(t34, 0, 8);
    xsi_vlog_unsigned_divide(t34, 32, t28, 32, t27, 32);
    t29 = (t0 + 11552);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    memset(t38, 0, 8);
    xsi_vlog_unsigned_multiply(t38, 32, t34, 32, t32, 2);
    t33 = (t0 + 11072);
    t35 = (t33 + 56U);
    t39 = *((char **)t35);
    memset(t40, 0, 8);
    xsi_vlog_unsigned_add(t40, 32, t38, 32, t39, 32);
    xsi_vlog_generic_convert_bit_index(t30, t26, 2, t40, 32, 2);
    t41 = (t30 + 4);
    t36 = *((unsigned int *)t41);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(281, ng0);
    t2 = (t0 + 11072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 11072);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB11;

LAB14:    xsi_vlogvar_assign_value(t23, t22, 0, *((unsigned int *)t30), 1);
    goto LAB15;

LAB16:    *((unsigned int *)t7) = 1;
    goto LAB19;

LAB21:    t43 = *((unsigned int *)t7);
    t44 = *((unsigned int *)t6);
    *((unsigned int *)t7) = (t43 | t44);
    t45 = *((unsigned int *)t5);
    t46 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t45 | t46);
    goto LAB20;

LAB22:    xsi_set_current_line(283, ng0);

LAB25:    xsi_set_current_line(285, ng0);
    t14 = (t0 + 11552);
    t16 = (t14 + 56U);
    t17 = *((char **)t16);
    t18 = (t0 + 2240);
    t19 = *((char **)t18);
    t18 = ((char*)((ng3)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_minus(t15, 32, t19, 32, t18, 32);
    memset(t22, 0, 8);
    t20 = (t17 + 4);
    t21 = (t15 + 4);
    t54 = *((unsigned int *)t17);
    t55 = *((unsigned int *)t15);
    t56 = (t54 ^ t55);
    t57 = *((unsigned int *)t20);
    t58 = *((unsigned int *)t21);
    t59 = (t57 ^ t58);
    t60 = (t56 | t59);
    t61 = *((unsigned int *)t20);
    t62 = *((unsigned int *)t21);
    t63 = (t61 | t62);
    t64 = (~(t63));
    t65 = (t60 & t64);
    if (t65 != 0)
        goto LAB29;

LAB26:    if (t63 != 0)
        goto LAB28;

LAB27:    *((unsigned int *)t22) = 1;

LAB29:    t24 = (t22 + 4);
    t66 = *((unsigned int *)t24);
    t67 = (~(t66));
    t68 = *((unsigned int *)t22);
    t69 = (t68 & t67);
    t70 = (t69 != 0);
    if (t70 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(315, ng0);

LAB65:    xsi_set_current_line(316, ng0);
    t2 = (t0 + 5872U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(327, ng0);

LAB74:    xsi_set_current_line(328, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 8672);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(329, ng0);
    t2 = (t0 + 6832U);
    t3 = *((char **)t2);
    t2 = (t0 + 11712);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    xsi_set_current_line(330, ng0);
    t2 = (t0 + 7872);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9952);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 256);
    xsi_set_current_line(331, ng0);
    t2 = (t0 + 8032);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 10272);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB68:
LAB32:    goto LAB24;

LAB28:    t23 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB29;

LAB30:    xsi_set_current_line(285, ng0);

LAB33:    xsi_set_current_line(286, ng0);
    t25 = (t0 + 10432);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 4);
    t71 = *((unsigned int *)t28);
    t72 = (~(t71));
    t73 = *((unsigned int *)t27);
    t74 = (t73 & t72);
    t75 = (t74 != 0);
    if (t75 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(299, ng0);

LAB52:    xsi_set_current_line(300, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 8192);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(301, ng0);
    t2 = (t0 + 5872U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB53;

LAB54:
LAB55:    xsi_set_current_line(304, ng0);
    t2 = (t0 + 4272U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB57;

LAB58:
LAB59:
LAB36:    goto LAB32;

LAB34:    xsi_set_current_line(286, ng0);

LAB37:    xsi_set_current_line(287, ng0);
    t29 = (t0 + 6032U);
    t31 = *((char **)t29);
    memset(t30, 0, 8);
    t29 = (t31 + 4);
    t76 = *((unsigned int *)t29);
    t77 = (~(t76));
    t78 = *((unsigned int *)t31);
    t79 = (t78 & t77);
    t80 = (t79 & 1U);
    if (t80 != 0)
        goto LAB41;

LAB39:    if (*((unsigned int *)t29) == 0)
        goto LAB38;

LAB40:    t32 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t32) = 1;

LAB41:    t33 = (t30 + 4);
    t35 = (t31 + 4);
    t81 = *((unsigned int *)t31);
    t82 = (~(t81));
    *((unsigned int *)t30) = t82;
    *((unsigned int *)t33) = 0;
    if (*((unsigned int *)t35) != 0)
        goto LAB43;

LAB42:    t87 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t87 & 1U);
    t88 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t88 & 1U);
    t39 = (t30 + 4);
    t89 = *((unsigned int *)t39);
    t90 = (~(t89));
    t91 = *((unsigned int *)t30);
    t92 = (t91 & t90);
    t93 = (t92 != 0);
    if (t93 > 0)
        goto LAB44;

LAB45:
LAB46:    goto LAB36;

LAB38:    *((unsigned int *)t30) = 1;
    goto LAB41;

LAB43:    t83 = *((unsigned int *)t30);
    t84 = *((unsigned int *)t35);
    *((unsigned int *)t30) = (t83 | t84);
    t85 = *((unsigned int *)t33);
    t86 = *((unsigned int *)t35);
    *((unsigned int *)t33) = (t85 | t86);
    goto LAB42;

LAB44:    xsi_set_current_line(287, ng0);

LAB47:    xsi_set_current_line(288, ng0);
    t41 = ((char*)((ng5)));
    t94 = (t0 + 8192);
    xsi_vlogvar_assign_value(t94, t41, 0, 0, 1);
    xsi_set_current_line(289, ng0);
    t2 = (t0 + 4272U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB48;

LAB49:
LAB50:    goto LAB46;

LAB48:    xsi_set_current_line(289, ng0);

LAB51:    xsi_set_current_line(290, ng0);
    t4 = ((char*)((ng5)));
    t5 = (t0 + 8672);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(291, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 8992);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(292, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11712);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(293, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 10592);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(294, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 9952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 256);
    xsi_set_current_line(295, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 10272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB50;

LAB53:    xsi_set_current_line(301, ng0);

LAB56:    xsi_set_current_line(302, ng0);
    t4 = ((char*)((ng5)));
    t5 = (t0 + 8352);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB55;

LAB57:    xsi_set_current_line(304, ng0);

LAB60:    xsi_set_current_line(305, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 11712);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(306, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 9952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 256);
    xsi_set_current_line(307, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 10272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(308, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 8672);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(309, ng0);
    t2 = (t0 + 5872U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB61;

LAB62:
LAB63:    goto LAB59;

LAB61:    xsi_set_current_line(309, ng0);

LAB64:    xsi_set_current_line(310, ng0);
    t4 = ((char*)((ng5)));
    t5 = (t0 + 10592);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB63;

LAB66:    xsi_set_current_line(316, ng0);

LAB69:    xsi_set_current_line(317, ng0);
    t4 = ((char*)((ng5)));
    t5 = (t0 + 8192);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(318, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 8352);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(319, ng0);
    t2 = (t0 + 4272U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB70;

LAB71:
LAB72:    goto LAB68;

LAB70:    xsi_set_current_line(319, ng0);

LAB73:    xsi_set_current_line(320, ng0);
    t4 = ((char*)((ng5)));
    t5 = (t0 + 8672);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(321, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11712);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(322, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 9952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 256);
    xsi_set_current_line(323, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 10272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(324, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 10592);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB72;

}

static void Always_337_7(char *t0)
{
    char t4[8];
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

LAB0:    t1 = (t0 + 14680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(337, ng0);
    t2 = (t0 + 16072);
    *((int *)t2) = 1;
    t3 = (t0 + 14712);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(337, ng0);

LAB5:    xsi_set_current_line(338, ng0);
    t5 = (t0 + 3952U);
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

LAB13:    xsi_set_current_line(345, ng0);

LAB16:    xsi_set_current_line(346, ng0);
    t2 = (t0 + 11712);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 11552);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(347, ng0);
    t2 = (t0 + 10592);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 10432);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(348, ng0);
    t2 = (t0 + 9472);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 9312);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 16, 0LL);
    xsi_set_current_line(349, ng0);
    t2 = (t0 + 9952);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 9792);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 256, 0LL);
    xsi_set_current_line(350, ng0);
    t2 = (t0 + 10272);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 10112);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 32, 0LL);

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

LAB12:    xsi_set_current_line(338, ng0);

LAB15:    xsi_set_current_line(339, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 11552);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 2, 0LL);
    xsi_set_current_line(340, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 10432);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(341, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 9312);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(342, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 9792);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(343, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 10112);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB14;

}

static void implSig1_execute(char *t0)
{
    char t3[80];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 14928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 4432U);
    t4 = *((char **)t2);
    t2 = (t0 + 4592U);
    t5 = *((char **)t2);
    t2 = (t0 + 5072U);
    t6 = *((char **)t2);
    xsi_vlogtype_concat(t3, 289, 289, 3U, t6, 1, t5, 32, t4, 256);
    t2 = (t0 + 16408);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    xsi_vlog_bit_copy(t10, 0, t3, 0, 289);
    xsi_driver_vfirst_trans(t2, 0, 288);
    t11 = (t0 + 16088);
    *((int *)t11) = 1;

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
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
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;

LAB0:    t1 = (t0 + 15176U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 4912U);
    t3 = *((char **)t2);
    t2 = (t0 + 8512);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t5);
    t9 = (t7 & t8);
    *((unsigned int *)t6) = t9;
    t10 = (t3 + 4);
    t11 = (t5 + 4);
    t12 = (t6 + 4);
    t13 = *((unsigned int *)t10);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    t38 = (t0 + 16472);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    memset(t42, 0, 8);
    t43 = 1U;
    t44 = t43;
    t45 = (t6 + 4);
    t46 = *((unsigned int *)t6);
    t43 = (t43 & t46);
    t47 = *((unsigned int *)t45);
    t44 = (t44 & t47);
    t48 = (t42 + 4);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t49 | t43);
    t50 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t50 | t44);
    xsi_driver_vfirst_trans(t38, 0, 0);
    t51 = (t0 + 16104);
    *((int *)t51) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t6);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t6) = (t18 | t19);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
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
    t36 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t36 & t32);
    t37 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t37 & t33);
    goto LAB6;

}

static void implSig3_execute(char *t0)
{
    char t3[8];
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
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;

LAB0:    t1 = (t0 + 15424U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3952U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    t11 = (t3 + 4);
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (~(t13));
    *((unsigned int *)t3) = t14;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB9;

LAB8:    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 1U);
    t20 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t20 & 1U);
    t21 = (t0 + 16536);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t25, 0, 8);
    t26 = 1U;
    t27 = t26;
    t28 = (t3 + 4);
    t29 = *((unsigned int *)t3);
    t26 = (t26 & t29);
    t30 = *((unsigned int *)t28);
    t27 = (t27 & t30);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t32 | t26);
    t33 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t33 | t27);
    xsi_driver_vfirst_trans(t21, 0, 0);
    t34 = (t0 + 16120);
    *((int *)t34) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

LAB9:    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t12);
    *((unsigned int *)t3) = (t15 | t16);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t17 | t18);
    goto LAB8;

}

static void implSig4_execute(char *t0)
{
    char t3[8];
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
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;

LAB0:    t1 = (t0 + 15672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3952U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    t11 = (t3 + 4);
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (~(t13));
    *((unsigned int *)t3) = t14;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB9;

LAB8:    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 1U);
    t20 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t20 & 1U);
    t21 = (t0 + 16600);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t25, 0, 8);
    t26 = 1U;
    t27 = t26;
    t28 = (t3 + 4);
    t29 = *((unsigned int *)t3);
    t26 = (t26 & t29);
    t30 = *((unsigned int *)t28);
    t27 = (t27 & t30);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t32 | t26);
    t33 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t33 | t27);
    xsi_driver_vfirst_trans(t21, 0, 0);
    t34 = (t0 + 16136);
    *((int *)t34) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

LAB9:    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t12);
    *((unsigned int *)t3) = (t15 | t16);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t17 | t18);
    goto LAB8;

}


extern void nf10_axis_converter_v1_00_a_m_09836467322444060199_3171692314_init()
{
	static char *pe[] = {(void *)NetDecl_123_0,(void *)NetDecl_124_1,(void *)Always_154_2,(void *)Always_208_3,(void *)Always_226_4,(void *)NetDecl_263_5,(void *)Always_265_6,(void *)Always_337_7,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute,(void *)implSig4_execute};
	static char *se[] = {(void *)sp_log2};
	xsi_register_didat("nf10_axis_converter_v1_00_a_m_09836467322444060199_3171692314", "isim/isim_system_axisim.sim/nf10_axis_converter_v1_00_a/m_09836467322444060199_3171692314.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
