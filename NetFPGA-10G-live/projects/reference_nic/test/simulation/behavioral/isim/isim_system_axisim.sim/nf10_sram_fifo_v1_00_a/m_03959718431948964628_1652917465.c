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
static const char *ng0 = "/root/NetFPGA-10G-live/projects/reference_nic/test/pcores/nf10_sram_fifo_v1_00_a/hdl/verilog/sketch_calculate.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {15, 0};
static int ng4[] = {8, 0};
static int ng5[] = {7, 0};
static int ng6[] = {0, 0};
static int ng7[] = {4, 0};
static int ng8[] = {3, 0};
static int ng9[] = {23, 0};
static int ng10[] = {16, 0};
static int ng11[] = {31, 0};
static int ng12[] = {24, 0};
static unsigned int ng13[] = {2U, 0U};
static unsigned int ng14[] = {0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U};
static unsigned int ng15[] = {1U, 0U};



static void Always_62_0(char *t0)
{
    char t14[8];
    char t18[8];
    char t35[8];
    char t37[8];
    char t62[8];
    char t70[8];
    char t108[8];
    char t120[8];
    char t121[8];
    char t122[8];
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
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
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
    unsigned int t34;
    char *t36;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
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
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    int t94;
    int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    char *t127;
    char *t128;
    unsigned int t129;
    int t130;
    char *t131;
    unsigned int t132;
    int t133;
    int t134;
    char *t135;
    unsigned int t136;
    int t137;
    int t138;
    unsigned int t139;
    int t140;
    unsigned int t141;
    unsigned int t142;
    int t143;
    int t144;

LAB0:    t1 = (t0 + 7680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 9240);
    *((int *)t2) = 1;
    t3 = (t0 + 7712);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(63, ng0);

LAB5:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 1728U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng13)));
    memset(t14, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB89;

LAB88:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB89;

LAB92:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB91;

LAB90:    *((unsigned int *)t14) = 1;

LAB91:    t15 = (t14 + 4);
    t6 = *((unsigned int *)t15);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB93;

LAB94:
LAB95:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(65, ng0);

LAB9:    xsi_set_current_line(66, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5488);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5808);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5968);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(77, ng0);

LAB13:    xsi_set_current_line(78, ng0);
    t4 = (t0 + 6768);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 2848U);
    t13 = *((char **)t12);
    t12 = (t0 + 2808U);
    t15 = (t12 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng2)));
    xsi_vlog_generic_get_index_select_value(t14, 2, t13, t16, 2, t17, 32, 1);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 2, t11, 2, t14, 2);
    t19 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 2, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t14, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t20 = (t9 ^ t10);
    t21 = (t8 | t20);
    t22 = *((unsigned int *)t11);
    t23 = *((unsigned int *)t12);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB17;

LAB14:    if (t24 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t14) = 1;

LAB17:    memset(t18, 0, 8);
    t15 = (t14 + 4);
    t27 = *((unsigned int *)t15);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t15) != 0)
        goto LAB20;

LAB21:    t17 = (t18 + 4);
    t32 = *((unsigned int *)t18);
    t33 = *((unsigned int *)t17);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB22;

LAB23:    memcpy(t70, t18, 8);

LAB24:    t102 = (t70 + 4);
    t103 = *((unsigned int *)t102);
    t104 = (~(t103));
    t105 = *((unsigned int *)t70);
    t106 = (t105 & t104);
    t107 = (t106 != 0);
    if (t107 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t14, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t20 = (t9 ^ t10);
    t21 = (t8 | t20);
    t22 = *((unsigned int *)t11);
    t23 = *((unsigned int *)t12);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB53;

LAB50:    if (t24 != 0)
        goto LAB52;

LAB51:    *((unsigned int *)t14) = 1;

LAB53:    memset(t18, 0, 8);
    t15 = (t14 + 4);
    t27 = *((unsigned int *)t15);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t15) != 0)
        goto LAB56;

LAB57:    t17 = (t18 + 4);
    t32 = *((unsigned int *)t18);
    t33 = *((unsigned int *)t17);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB58;

LAB59:    memcpy(t62, t18, 8);

LAB60:    t75 = (t62 + 4);
    t87 = *((unsigned int *)t75);
    t88 = (~(t87));
    t89 = *((unsigned int *)t62);
    t90 = (t89 & t88);
    t91 = (t90 != 0);
    if (t91 > 0)
        goto LAB68;

LAB69:
LAB70:
LAB40:    goto LAB12;

LAB16:    t13 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB17;

LAB18:    *((unsigned int *)t18) = 1;
    goto LAB21;

LAB20:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB21;

