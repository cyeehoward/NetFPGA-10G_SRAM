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
static const char *ng0 = "/root/NetFPGA-10G-live/projects/reference_nic/test/pcores/nf10_sram_fifo_v1_00_a/hdl/verilog/mul_mod.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {4294967295U, 0U, 0U, 0U};



static void Cont_40_0(char *t0)
{
    char t3[16];
    char t5[16];
    char t7[16];
    char *t1;
    char *t2;
    char *t4;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 3296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1824U);
    t4 = *((char **)t2);
    xsi_vlog_get_part_select_value(t3, 33, t4, 31, 0);
    t2 = (t0 + 1824U);
    t6 = *((char **)t2);
    xsi_vlog_get_part_select_value(t5, 33, t6, 63, 32);
    xsi_vlog_unsigned_add(t7, 33, t3, 33, t5, 33);
    t2 = (t0 + 3960);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    xsi_vlog_bit_copy(t11, 0, t7, 0, 33);
    xsi_driver_vfirst_trans(t2, 0, 32);
    t12 = (t0 + 3864);
    *((int *)t12) = 1;

LAB1:    return;
}

static void Always_42_1(char *t0)
{
    char t13[8];
    char t15[8];
    char t38[16];
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
    char *t16;
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
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t39;

LAB0:    t1 = (t0 + 3544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 3880);
    *((int *)t2) = 1;
    t3 = (t0 + 3576);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1344U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1984U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 8);
    t5 = (t3 + 12);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t2) = t14;
    t11 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t12 = (t13 + 4);
    t16 = (t11 + 4);
    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t11);
    t19 = (t17 ^ t18);
    t20 = *((unsigned int *)t12);
    t21 = *((unsigned int *)t16);
    t22 = (t20 ^ t21);
    t23 = (t19 | t22);
    t24 = *((unsigned int *)t12);
    t25 = *((unsigned int *)t16);
    t26 = (t24 | t25);
    t27 = (~(t26));
    t28 = (t23 & t27);
    if (t28 != 0)
        goto LAB11;

LAB10:    if (t26 != 0)
        goto LAB12;

LAB13:    t30 = (t15 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t15);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(53, ng0);

LAB18:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1984U);
    t3 = *((char **)t2);
    t2 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);

LAB16:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(45, ng0);

LAB9:    xsi_set_current_line(46, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    goto LAB8;

LAB11:    *((unsigned int *)t15) = 1;
    goto LAB13;

LAB12:    t29 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(49, ng0);

LAB17:    xsi_set_current_line(50, ng0);
    t36 = (t0 + 1984U);
    t37 = *((char **)t36);
    t36 = ((char*)((ng2)));
    xsi_vlog_unsigned_minus(t38, 33, t37, 33, t36, 32);
    t39 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t39, t38, 0, 0, 32, 0LL);
    goto LAB16;

}


extern void nf10_sram_fifo_v1_00_a_m_12861524616655565629_1395687483_init()
{
	static char *pe[] = {(void *)Cont_40_0,(void *)Always_42_1};
	xsi_register_didat("nf10_sram_fifo_v1_00_a_m_12861524616655565629_1395687483", "isim/isim_system_axisim.sim/nf10_sram_fifo_v1_00_a/m_12861524616655565629_1395687483.didat");
	xsi_register_executes(pe);
}
