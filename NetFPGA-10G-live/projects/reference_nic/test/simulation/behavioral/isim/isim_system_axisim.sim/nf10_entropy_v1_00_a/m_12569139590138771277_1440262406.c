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
static const char *ng0 = "/root/NetFPGA-10G-live/projects/reference_nic/test/pcores/nf10_entropy_v1_00_a/hdl/verilog/ethernet_parser.v";
static int ng1[] = {0, 0, 0, 0};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};



static void Always_81_0(char *t0)
{
    char t14[8];
    char t25[16];
    char t26[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t27;
    unsigned int t28;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
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

LAB0:    t1 = (t0 + 4912U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 5480);
    *((int *)t2) = 1;
    t3 = (t0 + 4944);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(81, ng0);

LAB5:    xsi_set_current_line(82, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3360);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 48);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 48);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3520);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4000);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = (t0 + 1152);
    t6 = *((char **)t5);
    t7 = xsi_vlog_unsigned_case_compare(t4, 2, t6, 32);
    if (t7 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t7 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t7 == 1)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    xsi_set_current_line(89, ng0);

LAB12:    xsi_set_current_line(90, ng0);
    t5 = (t0 + 2320U);
    t8 = *((char **)t5);
    t5 = (t8 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (~(t9));
    t11 = *((unsigned int *)t8);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB13;

LAB14:
LAB15:    goto LAB11;

LAB9:    xsi_set_current_line(99, ng0);

LAB17:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2320U);
    t5 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t5 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t2) != 0)
        goto LAB20;

LAB21:    t8 = (t14 + 4);
    t18 = *((unsigned int *)t14);
    t19 = *((unsigned int *)t8);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB22;

LAB23:    memcpy(t29, t14, 8);

LAB24:    t60 = (t29 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t29);
    t64 = (t63 & t62);
    t65 = (t64 != 0);
    if (t65 > 0)
        goto LAB32;

LAB33:
LAB34:    goto LAB11;

LAB13:    xsi_set_current_line(90, ng0);

LAB16:    xsi_set_current_line(91, ng0);
    t15 = (t0 + 2160U);
    t16 = *((char **)t15);
    memset(t14, 0, 8);
    t15 = (t14 + 4);
    t17 = (t16 + 4);
    t18 = *((unsigned int *)t16);
    t19 = (t18 >> 16);
    *((unsigned int *)t14) = t19;
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 16);
    *((unsigned int *)t15) = t21;
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t22 & 255U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 & 255U);
    t24 = (t0 + 3680);
    xsi_vlogvar_assign_value(t24, t14, 0, 0, 8);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2000U);
    t3 = *((char **)t2);
    xsi_vlog_get_part_select_value(t25, 48, t3, 47, 0);
    t2 = (t0 + 3200);
    xsi_vlogvar_assign_value(t2, t25, 0, 0, 48);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2000U);
    t3 = *((char **)t2);
    xsi_vlog_get_part_select_value(t25, 48, t3, 95, 48);
    t2 = (t0 + 3360);
    xsi_vlogvar_assign_value(t2, t25, 0, 0, 48);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3520);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t2 = (t0 + 4000);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);
    goto LAB15;

LAB18:    *((unsigned int *)t14) = 1;
    goto LAB21;

LAB20:    t6 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB21;

LAB22:    t15 = (t0 + 2480U);
    t16 = *((char **)t15);
    memset(t26, 0, 8);
    t15 = (t16 + 4);
    t21 = *((unsigned int *)t15);
    t22 = (~(t21));
    t23 = *((unsigned int *)t16);
    t27 = (t23 & t22);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t15) != 0)
        goto LAB27;

LAB28:    t30 = *((unsigned int *)t14);
    t31 = *((unsigned int *)t26);
    t32 = (t30 & t31);
    *((unsigned int *)t29) = t32;
    t24 = (t14 + 4);
    t33 = (t26 + 4);
    t34 = (t29 + 4);
    t35 = *((unsigned int *)t24);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t38 = *((unsigned int *)t34);
    t39 = (t38 != 0);
    if (t39 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB24;

LAB25:    *((unsigned int *)t26) = 1;
    goto LAB28;

LAB27:    t17 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB28;

LAB29:    t40 = *((unsigned int *)t29);
    t41 = *((unsigned int *)t34);
    *((unsigned int *)t29) = (t40 | t41);
    t42 = (t14 + 4);
    t43 = (t26 + 4);
    t44 = *((unsigned int *)t14);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t47 = (~(t46));
    t48 = *((unsigned int *)t26);
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
    t58 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t58 & t54);
    t59 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t59 & t55);
    goto LAB31;

LAB32:    xsi_set_current_line(101, ng0);
    t66 = (t0 + 1152);
    t67 = *((char **)t66);
    t66 = (t0 + 4000);
    xsi_vlogvar_assign_value(t66, t67, 0, 0, 2);
    goto LAB34;

}

static void Always_107_1(char *t0)
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

LAB0:    t1 = (t0 + 5160U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 5496);
    *((int *)t2) = 1;
    t3 = (t0 + 5192);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(107, ng0);

LAB5:    xsi_set_current_line(108, ng0);
    t4 = (t0 + 2640U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(111, ng0);

LAB10:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(108, ng0);

LAB9:    xsi_set_current_line(109, ng0);
    t11 = (t0 + 1152);
    t12 = *((char **)t11);
    t11 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 2, 0LL);
    goto LAB8;

}


extern void nf10_entropy_v1_00_a_m_12569139590138771277_1440262406_init()
{
	static char *pe[] = {(void *)Always_81_0,(void *)Always_107_1};
	xsi_register_didat("nf10_entropy_v1_00_a_m_12569139590138771277_1440262406", "isim/isim_system_axisim.sim/nf10_entropy_v1_00_a/m_12569139590138771277_1440262406.didat");
	xsi_register_executes(pe);
}