LAB22:    t19 = (t0 + 2848U);
    t36 = *((char **)t19);
    memset(t37, 0, 8);
    t19 = (t37 + 4);
    t38 = (t36 + 4);
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 1);
    t41 = (t40 & 1);
    *((unsigned int *)t37) = t41;
    t42 = *((unsigned int *)t38);
    t43 = (t42 >> 1);
    t44 = (t43 & 1);
    *((unsigned int *)t19) = t44;
    memset(t35, 0, 8);
    t45 = (t37 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t37);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB28;

LAB26:    if (*((unsigned int *)t45) == 0)
        goto LAB25;

LAB27:    t51 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t51) = 1;

LAB28:    t52 = (t35 + 4);
    t53 = (t37 + 4);
    t54 = *((unsigned int *)t37);
    t55 = (~(t54));
    *((unsigned int *)t35) = t55;
    *((unsigned int *)t52) = 0;
    if (*((unsigned int *)t53) != 0)
        goto LAB30;

LAB29:    t60 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t60 & 1U);
    t61 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t61 & 1U);
    memset(t62, 0, 8);
    t63 = (t35 + 4);
    t64 = *((unsigned int *)t63);
    t65 = (~(t64));
    t66 = *((unsigned int *)t35);
    t67 = (t66 & t65);
    t68 = (t67 & 1U);
    if (t68 != 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t63) != 0)
        goto LAB33;

LAB34:    t71 = *((unsigned int *)t18);
    t72 = *((unsigned int *)t62);
    t73 = (t71 & t72);
    *((unsigned int *)t70) = t73;
    t74 = (t18 + 4);
    t75 = (t62 + 4);
    t76 = (t70 + 4);
    t77 = *((unsigned int *)t74);
    t78 = *((unsigned int *)t75);
    t79 = (t77 | t78);
    *((unsigned int *)t76) = t79;
    t80 = *((unsigned int *)t76);
    t81 = (t80 != 0);
    if (t81 == 1)
        goto LAB35;

LAB36:
LAB37:    goto LAB24;

LAB25:    *((unsigned int *)t35) = 1;
    goto LAB28;

LAB30:    t56 = *((unsigned int *)t35);
    t57 = *((unsigned int *)t53);
    *((unsigned int *)t35) = (t56 | t57);
    t58 = *((unsigned int *)t52);
    t59 = *((unsigned int *)t53);
    *((unsigned int *)t52) = (t58 | t59);
    goto LAB29;

LAB31:    *((unsigned int *)t62) = 1;
    goto LAB34;

LAB33:    t69 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t69) = 1;
    goto LAB34;

LAB35:    t82 = *((unsigned int *)t70);
    t83 = *((unsigned int *)t76);
    *((unsigned int *)t70) = (t82 | t83);
    t84 = (t18 + 4);
    t85 = (t62 + 4);
    t86 = *((unsigned int *)t18);
    t87 = (~(t86));
    t88 = *((unsigned int *)t84);
    t89 = (~(t88));
    t90 = *((unsigned int *)t62);
    t91 = (~(t90));
    t92 = *((unsigned int *)t85);
    t93 = (~(t92));
    t94 = (t87 & t89);
    t95 = (t91 & t93);
    t96 = (~(t94));
    t97 = (~(t95));
    t98 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t98 & t96);
    t99 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t99 & t97);
    t100 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t100 & t96);
    t101 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t101 & t97);
    goto LAB37;

LAB38:    xsi_set_current_line(80, ng0);

LAB41:    xsi_set_current_line(81, ng0);
    t109 = (t0 + 2848U);
    t110 = *((char **)t109);
    memset(t108, 0, 8);
    t109 = (t108 + 4);
    t111 = (t110 + 24);
    t112 = (t110 + 28);
    t113 = *((unsigned int *)t111);
    t114 = (t113 >> 9);
    *((unsigned int *)t108) = t114;
    t115 = *((unsigned int *)t112);
    t116 = (t115 >> 9);
    *((unsigned int *)t109) = t116;
    t117 = *((unsigned int *)t108);
    *((unsigned int *)t108) = (t117 & 255U);
    t118 = *((unsigned int *)t109);
    *((unsigned int *)t109) = (t118 & 255U);
    t119 = (t0 + 6128);
    t123 = (t0 + 6128);
    t124 = (t123 + 72U);
    t125 = *((char **)t124);
    t126 = ((char*)((ng3)));
    t127 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t120, t121, t122, ((int*)(t125)), 2, t126, 32, 1, t127, 32, 1);
    t128 = (t120 + 4);
    t129 = *((unsigned int *)t128);
    t130 = (!(t129));
    t131 = (t121 + 4);
    t132 = *((unsigned int *)t131);
    t133 = (!(t132));
    t134 = (t130 && t133);
    t135 = (t122 + 4);
    t136 = *((unsigned int *)t135);
    t137 = (!(t136));
    t138 = (t134 && t137);
    if (t138 == 1)
        goto LAB42;

