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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/std/pcores/nf10_sram_fifo_v1_00_a/hdl/verilog/controller/qdrii_top_ctrl_sm.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {4U, 0U};
static int ng4[] = {4, 0};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {1U, 0U};
static int ng7[] = {2, 0};
static unsigned int ng8[] = {3U, 0U};
static int ng9[] = {0, 0};



static void Always_93_0(char *t0)
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

LAB0:    t1 = (t0 + 4296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 4864);
    *((int *)t2) = 1;
    t3 = (t0 + 4328);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(94, ng0);

LAB5:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 2024U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3224);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(96, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3224);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 3, 0LL);
    goto LAB8;

}

static void Always_102_1(char *t0)
{
    char t14[8];
    char t15[8];
    char t16[8];
    char t55[8];
    char t56[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t57;
    char *t58;
    char *t59;
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
    int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;

LAB0:    t1 = (t0 + 4544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4880);
    *((int *)t2) = 1;
    t3 = (t0 + 4576);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(103, ng0);

LAB5:    xsi_set_current_line(104, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 2904);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 3224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t5, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(161, ng0);

LAB99:    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3384);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB19:    goto LAB2;

LAB7:    xsi_set_current_line(108, ng0);

LAB20:    xsi_set_current_line(109, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 2904);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2504U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3384);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB23:    goto LAB19;

LAB9:    xsi_set_current_line(117, ng0);

LAB24:    xsi_set_current_line(118, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 2904);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2184U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB28;

LAB26:    if (*((unsigned int *)t2) == 0)
        goto LAB25;

LAB27:    t5 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t5) = 1;

LAB28:    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t7 = ((char*)((ng4)));
    memset(t15, 0, 8);
    xsi_vlog_signed_equal(t15, 32, t8, 32, t7, 32);
    t17 = *((unsigned int *)t14);
    t18 = *((unsigned int *)t15);
    t19 = (t17 & t18);
    *((unsigned int *)t16) = t19;
    t20 = (t14 + 4);
    t21 = (t15 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB29;

LAB30:
LAB31:    t47 = (t16 + 4);
    t48 = *((unsigned int *)t47);
    t49 = (~(t48));
    t50 = *((unsigned int *)t16);
    t51 = (t50 & t49);
    t52 = (t51 != 0);
    if (t52 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2344U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB38;

LAB36:    if (*((unsigned int *)t2) == 0)
        goto LAB35;

LAB37:    t5 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t5) = 1;

LAB38:    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t7 = ((char*)((ng4)));
    memset(t15, 0, 8);
    xsi_vlog_signed_equal(t15, 32, t8, 32, t7, 32);
    t17 = *((unsigned int *)t14);
    t18 = *((unsigned int *)t15);
    t19 = (t17 & t18);
    *((unsigned int *)t16) = t19;
    t20 = (t14 + 4);
    t21 = (t15 + 4);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t21);
    t25 = (t23 | t24);
    *((unsigned int *)t22) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 != 0);
    if (t27 == 1)
        goto LAB39;

LAB40:
LAB41:    t47 = (t16 + 4);
    t48 = *((unsigned int *)t47);
    t49 = (~(t48));
    t50 = *((unsigned int *)t16);
    t51 = (t50 & t49);
    t52 = (t51 != 0);
    if (t52 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 2184U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB48;

LAB46:    if (*((unsigned int *)t2) == 0)
        goto LAB45;

LAB47:    t5 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t5) = 1;

LAB48:    t7 = (t0 + 2344U);
    t8 = *((char **)t7);
    memset(t15, 0, 8);
    t7 = (t8 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t8);
    t23 = (t19 & t18);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB52;

LAB50:    if (*((unsigned int *)t7) == 0)
        goto LAB49;

LAB51:    t20 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t20) = 1;

LAB52:    t25 = *((unsigned int *)t14);
    t26 = *((unsigned int *)t15);
    t27 = (t25 | t26);
    *((unsigned int *)t16) = t27;
    t21 = (t14 + 4);
    t22 = (t15 + 4);
    t30 = (t16 + 4);
    t28 = *((unsigned int *)t21);
    t29 = *((unsigned int *)t22);
    t32 = (t28 | t29);
    *((unsigned int *)t30) = t32;
    t33 = *((unsigned int *)t30);
    t34 = (t33 != 0);
    if (t34 == 1)
        goto LAB53;

LAB54:
LAB55:    t53 = (t0 + 472);
    t54 = *((char **)t53);
    t53 = ((char*)((ng7)));
    memset(t55, 0, 8);
    xsi_vlog_signed_equal(t55, 32, t54, 32, t53, 32);
    t49 = *((unsigned int *)t16);
    t50 = *((unsigned int *)t55);
    t51 = (t49 & t50);
    *((unsigned int *)t56) = t51;
    t57 = (t16 + 4);
    t58 = (t55 + 4);
    t59 = (t56 + 4);
    t52 = *((unsigned int *)t57);
    t60 = *((unsigned int *)t58);
    t61 = (t52 | t60);
    *((unsigned int *)t59) = t61;
    t62 = *((unsigned int *)t59);
    t63 = (t62 != 0);
    if (t63 == 1)
        goto LAB56;