LAB43:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 24);
    t5 = (t3 + 28);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 17);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 17);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 6128);
    t12 = (t0 + 6128);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng5)));
    t17 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB44;

LAB45:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 48);
    t5 = (t3 + 52);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 15U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 15U);
    t11 = (t0 + 6448);
    t12 = (t0 + 6448);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng5)));
    t17 = ((char*)((ng7)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB46;

LAB47:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 48);
    t5 = (t3 + 52);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 5);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 5);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 15U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 15U);
    t11 = (t0 + 6448);
    t12 = (t0 + 6448);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng8)));
    t17 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB48;

LAB49:    goto LAB40;

LAB42:    t139 = *((unsigned int *)t122);
    t140 = (t139 + 0);
    t141 = *((unsigned int *)t120);
    t142 = *((unsigned int *)t121);
    t143 = (t141 - t142);
    t144 = (t143 + 1);
    xsi_vlogvar_wait_assign_value(t119, t108, t140, *((unsigned int *)t121), t144, 0LL);
    goto LAB43;

LAB44:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB45;

LAB46:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB47;

LAB48:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB49;

LAB52:    t13 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB53;

LAB54:    *((unsigned int *)t18) = 1;
    goto LAB57;

LAB56:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB57;

LAB58:    t19 = (t0 + 2848U);
    t36 = *((char **)t19);
    memset(t35, 0, 8);
    t19 = (t35 + 4);
    t38 = (t36 + 4);
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 1);
    t41 = (t40 & 1);
    *((unsigned int *)t35) = t41;
    t42 = *((unsigned int *)t38);
    t43 = (t42 >> 1);
    t44 = (t43 & 1);
    *((unsigned int *)t19) = t44;
    memset(t37, 0, 8);
    t45 = (t35 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (~(t46));
    t48 = *((unsigned int *)t35);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t45) != 0)
        goto LAB63;

LAB64:    t54 = *((unsigned int *)t18);
    t55 = *((unsigned int *)t37);
    t56 = (t54 & t55);
    *((unsigned int *)t62) = t56;
    t52 = (t18 + 4);
    t53 = (t37 + 4);
    t63 = (t62 + 4);
    t57 = *((unsigned int *)t52);
    t58 = *((unsigned int *)t53);
    t59 = (t57 | t58);
    *((unsigned int *)t63) = t59;
    t60 = *((unsigned int *)t63);
    t61 = (t60 != 0);
    if (t61 == 1)
        goto LAB65;

LAB66:
LAB67:    goto LAB60;

LAB61:    *((unsigned int *)t37) = 1;
    goto LAB64;

LAB63:    t51 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB64;

LAB65:    t64 = *((unsigned int *)t62);
    t65 = *((unsigned int *)t63);
    *((unsigned int *)t62) = (t64 | t65);
    t69 = (t18 + 4);
    t74 = (t37 + 4);
    t66 = *((unsigned int *)t18);
    t67 = (~(t66));
    t68 = *((unsigned int *)t69);
    t71 = (~(t68));
    t72 = *((unsigned int *)t37);
    t73 = (~(t72));
    t77 = *((unsigned int *)t74);
    t78 = (~(t77));
    t94 = (t67 & t71);
    t95 = (t73 & t78);
    t79 = (~(t94));
    t80 = (~(t95));
    t81 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t81 & t79);
    t82 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t82 & t80);
    t83 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t83 & t79);
    t86 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t86 & t80);
    goto LAB67;

LAB68:    xsi_set_current_line(87, ng0);

LAB71:    xsi_set_current_line(88, ng0);
    t76 = (t0 + 6128);
    t84 = (t76 + 56U);
    t85 = *((char **)t84);
    t102 = (t0 + 6288);
    xsi_vlogvar_wait_assign_value(t102, t85, 0, 0, 16, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 6448);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 8);
    t5 = (t3 + 12);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 17);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 17);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 5488);
    t12 = (t0 + 5488);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng5)));
    t17 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB72;

LAB73:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 8);
    t5 = (t3 + 12);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 9);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 9);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 5488);
    t12 = (t0 + 5488);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng3)));
    t17 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB74;

LAB75:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 8);
    t5 = (t3 + 12);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 5488);
    t12 = (t0 + 5488);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng9)));
    t17 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB76;

LAB77:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 25);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 25);
    *((unsigned int *)t2) = t9;
    t5 = (t3 + 8);
    t11 = (t3 + 12);
    t10 = *((unsigned int *)t5);
    t20 = (t10 << 7);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t21 | t20);
    t22 = *((unsigned int *)t11);
    t23 = (t22 << 7);
    t24 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t24 | t23);
    t25 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t25 & 255U);
    t26 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t26 & 255U);
    t12 = (t0 + 5488);
    t13 = (t0 + 5488);
    t15 = (t13 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng11)));
    t19 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t16)), 2, t17, 32, 1, t19, 32, 1);
    t36 = (t18 + 4);
    t27 = *((unsigned int *)t36);
    t94 = (!(t27));
    t38 = (t35 + 4);
    t28 = *((unsigned int *)t38);
    t95 = (!(t28));
    t130 = (t94 && t95);
    t45 = (t37 + 4);
    t29 = *((unsigned int *)t45);
    t133 = (!(t29));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB78;

LAB79:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 8);
    t5 = (t3 + 12);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 25);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 25);
    *((unsigned int *)t2) = t9;
    t11 = (t3 + 16);
    t12 = (t3 + 20);
    t10 = *((unsigned int *)t11);
    t20 = (t10 << 7);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t21 | t20);
    t22 = *((unsigned int *)t12);
    t23 = (t22 << 7);
    t24 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t24 | t23);
    t25 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t25 & 255U);
    t26 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t26 & 255U);
    t13 = (t0 + 5648);
    t15 = (t0 + 5648);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t19 = ((char*)((ng11)));
    t36 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t17)), 2, t19, 32, 1, t36, 32, 1);
    t38 = (t18 + 4);
    t27 = *((unsigned int *)t38);
    t94 = (!(t27));
    t45 = (t35 + 4);
    t28 = *((unsigned int *)t45);
    t95 = (!(t28));
    t130 = (t94 && t95);
    t51 = (t37 + 4);
    t29 = *((unsigned int *)t51);
    t133 = (!(t29));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB80;

LAB81:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 16);
    t5 = (t3 + 20);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 5648);
    t12 = (t0 + 5648);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng9)));
    t17 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB82;

LAB83:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 16);
    t5 = (t3 + 20);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 9);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 9);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 5648);
    t12 = (t0 + 5648);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng3)));
    t17 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB84;

LAB85:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 16);
    t5 = (t3 + 20);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 17);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 17);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 5648);
    t12 = (t0 + 5648);
    t13 = (t12 + 72U);
    t15 = *((char **)t13);
    t16 = ((char*)((ng5)));
    t17 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t18, t35, t37, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t21 = *((unsigned int *)t19);
    t94 = (!(t21));
    t36 = (t35 + 4);
    t22 = *((unsigned int *)t36);
    t95 = (!(t22));
    t130 = (t94 && t95);
    t38 = (t37 + 4);
    t23 = *((unsigned int *)t38);
    t133 = (!(t23));
    t134 = (t130 && t133);
    if (t134 == 1)
        goto LAB86;

LAB87:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2048U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 16);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 16);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t5 = (t0 + 5808);
    xsi_vlogvar_wait_assign_value(t5, t14, 0, 0, 16, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2048U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 24);
    *((unsigned int *)t14) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 24);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t5 = (t0 + 5968);
    xsi_vlogvar_wait_assign_value(t5, t14, 0, 0, 16, 0LL);
    goto LAB70;

LAB72:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB73;

LAB74:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB75;

LAB76:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB77;

LAB78:    t30 = *((unsigned int *)t37);
    t137 = (t30 + 0);
    t31 = *((unsigned int *)t18);
    t32 = *((unsigned int *)t35);
    t138 = (t31 - t32);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t12, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB79;

LAB80:    t30 = *((unsigned int *)t37);
    t137 = (t30 + 0);
    t31 = *((unsigned int *)t18);
    t32 = *((unsigned int *)t35);
    t138 = (t31 - t32);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t13, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB81;

LAB82:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB83;

LAB84:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB85;

LAB86:    t24 = *((unsigned int *)t37);
    t137 = (t24 + 0);
    t25 = *((unsigned int *)t18);
    t26 = *((unsigned int *)t35);
    t138 = (t25 - t26);
    t140 = (t138 + 1);
    xsi_vlogvar_wait_assign_value(t11, t14, t137, *((unsigned int *)t35), t140, 0LL);
    goto LAB87;

LAB89:    t13 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB91;

LAB93:    xsi_set_current_line(103, ng0);

LAB96:    xsi_set_current_line(104, ng0);
    t16 = ((char*)((ng1)));
    t17 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 2, 0LL);
    goto LAB95;

}