LAB57:
LAB58:    t84 = (t56 + 4);
    t85 = *((unsigned int *)t84);
    t86 = (~(t85));
    t87 = *((unsigned int *)t56);
    t88 = (t87 & t86);
    t89 = (t88 != 0);
    if (t89 > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3384);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB61:
LAB44:
LAB34:    goto LAB19;

LAB11:    xsi_set_current_line(130, ng0);

LAB62:    xsi_set_current_line(131, ng0);
    t3 = ((char*)((ng9)));
    t5 = (t0 + 2904);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2344U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB66;

LAB64:    if (*((unsigned int *)t2) == 0)
        goto LAB63;

LAB65:    t5 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t5) = 1;

LAB66:    t7 = (t14 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t14);
    t23 = (t19 & t18);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3384);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB69:    goto LAB19;

LAB13:    xsi_set_current_line(139, ng0);

LAB70:    xsi_set_current_line(140, ng0);
    t3 = ((char*)((ng9)));
    t5 = (t0 + 3064);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 2184U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB74;

LAB72:    if (*((unsigned int *)t2) == 0)
        goto LAB71;

LAB73:    t5 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t5) = 1;

LAB74:    t7 = (t14 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t14);
    t23 = (t19 & t18);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB75;

LAB76:    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3384);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB77:    goto LAB19;

LAB15:    xsi_set_current_line(150, ng0);

LAB78:    xsi_set_current_line(151, ng0);
    t3 = (t0 + 2184U);
    t5 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB82;

LAB80:    if (*((unsigned int *)t3) == 0)
        goto LAB79;

LAB81:    t7 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t7) = 1;

LAB82:    t8 = (t14 + 4);
    t17 = *((unsigned int *)t8);
    t18 = (~(t17));
    t19 = *((unsigned int *)t14);
    t23 = (t19 & t18);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB83;

LAB84:
LAB85:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 2344U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB89;

LAB87:    if (*((unsigned int *)t2) == 0)
        goto LAB86;

LAB88:    t5 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t5) = 1;

LAB89:    t7 = (t14 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t14);
    t23 = (t19 & t18);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB90;

LAB91:
LAB92:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 2184U);
    t3 = *((char **)t2);
    t2 = (t0 + 2344U);
    t5 = *((char **)t2);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t5);
    t11 = (t9 & t10);
    *((unsigned int *)t14) = t11;
    t2 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = (t14 + 4);
    t12 = *((unsigned int *)t2);
    t13 = *((unsigned int *)t7);
    t17 = (t12 | t13);
    *((unsigned int *)t8) = t17;
    t18 = *((unsigned int *)t8);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB93;

LAB94:
LAB95:    t22 = (t14 + 4);
    t42 = *((unsigned int *)t22);
    t43 = (~(t42));
    t44 = *((unsigned int *)t14);
    t45 = (t44 & t43);
    t46 = (t45 != 0);
    if (t46 > 0)
        goto LAB96;

LAB97:    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 3384);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB98:    goto LAB19;

LAB21:    xsi_set_current_line(112, ng0);
    t5 = ((char*)((ng3)));
    t7 = (t0 + 3384);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 3);
    goto LAB23;

LAB25:    *((unsigned int *)t14) = 1;
    goto LAB28;

LAB29:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    t30 = (t14 + 4);
    t31 = (t15 + 4);
    t32 = *((unsigned int *)t14);
    t33 = (~(t32));
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t15);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (~(t38));
    t6 = (t33 & t35);
    t40 = (t37 & t39);
    t41 = (~(t6));
    t42 = (~(t40));
    t43 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t43 & t41);
    t44 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t44 & t42);
    t45 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t45 & t41);
    t46 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t46 & t42);
    goto LAB31;

LAB32:    xsi_set_current_line(121, ng0);
    t53 = ((char*)((ng5)));
    t54 = (t0 + 3384);
    xsi_vlogvar_assign_value(t54, t53, 0, 0, 3);
    goto LAB34;

LAB35:    *((unsigned int *)t14) = 1;
    goto LAB38;

LAB39:    t28 = *((unsigned int *)t16);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t16) = (t28 | t29);
    t30 = (t14 + 4);
    t31 = (t15 + 4);
    t32 = *((unsigned int *)t14);
    t33 = (~(t32));
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t15);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (~(t38));
    t6 = (t33 & t35);
    t40 = (t37 & t39);
    t41 = (~(t6));
    t42 = (~(t40));
    t43 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t43 & t41);
    t44 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t44 & t42);
    t45 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t45 & t41);
    t46 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t46 & t42);
    goto LAB41;