static void Cont_132_1(char *t0)
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
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 7928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 4128U);
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
    *((unsigned int *)t3) = (t10 & 65535U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 65535U);
    t12 = (t0 + 9400);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 65535U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 15);
    t25 = (t0 + 9256);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_135_2(char *t0)
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
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 8176U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 2048U);
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
    *((unsigned int *)t3) = (t10 & 65535U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 65535U);
    t12 = (t0 + 9464);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 65535U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 15);
    t25 = (t0 + 9272);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Always_153_3(char *t0)
{
    char t6[8];
    char t17[8];
    char t36[8];
    char t48[8];
    char t67[8];
    char t75[8];
    char t107[8];
    char t115[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
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
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
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
    unsigned int t66;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    int t99;
    int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    char *t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    char *t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;
    char *t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    int t139;
    int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    char *t147;

LAB0:    t1 = (t0 + 8424U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 9288);
    *((int *)t2) = 1;
    t3 = (t0 + 8456);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(154, ng0);

LAB5:    xsi_set_current_line(155, ng0);
    t4 = (t0 + 2688U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t4) != 0)
        goto LAB8;

LAB9:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB10;

LAB11:    memcpy(t115, t6, 8);

LAB12:    t147 = (t0 + 5168);
    xsi_vlogvar_assign_value(t147, t115, 0, 0, 1);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 2368U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t2) != 0)
        goto LAB48;

LAB49:    t5 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t5);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB50;

LAB51:    memcpy(t115, t6, 8);

LAB52:    t129 = (t0 + 5328);
    xsi_vlogvar_assign_value(t129, t115, 0, 0, 1);
    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t18 = (t0 + 2528U);
    t19 = *((char **)t18);
    memset(t17, 0, 8);
    t18 = (t19 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t19);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB16;

LAB14:    if (*((unsigned int *)t18) == 0)
        goto LAB13;

LAB15:    t25 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t25) = 1;

LAB16:    t26 = (t17 + 4);
    t27 = (t19 + 4);
    t28 = *((unsigned int *)t19);
    t29 = (~(t28));
    *((unsigned int *)t17) = t29;
    *((unsigned int *)t26) = 0;
    if (*((unsigned int *)t27) != 0)
        goto LAB18;

LAB17:    t34 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t34 & 1U);
    t35 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t35 & 1U);
    memset(t36, 0, 8);
    t37 = (t17 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t17);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t37) != 0)
        goto LAB21;

LAB22:    t44 = (t36 + 4);
    t45 = *((unsigned int *)t36);
    t46 = *((unsigned int *)t44);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB23;

LAB24:    memcpy(t75, t36, 8);

LAB25:    memset(t107, 0, 8);
    t108 = (t75 + 4);
    t109 = *((unsigned int *)t108);
    t110 = (~(t109));
    t111 = *((unsigned int *)t75);
    t112 = (t111 & t110);
    t113 = (t112 & 1U);
    if (t113 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t108) != 0)
        goto LAB41;

LAB42:    t116 = *((unsigned int *)t6);
    t117 = *((unsigned int *)t107);
    t118 = (t116 & t117);
    *((unsigned int *)t115) = t118;
    t119 = (t6 + 4);
    t120 = (t107 + 4);
    t121 = (t115 + 4);
    t122 = *((unsigned int *)t119);
    t123 = *((unsigned int *)t120);
    t124 = (t122 | t123);
    *((unsigned int *)t121) = t124;
    t125 = *((unsigned int *)t121);
    t126 = (t125 != 0);
    if (t126 == 1)
        goto LAB43;

LAB44:
LAB45:    goto LAB12;

LAB13:    *((unsigned int *)t17) = 1;
    goto LAB16;

LAB18:    t30 = *((unsigned int *)t17);
    t31 = *((unsigned int *)t27);
    *((unsigned int *)t17) = (t30 | t31);
    t32 = *((unsigned int *)t26);
    t33 = *((unsigned int *)t27);
    *((unsigned int *)t26) = (t32 | t33);
    goto LAB17;

LAB19:    *((unsigned int *)t36) = 1;
    goto LAB22;

LAB21:    t43 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB22;

LAB23:    t49 = (t0 + 3008U);
    t50 = *((char **)t49);
    memset(t48, 0, 8);
    t49 = (t50 + 4);
    t51 = *((unsigned int *)t49);
    t52 = (~(t51));
    t53 = *((unsigned int *)t50);
    t54 = (t53 & t52);
    t55 = (t54 & 1U);
    if (t55 != 0)
        goto LAB29;

LAB27:    if (*((unsigned int *)t49) == 0)
        goto LAB26;

LAB28:    t56 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t56) = 1;

LAB29:    t57 = (t48 + 4);
    t58 = (t50 + 4);
    t59 = *((unsigned int *)t50);
    t60 = (~(t59));
    *((unsigned int *)t48) = t60;
    *((unsigned int *)t57) = 0;
    if (*((unsigned int *)t58) != 0)
        goto LAB31;

LAB30:    t65 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t65 & 1U);
    t66 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t66 & 1U);
    memset(t67, 0, 8);
    t68 = (t48 + 4);
    t69 = *((unsigned int *)t68);
    t70 = (~(t69));
    t71 = *((unsigned int *)t48);
    t72 = (t71 & t70);
    t73 = (t72 & 1U);
    if (t73 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t68) != 0)
        goto LAB34;

LAB35:    t76 = *((unsigned int *)t36);
    t77 = *((unsigned int *)t67);
    t78 = (t76 & t77);
    *((unsigned int *)t75) = t78;
    t79 = (t36 + 4);
    t80 = (t67 + 4);
    t81 = (t75 + 4);
    t82 = *((unsigned int *)t79);
    t83 = *((unsigned int *)t80);
    t84 = (t82 | t83);
    *((unsigned int *)t81) = t84;
    t85 = *((unsigned int *)t81);
    t86 = (t85 != 0);
    if (t86 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB25;

LAB26:    *((unsigned int *)t48) = 1;
    goto LAB29;

LAB31:    t61 = *((unsigned int *)t48);
    t62 = *((unsigned int *)t58);
    *((unsigned int *)t48) = (t61 | t62);
    t63 = *((unsigned int *)t57);
    t64 = *((unsigned int *)t58);
    *((unsigned int *)t57) = (t63 | t64);
    goto LAB30;

LAB32:    *((unsigned int *)t67) = 1;
    goto LAB35;

LAB34:    t74 = (t67 + 4);
    *((unsigned int *)t67) = 1;
    *((unsigned int *)t74) = 1;
    goto LAB35;

LAB36:    t87 = *((unsigned int *)t75);
    t88 = *((unsigned int *)t81);
    *((unsigned int *)t75) = (t87 | t88);
    t89 = (t36 + 4);
    t90 = (t67 + 4);
    t91 = *((unsigned int *)t36);
    t92 = (~(t91));
    t93 = *((unsigned int *)t89);
    t94 = (~(t93));
    t95 = *((unsigned int *)t67);
    t96 = (~(t95));
    t97 = *((unsigned int *)t90);
    t98 = (~(t97));
    t99 = (t92 & t94);
    t100 = (t96 & t98);
    t101 = (~(t99));
    t102 = (~(t100));
    t103 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t103 & t101);
    t104 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t104 & t102);
    t105 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t105 & t101);
    t106 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t106 & t102);
    goto LAB38;

LAB39:    *((unsigned int *)t107) = 1;
    goto LAB42;

LAB41:    t114 = (t107 + 4);
    *((unsigned int *)t107) = 1;
    *((unsigned int *)t114) = 1;
    goto LAB42;

LAB43:    t127 = *((unsigned int *)t115);
    t128 = *((unsigned int *)t121);
    *((unsigned int *)t115) = (t127 | t128);
    t129 = (t6 + 4);
    t130 = (t107 + 4);
    t131 = *((unsigned int *)t6);
    t132 = (~(t131));
    t133 = *((unsigned int *)t129);
    t134 = (~(t133));
    t135 = *((unsigned int *)t107);
    t136 = (~(t135));
    t137 = *((unsigned int *)t130);
    t138 = (~(t137));
    t139 = (t132 & t134);
    t140 = (t136 & t138);
    t141 = (~(t139));
    t142 = (~(t140));
    t143 = *((unsigned int *)t121);
    *((unsigned int *)t121) = (t143 & t141);
    t144 = *((unsigned int *)t121);
    *((unsigned int *)t121) = (t144 & t142);
    t145 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t145 & t141);
    t146 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t146 & t142);
    goto LAB45;

LAB46:    *((unsigned int *)t6) = 1;
    goto LAB49;

LAB48:    t4 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB49;

LAB50:    t12 = (t0 + 2208U);
    t13 = *((char **)t12);
    memset(t17, 0, 8);
    t12 = (t13 + 4);
    t20 = *((unsigned int *)t12);
    t21 = (~(t20));
    t22 = *((unsigned int *)t13);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB56;

LAB54:    if (*((unsigned int *)t12) == 0)
        goto LAB53;

LAB55:    t18 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t18) = 1;

LAB56:    t19 = (t17 + 4);
    t25 = (t13 + 4);
    t28 = *((unsigned int *)t13);
    t29 = (~(t28));
    *((unsigned int *)t17) = t29;
    *((unsigned int *)t19) = 0;
    if (*((unsigned int *)t25) != 0)
        goto LAB58;

LAB57:    t34 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t34 & 1U);
    t35 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t35 & 1U);
    memset(t36, 0, 8);
    t26 = (t17 + 4);
    t38 = *((unsigned int *)t26);
    t39 = (~(t38));
    t40 = *((unsigned int *)t17);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t26) != 0)
        goto LAB61;

LAB62:    t37 = (t36 + 4);
    t45 = *((unsigned int *)t36);
    t46 = *((unsigned int *)t37);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB63;

LAB64:    memcpy(t75, t36, 8);