LAB42:    xsi_set_current_line(123, ng0);
    t53 = ((char*)((ng6)));
    t54 = (t0 + 3384);
    xsi_vlogvar_assign_value(t54, t53, 0, 0, 3);
    goto LAB44;

LAB45:    *((unsigned int *)t14) = 1;
    goto LAB48;

LAB49:    *((unsigned int *)t15) = 1;
    goto LAB52;

LAB53:    t35 = *((unsigned int *)t16);
    t36 = *((unsigned int *)t30);
    *((unsigned int *)t16) = (t35 | t36);
    t31 = (t14 + 4);
    t47 = (t15 + 4);
    t37 = *((unsigned int *)t31);
    t38 = (~(t37));
    t39 = *((unsigned int *)t14);
    t6 = (t39 & t38);
    t41 = *((unsigned int *)t47);
    t42 = (~(t41));
    t43 = *((unsigned int *)t15);
    t40 = (t43 & t42);
    t44 = (~(t6));
    t45 = (~(t40));
    t46 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t46 & t44);
    t48 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t48 & t45);
    goto LAB55;

LAB56:    t64 = *((unsigned int *)t56);
    t65 = *((unsigned int *)t59);
    *((unsigned int *)t56) = (t64 | t65);
    t66 = (t16 + 4);
    t67 = (t55 + 4);
    t68 = *((unsigned int *)t16);
    t69 = (~(t68));
    t70 = *((unsigned int *)t66);
    t71 = (~(t70));
    t72 = *((unsigned int *)t55);
    t73 = (~(t72));
    t74 = *((unsigned int *)t67);
    t75 = (~(t74));
    t76 = (t69 & t71);
    t77 = (t73 & t75);
    t78 = (~(t76));
    t79 = (~(t77));
    t80 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t80 & t78);
    t81 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t81 & t79);
    t82 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t82 & t78);
    t83 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t83 & t79);
    goto LAB58;

LAB59:    xsi_set_current_line(125, ng0);
    t90 = ((char*)((ng8)));
    t91 = (t0 + 3384);
    xsi_vlogvar_assign_value(t91, t90, 0, 0, 3);
    goto LAB61;

LAB63:    *((unsigned int *)t14) = 1;
    goto LAB66;

LAB67:    xsi_set_current_line(134, ng0);
    t8 = ((char*)((ng6)));
    t20 = (t0 + 3384);
    xsi_vlogvar_assign_value(t20, t8, 0, 0, 3);
    goto LAB69;

LAB71:    *((unsigned int *)t14) = 1;
    goto LAB74;

LAB75:    xsi_set_current_line(143, ng0);
    t8 = ((char*)((ng5)));
    t20 = (t0 + 3384);
    xsi_vlogvar_assign_value(t20, t8, 0, 0, 3);
    goto LAB77;

LAB79:    *((unsigned int *)t14) = 1;
    goto LAB82;

LAB83:    xsi_set_current_line(152, ng0);
    t20 = ((char*)((ng9)));
    t21 = (t0 + 2904);
    xsi_vlogvar_assign_value(t21, t20, 0, 0, 1);
    goto LAB85;

LAB86:    *((unsigned int *)t14) = 1;
    goto LAB89;

LAB90:    xsi_set_current_line(154, ng0);
    t8 = ((char*)((ng9)));
    t20 = (t0 + 3064);
    xsi_vlogvar_assign_value(t20, t8, 0, 0, 1);
    goto LAB92;

LAB93:    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t8);
    *((unsigned int *)t14) = (t23 | t24);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t25 = *((unsigned int *)t3);
    t26 = (~(t25));
    t27 = *((unsigned int *)t20);
    t28 = (~(t27));
    t29 = *((unsigned int *)t5);
    t32 = (~(t29));
    t33 = *((unsigned int *)t21);
    t34 = (~(t33));
    t6 = (t26 & t28);
    t40 = (t32 & t34);
    t35 = (~(t6));
    t36 = (~(t40));
    t37 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t37 & t35);
    t38 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t38 & t36);
    t39 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t39 & t35);
    t41 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t41 & t36);
    goto LAB95;

LAB96:    xsi_set_current_line(156, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 3384);
    xsi_vlogvar_assign_value(t31, t30, 0, 0, 3);
    goto LAB98;

}


extern void nf10_sram_fifo_v1_00_a_m_06065513958231964605_2606560585_init()
{
	static char *pe[] = {(void *)Always_93_0,(void *)Always_102_1};
	xsi_register_didat("nf10_sram_fifo_v1_00_a_m_06065513958231964605_2606560585", "isim/isim_system_axisim.sim/nf10_sram_fifo_v1_00_a/m_06065513958231964605_2606560585.didat");
	xsi_register_executes(pe);
}