LAB65:    memset(t107, 0, 8);
    t89 = (t75 + 4);
    t109 = *((unsigned int *)t89);
    t110 = (~(t109));
    t111 = *((unsigned int *)t75);
    t112 = (t111 & t110);
    t113 = (t112 & 1U);
    if (t113 != 0)
        goto LAB79;

LAB80:    if (*((unsigned int *)t89) != 0)
        goto LAB81;

LAB82:    t116 = *((unsigned int *)t6);
    t117 = *((unsigned int *)t107);
    t118 = (t116 & t117);
    *((unsigned int *)t115) = t118;
    t108 = (t6 + 4);
    t114 = (t107 + 4);
    t119 = (t115 + 4);
    t122 = *((unsigned int *)t108);
    t123 = *((unsigned int *)t114);
    t124 = (t122 | t123);
    *((unsigned int *)t119) = t124;
    t125 = *((unsigned int *)t119);
    t126 = (t125 != 0);
    if (t126 == 1)
        goto LAB83;

LAB84:
LAB85:    goto LAB52;

LAB53:    *((unsigned int *)t17) = 1;
    goto LAB56;

LAB58:    t30 = *((unsigned int *)t17);
    t31 = *((unsigned int *)t25);
    *((unsigned int *)t17) = (t30 | t31);
    t32 = *((unsigned int *)t19);
    t33 = *((unsigned int *)t25);
    *((unsigned int *)t19) = (t32 | t33);
    goto LAB57;

LAB59:    *((unsigned int *)t36) = 1;
    goto LAB62;

LAB61:    t27 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB62;

LAB63:    t43 = (t0 + 3008U);
    t44 = *((char **)t43);
    memset(t48, 0, 8);
    t43 = (t44 + 4);
    t51 = *((unsigned int *)t43);
    t52 = (~(t51));
    t53 = *((unsigned int *)t44);
    t54 = (t53 & t52);
    t55 = (t54 & 1U);
    if (t55 != 0)
        goto LAB69;

LAB67:    if (*((unsigned int *)t43) == 0)
        goto LAB66;

LAB68:    t49 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t49) = 1;

LAB69:    t50 = (t48 + 4);
    t56 = (t44 + 4);
    t59 = *((unsigned int *)t44);
    t60 = (~(t59));
    *((unsigned int *)t48) = t60;
    *((unsigned int *)t50) = 0;
    if (*((unsigned int *)t56) != 0)
        goto LAB71;

LAB70:    t65 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t65 & 1U);
    t66 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t66 & 1U);
    memset(t67, 0, 8);
    t57 = (t48 + 4);
    t69 = *((unsigned int *)t57);
    t70 = (~(t69));
    t71 = *((unsigned int *)t48);
    t72 = (t71 & t70);
    t73 = (t72 & 1U);
    if (t73 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t57) != 0)
        goto LAB74;

LAB75:    t76 = *((unsigned int *)t36);
    t77 = *((unsigned int *)t67);
    t78 = (t76 & t77);
    *((unsigned int *)t75) = t78;
    t68 = (t36 + 4);
    t74 = (t67 + 4);
    t79 = (t75 + 4);
    t82 = *((unsigned int *)t68);
    t83 = *((unsigned int *)t74);
    t84 = (t82 | t83);
    *((unsigned int *)t79) = t84;
    t85 = *((unsigned int *)t79);
    t86 = (t85 != 0);
    if (t86 == 1)
        goto LAB76;

LAB77:
LAB78:    goto LAB65;

LAB66:    *((unsigned int *)t48) = 1;
    goto LAB69;

LAB71:    t61 = *((unsigned int *)t48);
    t62 = *((unsigned int *)t56);
    *((unsigned int *)t48) = (t61 | t62);
    t63 = *((unsigned int *)t50);
    t64 = *((unsigned int *)t56);
    *((unsigned int *)t50) = (t63 | t64);
    goto LAB70;

LAB72:    *((unsigned int *)t67) = 1;
    goto LAB75;

LAB74:    t58 = (t67 + 4);
    *((unsigned int *)t67) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB75;

LAB76:    t87 = *((unsigned int *)t75);
    t88 = *((unsigned int *)t79);
    *((unsigned int *)t75) = (t87 | t88);
    t80 = (t36 + 4);
    t81 = (t67 + 4);
    t91 = *((unsigned int *)t36);
    t92 = (~(t91));
    t93 = *((unsigned int *)t80);
    t94 = (~(t93));
    t95 = *((unsigned int *)t67);
    t96 = (~(t95));
    t97 = *((unsigned int *)t81);
    t98 = (~(t97));
    t99 = (t92 & t94);
    t100 = (t96 & t98);
    t101 = (~(t99));
    t102 = (~(t100));
    t103 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t103 & t101);
    t104 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t104 & t102);
    t105 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t105 & t101);
    t106 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t106 & t102);
    goto LAB78;

LAB79:    *((unsigned int *)t107) = 1;
    goto LAB82;

LAB81:    t90 = (t107 + 4);
    *((unsigned int *)t107) = 1;
    *((unsigned int *)t90) = 1;
    goto LAB82;

LAB83:    t127 = *((unsigned int *)t115);
    t128 = *((unsigned int *)t119);
    *((unsigned int *)t115) = (t127 | t128);
    t120 = (t6 + 4);
    t121 = (t107 + 4);
    t131 = *((unsigned int *)t6);
    t132 = (~(t131));
    t133 = *((unsigned int *)t120);
    t134 = (~(t133));
    t135 = *((unsigned int *)t107);
    t136 = (~(t135));
    t137 = *((unsigned int *)t121);
    t138 = (~(t137));
    t139 = (t132 & t134);
    t140 = (t136 & t138);
    t141 = (~(t139));
    t142 = (~(t140));
    t143 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t143 & t141);
    t144 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t144 & t142);
    t145 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t145 & t141);
    t146 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t146 & t142);
    goto LAB85;

}

static void implSig1_execute(char *t0)
{
    char t3[32];
    char t4[8];
    char t16[32];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;

LAB0:    t1 = (t0 + 8672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2688U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t32 = *((unsigned int *)t4);
    t33 = (~(t32));
    t34 = *((unsigned int *)t12);
    t35 = (t33 || t34);
    if (t35 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t36, 32);

LAB16:    t37 = (t0 + 9528);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    xsi_vlog_bit_copy(t41, 0, t3, 0, 104);
    xsi_driver_vfirst_trans(t37, 0, 103);
    t42 = (t0 + 9304);
    *((int *)t42) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 6608);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t0 + 5968);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t0 + 5808);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t0 + 5648);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t0 + 5488);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    xsi_vlogtype_concat(t16, 104, 104, 5U, t31, 32, t28, 32, t25, 16, t22, 16, t19, 8);
    goto LAB9;

LAB10:    t36 = ((char*)((ng14)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 104, t16, 104, t36, 104);
    goto LAB16;

LAB14:    memcpy(t3, t16, 32);
    goto LAB16;

}

static void implSig2_execute(char *t0)
{
    char t4[8];
    char t19[8];
    char t35[8];
    char t43[8];
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
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;

LAB0:    t1 = (t0 + 8920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2688U);
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

LAB9:    memcpy(t43, t4, 8);

LAB10:    t75 = (t0 + 9592);
    t76 = (t75 + 56U);
    t77 = *((char **)t76);
    t78 = (t77 + 56U);
    t79 = *((char **)t78);
    memset(t79, 0, 8);
    t80 = 1U;
    t81 = t80;
    t82 = (t43 + 4);
    t83 = *((unsigned int *)t43);
    t80 = (t80 & t83);
    t84 = *((unsigned int *)t82);
    t81 = (t81 & t84);
    t85 = (t79 + 4);
    t86 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t86 | t80);
    t87 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t87 | t81);
    xsi_driver_vfirst_trans(t75, 0, 0);
    t88 = (t0 + 9320);
    *((int *)t88) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t15 = (t0 + 6768);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng15)));
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
        goto LAB14;

LAB11:    if (t31 != 0)
        goto LAB13;

LAB12:    *((unsigned int *)t19) = 1;

LAB14:    memset(t35, 0, 8);
    t36 = (t19 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t19);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t36) != 0)
        goto LAB17;

LAB18:    t44 = *((unsigned int *)t4);
    t45 = *((unsigned int *)t35);
    t46 = (t44 & t45);
    *((unsigned int *)t43) = t46;
    t47 = (t4 + 4);
    t48 = (t35 + 4);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t47);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB10;

LAB13:    t34 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB14;

LAB15:    *((unsigned int *)t35) = 1;
    goto LAB18;

LAB17:    t42 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB18;

LAB19:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t43) = (t55 | t56);
    t57 = (t4 + 4);
    t58 = (t35 + 4);
    t59 = *((unsigned int *)t4);
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
    goto LAB21;

}


extern void nf10_sram_fifo_v1_00_a_m_03959718431948964628_1652917465_init()
{
	static char *pe[] = {(void *)Always_62_0,(void *)Cont_132_1,(void *)Cont_135_2,(void *)Always_153_3,(void *)implSig1_execute,(void *)implSig2_execute};
	xsi_register_didat("nf10_sram_fifo_v1_00_a_m_03959718431948964628_1652917465", "isim/isim_system_axisim.sim/nf10_sram_fifo_v1_00_a/m_03959718431948964628_1652917465.didat");
	xsi_register_executes(pe);
}
